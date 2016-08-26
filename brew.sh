#!/usr/bin/env bash
# Install command-line tools using Homebrew.
# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update
brew install cask

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2
brew install cmake

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install macvim
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php56 --with-gmp
brew cask install xampp
brew cask install etom
brew install Caskroom/cask/eyberduck
brew install Caskroom/cask/airserver
#pdf tools
brew install qpdf
brew install pdf2svg
brew install svg2pdf
brew install diff-pdf
brew install htmldoc
brew install texi2html
brew install xpdf
brew install pdf2htmlex
brew install pstoedit
brew cask install combine-pdfs
brew cask install pdf-toolbox

#Spotify
brew install Caskroom/cask/spotify

#Swift language
brew install swiftlint
brew install swift-package-manager

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xz

# Install other useful binaries.
brew install ack
brew install dark-mode

#git tools
brew install git
brew install git-lfs
brew install hub
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rhino
brew install speedtest_cli
brew install ssh-copy-id
brew install testssl
brew install tree
brew install webkit2png
brew install zopfli
brew install keychain

#adobe
brew install Caskroom/cask/adobe-creative-cloud
brew install Caskroom/cask/adobe-creative-cloud-cleaner-tool
brew cask install adobe-reader
brew cask install flash
brew install get-flash-videos
brew install Caskroom/cask/adobe-acrobat
brew install Caskroom/cask/adobe-illustrator-cc
brew install Caskroom/cask/adobe-photoshop-cc

#twitter
brew install t

#Snitch
brew install Caskroom/cask/micro-snitch --force
brew install Caskroom/cask/little-snitch --force

# Remove outdated versions from the cellar.
brew cleanup

