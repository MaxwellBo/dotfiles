############
# HOMEBREW #
############
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew cask # initializes

####################
# LANGUAGE TOOLING #
####################
brew install --cask homebrew/cask-versions/adoptopenjdk8 

brew install yarn nvm haskell-stack scala sbt ammonite-repl leiningen nim pipenv go rustup-init python3

brew tap unisonweb/unison
brew install unison-language

# The Rust community should be shot for this
# curl https://sh.rustup.rs -sSf | sh

#############
# DATABASES #
#############
brew install postgresql mysql

docker run --name postgres -d -e POSTGRES_PASSWORD=postgres -p 5432:5432 postgres:9.6.1
docker run --name maria -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 -d mariadb:latest
docker run --name redis -d redis

# TODO: Check whether these utilities can read from stdin
# psql -h localhost -p 5432 --username=postgres
# sudo mysql --host=127.0.0.1 --user=root -p
# docker run -it --link maria:mysql --rm mariadb sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'
# CREATE DATABASE <DB_NAME>;


#########
# UTILS # 
#########
brew cask install iterm2 google-backup-and-sync google-chrome spotify slack wireshark spectacle thefuck

#########
# CLOUD #
#########
brew cask install heroku google-cloud-sdk

#########
# LATEX #
#########
brew cask install mactex

#######
# CLI # 
#######
brew tap jesseduffield/lazydocker
brew install nvim fd exa ccat prettyping ncdu ripgrep
brew install pandoc gitless wget ranger screenfetch tmux lnav q jq fx gron trash tig m-cli entr fpp fzf fzy tokei httpie pup loc telnet diff-so-fancy htop ncdu bat prettyping shellcheck mosh googler up hadolint noti bsed lazydocker

#########
# SHELL # 
#########
git clone --recursive https://github.com/MaxwellBo/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

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

brew cask install font-fira-code font-dejavu-sans-mono-for-powerline

###########
# EDITORS #
###########

defaults write -g ApplePressAndHoldEnabled -bool false

brew install --cask visual-studio-code intellij-idea

brew install neovim
pip3 install neovim pyre-check flit pipenv

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim +PlugClean +PlugInstall +qa

