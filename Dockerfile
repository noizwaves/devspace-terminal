FROM debian:buster

RUN apt-get update && apt-get install -y \
        git \
        bash \
        curl \
        openssh-client \
        vim \
        procps \
        tmux \
        apt-transport-https \
        ca-certificates

# buildx CLI
RUN curl -fsOL https://github.com/docker/buildx/releases/download/v0.5.1/buildx-v0.5.1.linux-amd64 && \
    chmod +x buildx-v0.5.1.linux-amd64 && \
    mv buildx-v0.5.1.linux-amd64 /usr/local/bin/buildx

# DevSpace CLI
RUN curl -fsOL https://github.com/loft-sh/devspace/releases/download/v5.12.2/devspace-linux-amd64 && \
    chmod +x devspace-linux-amd64 && \
    mv devspace-linux-amd64 /usr/local/bin/devspace

# kubectl
RUN curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list && \
    apt-get update && \
    apt-get install -y kubectl

# gh CLI
#RUN curl -fsOL https://github.com/cli/cli/releases/download/v1.9.2/gh_1.9.2_linux_amd64.tar.gz && \
#    tar -zxf gh_1.9.2_linux_amd64.tar.gz && \
#    chown -R root:root gh_1.9.2_linux_amd64 && \
#    cp gh_1.9.2_linux_amd64/bin/* /usr/local/bin && \
#    cp -R gh_1.9.2_linux_amd64/share/* /usr/local/share &&
#    rm -rf gh_1.9.2_linux_amd64 gh_1.9.2_linux_amd64.tar.gz

RUN groupadd --gid 1000 -r terminal-user && useradd --uid 1000 --no-log-init -r -m -g terminal-user terminal-user
USER terminal-user
WORKDIR /home/terminal-user

# Loft plugin for DevSpace
RUN devspace add plugin https://github.com/loft-sh/loft-devspace-plugin
