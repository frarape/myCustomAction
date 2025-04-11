# Container image that runs your code
FROM alpine:3.10

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY --chmod=0755 build/myCustomAction.linux ./myCustomAction

# Code file to execute when the docker container starts up
ENTRYPOINT ["./myCustomAction"]