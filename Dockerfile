# Use the RHEL-based jenkins/inbound-agent as the base image
FROM jenkins/inbound-agent:rhel-ubi9-jdk17

# Set default environment variables (optional for further customization)
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk

# Confirm Java version (optional but useful for debugging)
RUN java -version

# Define the default command (inherited from base image)
CMD ["jenkins-agent"]
