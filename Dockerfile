# Use the official Python 3.11 image from Docker Hub
FROM python:3.10-slim

# Install required tools for building zlib
RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Download and install zlib 1.3.1
RUN wget https://zlib.net/zlib-1.3.1.tar.gz && \
    tar -xzf zlib-1.3.1.tar.gz && \
    cd zlib-1.3.1 && \
    ./configure && make && make install && \
    cd .. && rm -rf zlib-1.3.1 zlib-1.3.1.tar.gz

# Clean up build dependencies
RUN apt-get purge -y build-essential && apt-get autoremove -y

# Set the working directory inside the container
WORKDIR /app

# Copy the hello_world.py script to the container
COPY hello_world.py .

# Command to run the Python script
CMD ["python", "hello_world.py"]
