ARG CODE_SERVER_VERSION

FROM codercom/code-server:$CODE_SERVER_VERSION

USER root

RUN curl -O https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && rm packages-microsoft-prod.deb \
    && apt-get update \
    && apt-get install -y apt-transport-https \
    && apt-get update \
    && apt-get install -y dotnet-sdk-6.0 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER 1000

ENV DOTNET_CLI_TELEMETRY_OPTOUT=1