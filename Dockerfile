FROM jenkins/inbound-agent:4.3-4-alpine as jnlp

FROM subodhhatkar/maven-sonar-scanner:3.6.3-openjdk-11.0.7-slim

COPY --from=jnlp /usr/local/bin/jenkins-agent /usr/local/bin/jenkins-agent
COPY --from=jnlp /usr/share/jenkins/agent.jar /usr/share/jenkins/agent.jar

ENTRYPOINT ["/usr/local/bin/jenkins-agent"]