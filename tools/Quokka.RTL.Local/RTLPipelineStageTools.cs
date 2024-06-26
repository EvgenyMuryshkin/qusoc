﻿using Quokka.RTL.Tools;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;

namespace Quokka.RTL.Local
{
    [RTLToolkitType]
    public class RTLPipelineStageTools
    {
        static List<MemberInfo> GetAllFields(Type type)
        {
            var result = new List<MemberInfo>();
            if (type == null || type == typeof(object))
                return result;

            const BindingFlags FieldFlags = BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.Instance | BindingFlags.FlattenHierarchy;

            result.AddRange(type.GetFields(FieldFlags));
            result.AddRange(GetAllFields(type.BaseType));

            return result;
        }

        // https://stackoverflow.com/questions/17441420/how-to-set-value-for-property-of-an-anonymous-object
        public static MemberInfo getBackingField(object value, MemberInfo member)
        {
            var type = value.GetType();

            if (member is FieldInfo)
                return member;

            var memberName = member.Name;

            string[] backingFieldNames = { 
                $"<{memberName}>i__Field",
                $"<{memberName}>k__BackingField",
                $"<{memberName}>" 
            };

            var allFields = GetAllFields(type);
            var fi = allFields.FirstOrDefault(f => backingFieldNames.Contains(f.Name));

            if (fi == null)
                throw new NotSupportedException($"Cannot find backing field for {memberName}");

            return fi;
        }

        public static T RecurviseResetToDefaults<T>(T value)
        {
            var type = value.GetType();
            foreach (var m in RTLReflectionTools.SynthesizableMembers(type))
            {
                var memberType = m.GetMemberType();
                var memberValue = m.GetValue(value);
                var backingField = getBackingField(value, m);

                if (memberValue is RTLBitArray bitArray)
                {
                    backingField.SetValue(value, new RTLBitArray().Resized(bitArray.Size).TypeChanged(bitArray.DataType));
                    continue;
                }

                if (memberType.IsNative())
                {
                    backingField.SetValue(value, Activator.CreateInstance(memberType));
                    continue;
                }

                if (RTLTypeCheck.IsSynthesizableObject(memberType))
                {
                    RecurviseResetToDefaults(memberValue);
                    continue;
                }

                if (RTLTypeCheck.IsSynthesizableSignalType(memberType))
                {
                    if (RTLReflectionTools.TryGetNullableType(memberType, out var actualType))
                    {
                        backingField.SetValue(value, Activator.CreateInstance(actualType));
                    }
                    else
                    {
                        backingField.SetValue(value, Activator.CreateInstance(memberType));
                    }
                    continue;
                }

                if (RTLModuleHelper.IsSynthesizableArrayType(memberType))
                {
                    var emptyArray = Array.CreateInstance(memberType.GetElementType(), (memberValue as Array).Length);
                    backingField.SetValue(value, emptyArray);
                    continue;
                }
            }

            return value;
        }

        public static void CarryOverAutoPropagateValues<TSource, TTarget>(TSource source, TTarget target)
        {
            var sourceType = typeof(TSource);
            var sourceMembers = RTLReflectionTools.SynthesizableMembers(sourceType);

            var targetType = typeof(TTarget);
            var targetMembers = RTLReflectionTools.SynthesizableMembers(targetType);

            foreach (var m in targetMembers)
            {
                var targetValue = m.GetValue(target);
                if (targetValue != null)
                    return;

                var sourceMember = sourceMembers.SingleOrDefault(s => s == m);
                if (sourceMember == null)
                    throw new Exception($"Member value is null on target ({targetType}.{m.Name}). Source type {sourceType.Name} does not contain fallback member");

                var carryOverValue = sourceMember.GetValue(source);
                if (carryOverValue == null)
                    throw new Exception($"Member value is null on target ({targetType}.{m.Name}). Source type {sourceType.Name} returned null fallback value");

                var backingField = getBackingField(target, m);
                backingField.SetValue(target, carryOverValue);
            }
        }
    }
}
