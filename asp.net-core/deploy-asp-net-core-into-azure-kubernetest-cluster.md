# Build ASP.NET Core applications deployed as Linux containers into an AKS/Kubernetes orchestrator

Create an ASP.NET Core Web API

### Add Docker support

Create Dockerfile

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


### Create an ACR instance

