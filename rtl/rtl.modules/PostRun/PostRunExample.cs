﻿using Quokka.Public.Logging;
using Quokka.Public.Tools;
using Quokka.Public.Transformation;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace RTL.Modules.PostRun
{
    // Example of code-defined post run handler
    // Every exposed assembly type, that implements ILowLevelTransformationPostRun interface
    // will be constructed and called.
    // USE WITH CAUTION
    // All runtime artefacts are injected into class constructor.
    public class PostRunExample : ILowLevelTransformationPostRun
    {
        private readonly ILogStream _logStream;
        private readonly VirtualFS _virtualFS;
        public PostRunExample(ILogStream logStream, VirtualFS virtualFS)
        {
            _logStream = logStream;
            _virtualFS = virtualFS;
        }

        public void Run()
        {
            _logStream.WriteLine(DirectoryLogging.Summary, $"Post run called from code");

            foreach (var fileName in _virtualFS.RecursiveFileNames.Where(f => Path.GetFileNameWithoutExtension(f) != "Quokka"))
            {
                _logStream.WriteLine(DirectoryLogging.Summary, $"Generated file: {fileName}");
            }
            _logStream.WriteLine(DirectoryLogging.Summary, $"======================================");
        }
    }
}
