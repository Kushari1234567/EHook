FROM ubuntu:latest
RUN apt-get update && apt-get install -y git build-essential wget unzip
# Install Android NDK to compile the hook code
RUN wget https://google.com && \
    unzip android-ndk-r26b-linux.zip && mv android-ndk-r26b /opt/ndk
ENV PATH="${PATH}:/opt/ndk"
WORKDIR /app
COPY . .
RUN ndk-build
