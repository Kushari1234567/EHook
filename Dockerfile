FROM ubuntu:latest

# 1. Install system utilities needed for building C projects
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# 2. Download and unpack the actual Android NDK package from Google's servers
RUN wget https://google.com && \
    unzip android-ndk-r26b-linux.zip && \
    mv android-ndk-r26b /opt/ndk && \
    rm android-ndk-r26b-linux.zip

# 3. Add the compiler path to the system environment variables
ENV PATH="${PATH}:/opt/ndk"

# 4. Set the operational directory inside the container
WORKDIR /app
COPY . .

# 5. Execute the build file included in EHook
RUN ndk-build
