```
# Use the official .NET SDK image to build the application
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env
WORKDIR /app

# Copy everything and restore dependencies
COPY . ./
RUN dotnet restore
RUN dotnet add package MySql.Data

# Build the application, it build the application and all its dependencies into a folder named out
# The -c Release flag specifies that we want to build the application in Release mode
RUN dotnet publish -c Release -o out

# Use the official ASP.NET Core runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app

# Copy the published files from the build image
COPY --from=build-env /app/out .

# Set the entry point to run the application
ENTRYPOINT ["dotnet", "ElearnBackend.dll"]
```
## You can use this also but the image size will be large.
```
# # Use the official .NET SDK image to build the application
# FROM mcr.microsoft.com/dotnet/sdk:8.0
# WORKDIR /app

# # Copy everything and restore dependencies
# COPY . ./
# RUN dotnet restore

# # Build the application
# RUN dotnet publish -c Release -o out

# # Set the entry point to run the application
# ENTRYPOINT ["dotnet", "ElearnBackend.dll"]
```
