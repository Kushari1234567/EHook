FROM ubuntu:latest

# Install base dependencies
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Download and extract the authentic Android NDK package
RUN wget https://google.com && \
    unzip android-ndk-r26b-linux.zip && \
    mv android-ndk-r26b /opt/ndk && \
    rm android-ndk-r26b-linux.zip

# Set the NDK environment path
ENV PATH="${PATH}:/opt/ndk"

# Set up the workspace
WORKDIR /app
COPY . .

# Run the compilation command required for EHook
RUN ndk-build
