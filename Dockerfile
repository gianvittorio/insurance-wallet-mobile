# Install dependencies
FROM ubuntu:18.04
RUN apt-get update 
RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3 psmisc
RUN apt-get clean

# Clone the flutter repo
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

# Set flutter path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Enable flutter web
RUN flutter channel stable
RUN flutter upgrade
RUN flutter config --enable-web

# Run flutter doctor
RUN flutter doctor -v

# Copy the app files to the container
COPY . /usr/local/bin/insurancewalletmobile

# Set the working directory to the app files within the container
WORKDIR /usr/local/bin/insurancewalletmobile

# Get App Dependencies
RUN flutter pub get

# Build the app for the web
RUN flutter build web

# Document the exposed port
EXPOSE 4040/tcp

# Set the server startup script as executable
RUN ["chmod", "+x", "/usr/local/bin/insurancewalletmobile/server/server.sh"]

# Start the web server
ENTRYPOINT [ "/usr/local/bin/insurancewalletmobile/server/server.sh" ]
