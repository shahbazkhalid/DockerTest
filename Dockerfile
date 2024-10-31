# Use the official Python 3.11 image from Docker Hub
FROM python:3.11-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the hello_world.py script to the container
COPY hello_world.py .

# Command to run the Python script
CMD ["python", "hello_world.py"]
