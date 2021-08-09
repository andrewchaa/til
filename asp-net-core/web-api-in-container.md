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
# COPY ["src/Wynwyn.Apis/Wynwyn.Apis.csproj", "src/Wynwyn.Apis/"]
# RUN dotnet restore "src/Wynwyn.Apis/Wynwyn.Apis.csproj"
# RUN dotnet build "/src/Wynwyn.Apis/Wynwyn.Apis.csproj" -c Release -o /app/build
COPY . .
RUN dotnet restore
COPY . .
WORKDIR "/src"
RUN dotnet build -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Wynwyn.Apis.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Wynwyn.Apis.dll"]
```

### Create your custom Docker images and embed the application

```
docker build -t andrew/wynwyn-apis .

docker images
```

### Build and run your Docker application

```
docker run -t -d -p 5000:80 andrew/wynwyn-apis

# to view running docker process
docker ps

# to stop the docker container
docker stop xxxx
```
