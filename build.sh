#!/bin/bash

VM="vopt"
IMAGE_NAME="veranostech/vopt"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

trap '[ "$?" -eq 0 ] || read -p "Looks like something went wrong... Press any key to continue..."' EXIT


# for windows with docker for Windows
# =====================================================================================================================

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    echo "Linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "MAC OSX"
elif [[ "$OSTYPE" == "cygwin" ]]; then
    echo "Windows-Cygwin"
	dos2unix.exe ./.bash_profile ./.docker-entrypoint.sh ./6379-docker.conf ./supervisord.conf
elif [[ "$OSTYPE" == "msys" ]]; then
    echo "Windows-Msys"
	dos2unix.exe ./.bash_profile ./.docker-entrypoint.sh ./6379-docker.conf ./supervisord.conf
elif [[ "$OSTYPE" == "win32" ]]; then
    echo "Windows-Win32"
	dos2unix.exe ./.bash_profile ./.docker-entrypoint.sh ./6379-docker.conf ./supervisord.conf
else
    echo "Unknown"
	exit
fi

read -p "tag (default \"latest\"): " TAG
if [ -z "$TAG" ]; then
  TAG=latest
fi

COMMAND="docker build --rm=true -t $IMAGE_NAME:$TAG . 2>&1 | tee $(date +"%Y%m%d-%H%M%S").log"

eval ${COMMAND}
