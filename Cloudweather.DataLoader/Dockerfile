#Build Stage
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /source
COPY . .
RUN dotnet restore "./Cloudweather.DataLoader.csproj" --disable-parallel
RUN dotnet publish "./Cloudweather.DataLoader.csproj" -c release -o /app --no-restore

# Serve Stage
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build /app ./

ENTRYPOINT ["dotnet", "Cloudweather.DataLoader.dll"]