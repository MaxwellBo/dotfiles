source ~/.bashrc

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="$HOME/.cargo/bin:$PATH"
if [ -e /Users/mjbo/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/mjbo/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

