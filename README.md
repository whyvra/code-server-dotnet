# code-server-dotnet

[![GitHub Build](https://img.shields.io/github/workflow/status/whyvra/code-server-dotnet/Build%20Docker%20image?style=flat-square)](https://github.com/whyvra/code-server-dotnet/actions)
[![Docker Pulls](https://img.shields.io/docker/pulls/whyvra/code-server-dotnet?style=flat-square)](https://hub.docker.com/r/whyvra/code-server-dotnet)
[![LICENSE](https://img.shields.io/badge/license-MIT-blue?style=flat-square)](https://github.com/whyvra/code-server-dotnet/blob/master/LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

A docker image based on `code-server` with added support for the .NET 8.0 SDK.

## Usage

```bash
# This will start a code-server container and expose it at http://127.0.0.1:8080.
# It will also mount your current directory into the container as `/home/coder/project`
# and forward your UID/GID so that all file system operations occur as your user outside
# the container.
#
# Your $HOME/.config is mounted at $HOME/.config within the container to ensure you can
# easily access/modify your code-server config in $HOME/.config/code-server/config.json
# outside the container.
mkdir -p ~/.config
docker run -it --name code-server -p 127.0.0.1:8080:8080 \
  -v "$HOME/.config:/home/coder/.config" \
  -v "$PWD:/home/coder/project" \
  -u "$(id -u):$(id -g)" \
  -e "DOCKER_USER=$USER" \
  whyvra/code-server-dotnet:latest
```

## Mounts

In order to persist your `code-server` configuration, installed extensions, dotnet tools. git config and custom projects, mount points must be created.

```bash
/home/coder
 ├── .config/       # code-server config
 ├── .local/share/  # extensions and their config files
 ├── .dotnet/       # local dotnet folder used for dotnet-tools and stuff
 ├── .ssh/          # ssh keys 
 ├── .gitconfig     # git config file
 ├── dev/           # folder to persist your projects (you don't have to call it dev)
```

For SSH keys, please be mindful of their location and who can access them. Highly recommend using a secure mechanism like Docker secrets.

## License

Released under the [MIT License](https://github.com/whyvra/code-server-dotnet/blob/master/LICENSE).