# Set the base image to use for subsequent instructions
FROM debian:bookworm-slim

# Disable interactive mode
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install --no-install-recommends -y \
    gpg ca-certificates curl \
    && rm -rf /var/lib/apt/lists/*

# Download the repository key to a root owned temporary directory
RUN curl repo.data.kit.edu/repo-data-kit-edu-key.gpg \
    | gpg --dearmor \
    > /etc/apt/trusted.gpg.d/kitrepo-archive.gpg

# Add the repository to the list of sources
COPY --chown=root:root kitrepo.list /etc/apt/sources.list.d/

# Update the image to the latest packages and reduce the size of the image
RUN apt update && apt install --no-install-recommends -y \
    mytoken \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /usr/src

# Copy any source file(s) required for the action
# COPY entrypoint.sh .

# Configure the container to be run as an executable
# ENTRYPOINT ["/usr/src/entrypoint.sh"]
ENTRYPOINT [ "mytoken" ]

