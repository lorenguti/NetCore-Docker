FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /code
COPY . .
run dotnet restore
run dotnet publish --output /output --configuration Release
from mcr.microsoft.com/dotnet/core/aspnet:3.1
copy --from=build /output /app
workdir /app
entrypoint ["dotnet","AspNetCoreOnDocker.dll"]