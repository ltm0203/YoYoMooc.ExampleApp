FROM mcr.microsoft.com/dotnet/core/sdk:3.1.201-buster AS build
WORKDIR /source

# copy csproj and restore as distinct layers
COPY ./src/ .

RUN dotnet restore

RUN dotnet publish -c release -o /app --no-restore

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1.3-buster-slim AS base
# FROM registry.cn-hangzhou.aliyuncs.com/yoyosoft/dotnet/core/aspnet:3.1

WORKDIR /app
COPY --from=build /app ./

EXPOSE 80
ENTRYPOINT ["dotnet", "YoYoMooc.ExampleApp.dll"]