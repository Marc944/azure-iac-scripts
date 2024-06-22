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
ENV AZURE_CLIENT_ID="284d9e06-b088-40cf-b4a2-295f748453c2"
ENV AZURE_TENANT_ID="bd4f0481-b137-40f1-9e64-20cfd55fbf49"
ENV AZURE_CLIENT_SECRET="A.S8Q~VHLc9L3CRFoZNwKwMGoS4Qj_spWp076bCY"

# Run app.py when the container launches
CMD ["python", "app.py"]
