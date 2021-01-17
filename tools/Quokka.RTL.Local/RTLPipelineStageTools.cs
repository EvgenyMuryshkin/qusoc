using System;
using System.Linq;
using System.Reflection;

namespace Quokka.RTL.Local
{
    [RTLToolkitType]
    public class RTLPipelineStageTools
    {
        // https://stackoverflow.com/questions/17441420/how-to-set-value-for-property-of-an-anonymous-object

        static MemberInfo getBackingField(object value, MemberInfo member)
        {
            var type = value.GetType();

            if (member is FieldInfo)
                return member;

            var memberName = member.Name;
            const BindingFlags FieldFlags = BindingFlags.NonPublic | BindingFlags.Instance;
            string[] backingFieldNames = { $"<{memberName}>i__Field", $"<{memberName}>" };

            var fi = type
                .GetFields(FieldFlags)
                .FirstOrDefault(f => backingFieldNames.Contains(f.Name));

            if (fi == null)
                throw new NotSupportedException($"Cannot find backing field for {memberName}");

            return fi;
        }

        public static T RecurviseResetToDefaults<T>(T value)
        {
            var type = value.GetType();
            foreach (var m in RTLModuleHelper.SynthesizableMembers(type))
            {
                var memberType = m.GetMemberType();
                var memberValue = m.GetValue(value);
                var backingField = getBackingField(value, m);

                if (RTLModuleHelper.IsSynthesizableSignalType(memberType))
                {
                    if (RTLModuleHelper.TryGetNullableType(memberType, out var actualType))
                    {
                        backingField.SetValue(value, Activator.CreateInstance(actualType));
                    }
                    else
                    {
                        backingField.SetValue(value, Activator.CreateInstance(memberType));
                    }
                    continue;
                }

                if (RTLModuleHelper.IsSynthesizableObject(memberType))
                {
                    RecurviseResetToDefaults(memberValue);
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
            var sourceMembers = RTLModuleHelper.SynthesizableMembers(sourceType);

            var targetType = typeof(TTarget);
            var targetMembers = RTLModuleHelper.SynthesizableMembers(targetType);

            foreach (var m in targetMembers)
            {
                var targetValue = m.GetValue(target);
                if (targetValue != null)
                    return;

                var sourceMember = sourceMembers.SingleOrDefault(s => s == m);
                if (sourceMember == null)
                    throw new Exception($"Member value is null on target ({targetType}.{m.Name}). Source type {sourceType.Name} does not containe fallback member");

                var carryOverValue = sourceMember.GetValue(source);
                if (carryOverValue == null)
                    throw new Exception($"Member value is null on target ({targetType}.{m.Name}). Source type {sourceType.Name} returned null fallback value");

                var backingField = getBackingField(target, m);
                backingField.SetValue(target, carryOverValue);
            }
        }
    }
}
