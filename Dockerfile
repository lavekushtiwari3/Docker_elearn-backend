FROM mcr.microsoft.com/dotnet/sdk:8.0 AS baseimage
WORKDIR /ElearnBackendapp
COPY . .
RUN dotnet restore
RUN dotnet build --configuration Release
RUN dotnet publish -c Release -o ./publish

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS chotaimage
WORKDIR /ElearnBackendapp
COPY --from=baseimage /ElearnBackendapp/publish .  
ENTRYPOINT dotnet ElearnBackend.dll

