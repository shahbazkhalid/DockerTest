# Use Amazon Linux 2023 minimal base image
FROM public.ecr.aws/amazonlinux/amazonlinux:2023-minimal

# Install Python, pip, and any necessary build tools
RUN dnf install -y python3 python3-pip shadow-utils \
    # && dnf update libarchive --releasever 2023.6.20241028 \
    # && dnf update python3.11-setuptools --releasever 2023.6.20241028 \
    # && dnf update python-setuptools --releasever 2023.1.20230719 \
    # && dnf update python-pip --releasever 2023.3.20231211 \
    && rm -rf /var/cache/dnf \
    && dnf clean all
    

# Set the working directory
WORKDIR /app

# Copy requirements.txt first to leverage Docker caching
COPY requirements.txt .


# Create a non-root user and set permissions
# RUN useradd -m appuser

# Set the working directory
WORKDIR /app

# Copy your application files 
COPY ./hello_world.py .

# Install Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt \
    && useradd -m appuser \
    && chown -R appuser:appuser /app \ 
    && dnf clean all 

# Switch to the non-root user
USER appuser

# Command to run your application
CMD ["python3", "hello_world.py"]
