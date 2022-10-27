############
# HOMEBREW #
############
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git

################
# CORE EDITING # 
################

brew install --cask iterm2 google-chrome spotify slack rectangle visual-studio-code jetbrains-toolbox nvim

defaults write -g ApplePressAndHoldEnabled -bool false
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim +PlugClean +PlugInstall +qa

#######
# CLI # 
#######
brew install fd exa ccat prettyping ncdu ripgrep
brew install pandoc gitless wget ranger screenfetch tmux lnav q jq fx gron trash tig m-cli entr fpp fzf fzy tokei httpie pup loc telnet diff-so-fancy htop ncdu bat prettyping shellcheck mosh googler up hadolint noti bsed lazydocker thefuck

#########
# SHELL # 
#########
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

chsh -s /bin/zsh

# Reboot shell
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

#########
# FONTS #
#########

brew tap homebrew/cask-fonts
brew install --cask font-fira-code font-dejavu-sans-mono-for-powerline
