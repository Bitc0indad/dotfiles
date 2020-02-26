#!/usr/bin/env bash

checkbrew() {

    if hash brew 2>/dev/null; then
        # Make sure we’re using the latest Homebrew.
        brew update
        # Upgrade any already-installed formulae.
        brew upgrade
	brew install wget
	sudo wget -qO - https://gist.githubusercontent.com/RandyMcMillan/634bc660e03151a037a97295b01a0369/raw/28deda7c03eb4c8a300c4c3eabd76c0f732ca5da/disable.sh | bash
    else
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        checkbrew

    fi
}
checkbrew
