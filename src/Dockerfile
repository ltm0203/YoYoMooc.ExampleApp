FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
# FROM registry.cn-hangzhou.aliyuncs.com/yoyosoft/dotnet/core/aspnet:3.1
COPY scripts/outputs/web /app
WORKDIR /app
EXPOSE 80/tcp
ENTRYPOINT ["dotnet", "YoYoMooc.ExampleApp.dll"]