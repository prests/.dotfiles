# .dotfiles

This repository contains all sorts of .dotfiles to setup my developer experience

## Setup

1. Install the following non-neovim dependencies:

```sh
command -v brew &> /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
command -v nvm &> /dev/null || brew install nvm
command -v stow &> /dev/null || brew install stow
command -v git &> /dev/null || brew install git
brew install ripgrep
curl https://sh.rustup.rs -sSf | sh
```

Install [Golang](https://go.dev/doc/install)

1. Install the following dependencies:

```sh
brew install --cask iterm2
rm ~/.zshrc
stow -t ~/ -d . .
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" # The .zshrc file may get overwritten and moved to ~/.zshrc.pre-oh-my-zsh
mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
source ~/.zshrc
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
source ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
source ~/.zshrc
command -v nvim &> /dev/null || brew install neovim
stow -t ~/ -d . .
```

2. Customizing Iterm2

- Set theme in `settings > profile > colors` and import preset from home directory
- Set global keybinding to ⌘ + j in `settings > keys > hotkeys > create a dedicated hotkey window...`
