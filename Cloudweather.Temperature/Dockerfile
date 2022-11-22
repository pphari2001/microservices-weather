FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /source
COPY . .
RUN dotnet restore "./Cloudweather.Temperature.csproj" --disable-parallel
RUN dotnet publish "./Cloudweather.Temperature.csproj" -c release -o /app --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build /app ./

EXPOSE 5000

ENTRYPOINT ["dotnet", "Cloudweather.Temperature.dll"]