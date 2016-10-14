#if [ -f ~/.bashrc ]; then
 #  source ~/.bashrc
#fi

# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{bash_prompt,exports,aliases,profile,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# REF http://www.funtoo.org/Keychain
# brew install keychain
#eval `keychain --quiet --eval --agents ssh my_git_key`
eval `keychain --quiet --eval --agents ssh my_git_key`
eval `keychain --quiet --eval --agents ssh my_git_key2`
eval `keychain --quiet --eval --agents ssh rootsinr_persis`
eval `keychain --quiet --eval --agents ssh xpatriot_persis_rsa`
eval `keychain --quiet --eval --agents ssh randymcmillan_rsa`
eval `keychain --quiet --eval --agents ssh roots_key_persis`
eval `keychain --quiet --eval --agents ssh id_rsa`
# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Finder Dock Mail Safari iTunes iCal Address\ Book
SystemUIServer Activity\ Monitor" killall

#REF: https://github.com/Linuxbrew/linuxbrew/find/master
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
#eval "$(uru_rt admin install)"
