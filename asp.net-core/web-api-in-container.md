# Conatinerised ASP.NET Core Web API

This is to develop and deploy ASP.NET Core based APIs to Azure in container.

### Resources

* https://docs.microsoft.com/en-us/dotnet/architecture/microservices/docker-application-development-process/docker-app-development-workflow

### Create a project.

I've used Rider and ticked on Docker container support. It created `Dockerfile` automatically.

```Dockerfile
FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["src/Wynwyn.Apis/Wynwyn.Apis.csproj", "Wynwyn.Apis/"]
RUN dotnet restore "src/Wynwyn.Apis/Wynwyn.Apis.csproj"
COPY . .
WORKDIR "/src/Wynwyn.Apis"
RUN dotnet build "Wynwyn.Apis.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Wynwyn.Apis.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Wynwyn.Apis.dll"]

```
