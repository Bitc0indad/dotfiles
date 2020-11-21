#!/usr/bin/env bash
if [[ "$OSTYPE" == "darwin"* ]]; then

    if hash brew 2>/dev/null; then

        brew install coreutils
        sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

    fi

fi


