# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt /app/

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . /app/

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Set environment variables for Azure Key Vault access
ENV AZURE_CLIENT_ID="<Can be pulled from Azure App Registrations with name jenkins>"
ENV AZURE_TENANT_ID="<Can be pulled from Azure App Registrations with name jenkins>"
ENV AZURE_CLIENT_SECRET="<Can be pulled from Azure Key Vault with the secret name jenkins-rbac-sp-secret>"

# Run app.py when the container launches
CMD ["python", "app.py"]
