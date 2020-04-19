#!/usr/bin/env bash
addPath() {
    echo "Adding $1 to PATH";
    chmod +x $1
    export PATH="$PATH:$1";
}
export -f addPath

installBashInfinity() {

REPO=~/infinity
URL=https://github.com/niieani/bash-oo-framework.git
    mkdir    $REPO
    cd       $REPO
    git init $REPO
    cd $REPO
    git remote add origin $URL
    git config core.sparsecheckout true
    echo "lib/*" >> .git/info/sparse-checkout
    git pull --depth=1 origin master
    #ln -s /lib/oo-bootstrap.sh ~/ #     $( cd "${BASH_SOURCE[0]%/*}" && pwd )
    rm -f ~/test-infinity.sh
    ln -s  ~/dotfiles/test-infinity.sh ~/test-infinity.sh
#    ln -s  ~/dotfiles/infinity $PWD
    ln -s  ~/dotfiles/infinity ~/dotfiles
    ~/./test-infinity.sh
    ~/test-infinity.sh

}


installBash() {

    if hash brew 2>/dev/null; then
        # Make sure we’re using the latest Homebrew.
        brew update
        # Upgrade any already-installed formulae.
        brew upgrade
        brew install bash bash-completion


    else

        #example - execute script with perl
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        checkbrew

    fi
}
installBash
installBashInfinity
