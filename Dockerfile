FROM jenkins/inbound-agent:4.3-9-alpine as jnlp

FROM subodhhatkar/maven-sonar-scanner:4.4.0-maven-3.6.3-openjdk-11.0.8-slim

COPY --from=jnlp /usr/local/bin/jenkins-agent /usr/local/bin/jenkins-agent
COPY --from=jnlp /usr/share/jenkins/agent.jar /usr/share/jenkins/agent.jar

ENTRYPOINT ["/usr/local/bin/jenkins-agent"]