############
# HOMEBREW #
############
xcode-select --install

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew cask # initializes


####################
# CONTAINERIZATION #
####################
brew install docker

####################
# LANGUAGE TOOLING #
####################
brew cask install java

brew install ipython yarn nvm haskell-stack scala sbt ammonite-repl leiningen nim

# The Rust community should be shot for this
curl https://sh.rustup.rs -sSf | sh


#############
# DATABASES #
#############
brew install postgresql mysql

docker run --name postgres -d -e POSTGRES_PASSWORD=postgres -p 5432:5432 postgres:9.6.1
docker run --name maria -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 -d mariadb:latest

# TODO: Check whether these utilities can read from stdin
# psql -h localhost -p 5432 --username=postgres
# sudo mysql --host=127.0.0.1 --user=root -p
# CREATE DATABASE <DB_NAME>;


#########
# UTILS # 
#########
brew cask install iterm2 google-backup-and-sync google-chrome flux spotify slack keybase kitematic wireshark insomnia

#########
# CLOUD #
#########
brew cask install heroku google-cloud-sdk

#######
# CLI # 
#######
brew install pandoc gitless wget ranger screenfetch tmux the_silver_searcher ripgrep lnav q jq trash tig rtv exa ccat m-cli entr fpp fzf fd fzy tokei httpie pup

#########
# SHELL # 
#########
brew install zsh
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

brew tap caskroom/fonts

brew cask install font-fira-code
brew cask install font-dejavu-sans-mono-for-powerline


###########
# EDITORS #
###########

brew cask install visual-studio-code intellij-idea sublime-text

brew install neovim
pip3 install neovim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugClean +PlugInstall +qa


