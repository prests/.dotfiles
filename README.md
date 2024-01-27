# .dotfiles

This repository contains all sorts of .dotfiles to setup my developer experience

## Setup

1. Install the following dependencies:

```sh
command -v brew &> /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install --cask iterm2
command -v stow &> /dev/null || brew install stow
stow -t ~/ -d . .
command -v git &> /dev/null || brew install git
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" # The .zshrc file may get overwritten and moved to ~/.zshrc.pre-oh-my-zsh
source ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
source ~/.zshrc
command -v nvim &> /dev/null || brew install neovim
```

