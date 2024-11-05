# Use the RHEL-based jenkins/inbound-agent as the base image
FROM jenkins/inbound-agent:rhel-ubi9-jdk17

# Set default environment variables (optional for further customization)
ARG MAVEN_VERSION=3.8.8
ARG MAVEN_HOME=/opt/maven

RUN curl -fsSL https://downloads.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz -o /tmp/maven.tar.gz && \
    mkdir -p ${MAVEN_HOME} && \
    tar -xzf /tmp/maven.tar.gz -C ${MAVEN_HOME} --strip-components=1 && \
    rm -f /tmp/maven.tar.gz && \
    ln -s ${MAVEN_HOME}/bin/mvn /usr/bin/mvn

# Set default environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk \
    MAVEN_HOME=${MAVEN_HOME} \
    PATH=${MAVEN_HOME}/bin:$PATH
# Confirm Java version (optional but useful for debugging)
RUN java -version && mvn --version

# Define the default command (inherited from base image)
CMD ["jenkins-agent"]
