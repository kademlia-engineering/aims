# Use a base image with the desired OS and necessary tools
FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3-pip \
    curl \
    wget

# Copy the "run.sh" script from the current directory to the Docker image
COPY run.sh /run.sh

# Set the working directory to the root
WORKDIR /

# Give execute permissions to the "run.sh" script
RUN chmod +x /run.sh

# Set environment variable for the host
ENV HOST=0.0.0.0
ENV PORT=8080

# Expose port 8080 for the web server
EXPOSE 8080

# Run the "run.sh" script to start the web server
CMD ["/run.sh"]
