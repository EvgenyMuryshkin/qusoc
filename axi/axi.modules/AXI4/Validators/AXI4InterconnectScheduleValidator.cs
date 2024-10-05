using HLS.Visitors;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Quokka.Core.Logging;
using Quokka.Public.Logging;
using Quokka.RTL.Tools;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace axi.modules
{
    public class AXI4InterconnectScheduleValidator : IRTLModuleScheduleValidator
    {
        private readonly ILogStream _logStream;
        private readonly Resolver _resolver;
        public AXI4InterconnectScheduleValidator(
            ILogStream logStream,
            Resolver resolver
        )
        {
            _logStream = logStream;
            _resolver = resolver;
        }

        void ReportNode(string message, SyntaxNode node)
        {
            _logStream.WriteLine(DirectoryLogging.Summary, $"{message}: {(node?.GetType()?.Name ?? "{null}")}");
        }

        void ReportUnsupported(string message, SyntaxNode node)
        {
            throw new Exception($"Unsuported {message}: {node?.GetType()?.Name} {node}");
        }

        public void Validate(SyntaxNode schedule)
        {
            var signalsUsage = new Dictionary<string, List<SyntaxNode>>();

            Action<SyntaxNode> reportSignal = (signal) =>
            {
                var text = signal.ToString();
                if (!signalsUsage.ContainsKey(text))
                {
                    signalsUsage[text] = new List<SyntaxNode>();
                }

                signalsUsage[text].Add(signal);
            };

            var allSchedules = schedule
                .SelfWithChildren<InvocationExpressionSyntax>()
                .Where(i => i.ArgumentList.Arguments.OneOrDefault() != null)
                ;

            var allAssignments = allSchedules
                .SelectMany(i => i.SelfWithChildren<AssignmentExpressionSyntax>())
                .ToList();
                ;

            Action<SyntaxNode> processNode = null;
            processNode = (node) =>
            {
                var type = _resolver.ResolveType(node);

                if (type.IsArray)
                {
                    switch (node)
                    {
                        case ArrayCreationExpressionSyntax aces:
                            foreach (var item in aces.Initializer.Expressions)
                            {
                                processNode(item);
                            }
                            break;
                        case CollectionExpressionSyntax ces:
                            foreach (var item in ces.Elements)
                            {
                                processNode(item);
                            }
                            break;
                        default:
                            var elementType = type.GetElementType();
                            _logStream.WriteLine(DirectoryLogging.Summary, $"Unsupported array element: {elementType}, {node.GetType().Name}");
                            break;
                    }
                }
                else if (type == typeof(AXI4_M2S))
                {
                    reportSignal(node);
                }
                else if (type == typeof(AXI4_S2M))
                {
                    reportSignal(node);
                }
            };

            allAssignments.ForEach(s =>
            {
                processNode(s.Right);
            });

            var duplicateUsage = signalsUsage.Where(s => s.Value.Count > 1).ToList();
            if (duplicateUsage.Any())
            {
                var duplicateUsageSignals = duplicateUsage.Select(s => s.Key).Join(", ");
                throw new Exception($"Duplicate signals usage found in interconnect schedule: {duplicateUsageSignals}");
            }
        }
    }
}
