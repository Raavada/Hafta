# Use the official Python image from the Docker Hub
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements2.txt .

# Install numpy first
RUN pip install --no-cache-dir numpy==1.21.0

# Install the required packages
RUN pip install --no-cache-dir -r requirements2.txt

# Copy the rest of the application code into the container
COPY . .

# Set the environment variable for Flask
ENV FLASK_APP=run.py

# Expose the port on which the app will run
EXPOSE 5000

# Command to run the application
CMD ["flask", "run", "--host=0.0.0.0"]
