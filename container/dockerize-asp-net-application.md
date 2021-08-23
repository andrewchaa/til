# Dockerize a .NET application

### ASP.NET Core 

* Right-click on the project > Add > Docker Support
* It will ceate `Dockerfile`

Multi-stage docker file

```Dockerfile
# set up base image with aspnet runtime and expose ports
FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

# use full sdk as build container
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["src/Fonoa.TaxAuthorityEmulator/Fonoa.TaxAuthorityEmulator.csproj", "Fonoa.TaxAuthorityEmulator/"]

# restore packages and build project
RUN dotnet restore "src/Fonoa.TaxAuthorityEmulator/Fonoa.TaxAuthorityEmulator.csproj"
COPY . .
WORKDIR "/src/Fonoa.TaxAuthorityEmulator"
RUN dotnet build "Fonoa.TaxAuthorityEmulator.csproj" -c Release -o /app/build

# alias build as publish and run dotnet publish
FROM build AS publish
RUN dotnet publish "Fonoa.TaxAuthorityEmulator.csproj" -c Release -o /app/publish

# copy published files into final image
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Fonoa.TaxAuthorityEmulator.dll"]
```

Open a command prompt and navigate to your project folder.

Use the following commands to build and run your Docker image:

    docker build -t aspnetapp .
    docker run -d -p 8080:80 --name myapp aspnetapp
    
    
