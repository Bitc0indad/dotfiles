.PHONY:all
all: executable

.PHONY: bootstrap
bootstrap: executable
	./boot-strap.sh

.PHONY: executable
executable:
	chmod +x *.sh

.PHONY: brew
brew: executable
	./checkbrew.sh

.PHONY: all
all: executable
	./install-Docker.sh
	./install-FastLane.sh
	./install-OSXFuse.sh
	./install-Onyx.sh
	./install-SassC.sh
	./install-vim.sh
	./install-discord.sh
	./install-eq-mac.sh
	./install-gpg-suite.sh
	./install-iterm2.sh
	./install-keeping-you-awake.sh
	./install-little-snitch.sh
	./install-openssl.sh
	./install-python3.8.sh
	./install-ql-plugins.sh
	./install-qt5.sh
	./install-sha256sum.sh
	./install-specter-desktop.sh
	./install-umbrel-dev.sh
	./install-valgrind-macos.sh
	./install-vmware-fusion.sh
	./install-vypr-vpn.sh
	./install-ytop.sh

.PHONY: vim
vim: executable
	./install-Vim.sh

.PHONY: config-git
config-git: executable
	git config --global  pull.rebase true

