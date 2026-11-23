#!/bin/bash
set -e

# Install ODBC libraries
sudo apt-get update
sudo apt-get install -y unixodbc unixodbc-dev

# Add Microsoft repository and install SQL Server ODBC driver
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
curl https://packages.microsoft.com/config/debian/11/prod.list | sudo tee /etc/apt/sources.list.d/mssql-release.list
sudo apt-get update
sudo ACCEPT_EULA=Y apt-get install -y msodbcsql18
odbcinst -q -d

# Install Azure Functions Core Tools
npm install -g azure-functions-core-tools@4 --unsafe-perm true

# Install Python dependencies
pipenv install --dev