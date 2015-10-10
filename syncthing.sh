#!/bin/bash

mkdir -p "$HOME/.config/syncthing"

set -x

docker run --detach --name syncthing --restart always --user "$(id -u):$(id -g)" --volume "$HOME:$HOME" --volume "$HOME/.config/syncthing:/home/user/.config/syncthing" --net host --log-driver syslog --log-opt syslog-tag="syncthing" tianon/syncthing "$@"

#timeout 10s docker logs -f syncthing || true
 
