# Agent Instructions for .dotfiles Repository

## Build/Lint/Test Commands

- For shell scripts: Use `bash -n script.sh` to check syntax
- For Lua files: Format with `stylua` (indent: 2 spaces)
- Custom commands in `custom-commands/` should be executable (`chmod +x`)
- To apply changes run `stow -t ~/ -d . .` from the project's root directory (`~/.dotfiles/`)

## Code Style Guidelines

- **Shell Scripts**: Use `#!/bin/bash`, `set -e` for error handling, quote variables
- **Lua/Neovim**: 2-space indentation, use stylua formatter
- **Git Commits**: Follow conventional commits (feat/fix/docs/chore)
- **File Organization**: Config files in `.config/`, scripts in `custom-commands/`
- **Error Handling**: Always validate inputs, provide clear error messages
- **Dependencies**: Document all required tools in README.md setup section

## Repository Structure

- `.config/nvim/`: Neovim configuration (Lua-based)
- `.config/ghostty/`: Terminal emulator config
- `custom-commands/`: Custom shell scripts (must be executable)
- Managed with GNU Stow for symlink deployment

## Important Notes

- This is a personal dotfiles repo - changes affect user's development environment
- Test shell scripts before committing
- Preserve existing formatting conventions in each file type
