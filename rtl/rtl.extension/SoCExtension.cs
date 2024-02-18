using Autofac.Core;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using static Microsoft.Extensions.DependencyInjection.NewtonsoftJsonMvcBuilderExtensions;
using Quokka.Core.Bootstrap;
using Quokka.Extension.Interop;
using soc;
using System;
using System.IO;
using System.Net;
using System.Xml.Linq;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System.Threading.Tasks;
using QuokkaIntegrationTests;


namespace System
{
    public static class TypeExptensions
    {
        public static string TypeName(this Type type)
        {
            return $"{type.FullName}, {type.Assembly.GetName().Name}";
        }
    }
}

namespace rtl.extension
{
    public static class HttpContextExtensions
    {
        public static async Task ToJson<T>(this HttpContext context, T response)
        {
            var json = JsonConvert.SerializeObject(
                response, 
                new JsonSerializerSettings()
                {
                    TypeNameHandling = TypeNameHandling.Objects
                }
            );
            context.Response.ContentType = "application/json";
            context.Response.StatusCode = (int)HttpStatusCode.OK;
            await context.Response.WriteAsync(json);
        }

        public static async Task<T> FromJson<T>(this HttpContext context)
        {
            using (var reader = new StreamReader(context.Request.Body))
            {
                var jsonPayload = await reader.ReadToEndAsync();
                Console.WriteLine(jsonPayload);
                var result = JsonConvert.DeserializeObject<T>(
                    jsonPayload,
                    new JsonSerializerSettings()
                    {
                        TypeNameHandling = TypeNameHandling.Objects
                    }
                );
                return result;
            }
        }
    }

    [ExtensionClass]
    public class SoCExtension
    {
        [ExtensionMethod(icon: TopLevelIcon.Translate)]
        public static void SoCBuilder()
        {
            var builder = WebApplication.CreateBuilder();
            builder
                .Services
                .AddCors(c =>
                {
                    c.AddPolicy("*", (b) =>
                    {
                        b.AllowAnyHeader().AllowAnyMethod().AllowAnyOrigin();
                    });
                });

            builder
                .Services
                .AddControllers(options =>
                {
                    options.EnableEndpointRouting = false;
                })
                .AddNewtonsoftJson(options =>
                {
                    options.SerializerSettings.ContractResolver = new DefaultContractResolver();
                    options.SerializerSettings.TypeNameHandling = TypeNameHandling.Objects;
                    options.SerializerSettings.ObjectCreationHandling = ObjectCreationHandling.Replace;
                });

            var app = builder.Build();
            app.UseCors(builder => builder
                .AllowAnyOrigin()
                .AllowAnyMethod()
                .AllowAnyHeader()
            );

            app.MapGet("/", () =>
            {
                return Results.Ok("Hello World!");
            });

            app.MapGet("/status", (ctx) => ctx.ToJson(new { Status = true }));
            app.MapGet("/components", async (ctx) =>
            {
                await ctx.ToJson(
                    new SoCComponentInfo[]
                    {
                        new SoCComponentInfo() { Name = typeof(Interconnect).TypeName(), DisplayName = typeof(Interconnect).Name, IsTopLevel = true},
                        new SoCComponentInfo() { Name = typeof(Gateway).TypeName(), DisplayName = typeof(Gateway).Name, IsTopLevel = true },
                        new SoCComponentInfo() { Name = typeof(RISCV).TypeName(), DisplayName = typeof(RISCV).Name, IsMaster = true },
                        new SoCComponentInfo() { Name = typeof(Register).TypeName(), DisplayName = typeof(Register).Name, IsSlave = true },
                        new SoCComponentInfo() { Name = typeof(MemoryBlock).TypeName(), DisplayName = typeof(MemoryBlock).Name, IsSlave = true },
                    }
                );
            });

            app.MapPost("/soc/update", async (ctx) =>
            {
                var soc = await ctx.FromJson<SoC>();
                var json = JsonConvert.SerializeObject(
                    soc, 
                    Formatting.Indented,
                    new JsonSerializerSettings()
                    {
                        TypeNameHandling = TypeNameHandling.Objects
                    }
                );

                Console.WriteLine(json);

                var solutionPath = TestPathTools.SolutionLocation();
                var websocPath = Path.Combine(solutionPath, @"qusoc\qusoc.demos\apps\WebSoC");
                var websocJson = Path.Combine(websocPath, "websoc.json");
                File.WriteAllText(websocJson, json);

                await ctx.ToJson(new { Status = true });
            });

            app.Run("http://localhost:5001");
        }
    }
}
