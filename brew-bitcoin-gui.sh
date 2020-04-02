#!/usr/bin/env bash

checkbrew() {

    if hash brew 2>/dev/null; then
        # Make sure we’re using the latest Homebrew.
        brew update
        # Upgrade any already-installed formulae.
        brew upgrade
        brew install autoconf automake berkeley-db4 libtool boost miniupnpc pkg-config python qt libevent qrencode librsvg
        git clone https://github.com/randymcmillan/bitcoin ~/bitcoin
        cd ~/bitcoin && ./contrib/install_db4.sh .
        ./autogen.sh
        export BDB_PREFIX='/home/$(whoami)/bitcoin/db4'
        ./configure
        make

    else
        $(pwd)/installbrew.sh
        #/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
}

checkbrew

# Remove outdated versions from the cellar.
brew cleanup
#!/usr/bin/env bash


if [[ "$OSTYPE" == "linux-gnu" ]]; then

    sudo apt update
    sudo apt -y install wget curl libtool autoconf autoconf automake berkeley-db4 libtool boost miniupnpc pkg-config python qt libevent qrencode librsvg pkg-config
    sudo apt install linuxbrew-wrapper
    checkbrew

elif [[ "$OSTYPE" == "darwin"* ]]; then

    brew install autoconf automake berkeley-db4 libtool boost miniupnpc pkg-config python qt libevent qrencode librsvg
    checkbrew

elif [[ "$OSTYPE" == "cygwin" ]]; then

    echo TODO add support for $OSTYPE

elif [[ "$OSTYPE" == "msys" ]]; then

    echo TODO add support for $OSTYPE

elif [[ "$OSTYPE" == "win32" ]]; then

    echo TODO add support for $OSTYPE

elif [[ "$OSTYPE" == "freebsd"* ]]; then

    echo TODO add support for $OSTYPE

else

    echo TODO add support for $OSTYPE

fi

