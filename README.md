# .dotfiles

This repository contains all sorts of .dotfiles to setup my developer experience

## Setup

1. Install the following non-neovim dependencies:

```sh
command -v brew &> /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
command -v nvm &> /dev/null || brew install nvm
command -v stow &> /dev/null || brew install stow
command -v git &> /dev/null || brew install git
command -v plantuml &> /dev/null || brew install plantuml
command -v opencode &> /dev/null || brew install opencode-ai/tap/opencode
command -v pass &> /dev/null || brew install pass
command -v tmux &> /dev/null || brew install tmux
command -v herdr &> /dev/null || brew install herdr
command -v mole &> /dev/null || brew install mole
brew install ripgrep
curl https://sh.rustup.rs -sSf | sh
```

Install [Golang](https://go.dev/doc/install)

1. Install the following dependencies:

```sh
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
```

2. Apply Changes

Run the following script from the root of the project (assuming repo is cloned to home directory):

```sh
stow -t ~/ -d . .
```

## Herdr

Herdr runs inside Ghostty; no Ghostty configuration is required. From a project directory, start it with `herdr`. Press `Ctrl-b q` (or close the Ghostty window) to detach while work continues, then run `herdr` again to reattach.

Homebrew manages updates: run `brew upgrade herdr`, not `herdr update`.

## Pi

Pi configuration lives in `.pi/agent/` and is activated by `.zshrc` through `PI_CODING_AGENT_DIR`. Preferences and package declarations are tracked; credentials and generated package/session data are ignored.

On a new machine:

```sh
git clone <repo-url> ~/.dotfiles
cd ~/.dotfiles
stow -t ~/ -d . .
# Install Pi separately, then start it and run /login
pi

# Install the configured packages on this machine
for package in \
  npm:pi-web-access \
  npm:pi-context-view \
  npm:@ff-labs/pi-fff \
  npm:pi-subagents \
  npm:@dietrichgebert/ponytail \
  npm:@narumitw/pi-goal \
  npm:@plannotator/pi-extension \
  npm:@quintinshaw/pi-dynamic-workflows
do
  pi install "$package"
done
```

Verify the active config with:

```sh
printf '%s\n' "$PI_CODING_AGENT_DIR"
pi list
```

### Figma MCP

Pi's built-in MCP support connects to Figma Desktop's local server:

```json
{
  "mcpServers": {
    "figma-desktop": {
      "url": "http://127.0.0.1:3845/mcp"
    }
  }
}
```

Enable the local MCP server in Figma Desktop before starting Pi. Verify it with:

```sh
pi mcp list
```

In an interactive session, use `/mcp` to inspect the server and its tools. MCP server names must contain only letters, digits, `_`, or `-`.

## Custom Commands

### Clean Branches

The `clean-branches` command will delete any local branches that have already been merged onto `main` or `master`. It comes with an optional `-d -m x` flag to also delete any branches older than `x` months.

Example:

```sh
clean-branches # default delete command (will only delete branches merged directly onto main/master)

clean-branches -d -m 2 # delete all branches merged onto main/master and any branch 2 months or older
```

## Secret Env Variables

Below is a list of secret passwords you will need to set or update the `.zshrc` file to ignore them

```sh
pass insert <key> # Insert key's value as part of password
pass show <key>
pass edit <key>
```

- openai-api-key
- anthropic-api-key
