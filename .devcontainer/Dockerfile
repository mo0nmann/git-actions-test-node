# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.177.0/containers/javascript-node/.devcontainer/base.Dockerfile

# [Choice] Node.js version: 16, 14, 12
ARG VARIANT="20"
FROM mcr.microsoft.com/devcontainers/typescript-node:dev-${VARIANT}

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

# [Optional] Uncomment if you want to install an additional version of node using nvm
# ARG EXTRA_NODE_VERSION=10
# RUN su node -c "source /usr/local/share/nvm/nvm.sh && nvm install ${EXTRA_NODE_VERSION}"

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
    sudo apt-get update && \
    sudo apt-get install -y google-chrome-stable xvfb

# [Optional] Uncomment if you want to install more global node modules
RUN sudo -u node npm install -g npm @angular/cli @angular/core