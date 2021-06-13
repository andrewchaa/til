# Build ASP.NET Core applications deployed as Linux containers into an AKS/Kubernetes orchestrator

Create an ASP.NET Core Web API

### Add Docker support

[Dockerise ASP.NET Core](https://docs.docker.com/samples/dotnetcore/)

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

To see running docker container 

```
~/d/wynwynapi ❯❯❯ docker container ls                                                                                                                                                                                                              ✘ 130 main
CONTAINER ID   IMAGE                COMMAND                  CREATED      STATUS      PORTS                           NAMES
c3c070ed55b1   andrew/wynwyn-apis   "dotnet Wynwyn.Apis.…"   4 days ago   Up 4 days   443/tcp, 0.0.0.0:5000->80/tcp   zealous_knuth
```

To kill a running container

```
docker kill zealous_knuth
```

To run the docker repository

```
docker run -d -p 5000:80 --name myapp andrew/wynwyn-apis
```

### Create an ACR instance

```
az acr create --name wynwynapi --resource-group wynwyn --sku basic --admin-enabled
az acr list --resource-group wynwyn --query "[].{acrLoginServer:loginServer}" --output table
```

Now you can tag the image, taking the latest image (the Release image), with the command

```
docker tag andrew/wynwyn-apis:latest wynwynapi.azurecr.io/andrew/wynwyn-apis:v1
docker images
```

### Push the image into the Azure ACR

