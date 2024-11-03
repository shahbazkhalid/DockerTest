# Use the official Python 3.11 image from Docker Hub
# FROM ubuntu:noble

FROM python:3.12.7-slim-bookworm

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Install necessary packages
RUN apt-get update -qy && \
    apt-get install -qyy \
    -o APT::Install-Recommends=false \
    -o APT::Install-Suggests=false \
    ca-certificates \
#    python3 \
#    python3-pip \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# RUN apt-get -y remove python3-setuptools

# Upgrade setuptools to the latest secure version
# RUN pip install --upgrade setuptools

# Set the working directory inside the container
WORKDIR /app

# Copy the hello_world.py script to the container
# COPY hello_world.py .

# Command to run the Python script
# CMD ["python3", "hello_world.py"]

# Create a Python script to check setuptools version
RUN echo 'import setuptools; print("setuptools version:", setuptools.__version__)' > check_setuptools.py

# Run the script to check the version of setuptools
CMD ["python3", "check_setuptools.py"]
