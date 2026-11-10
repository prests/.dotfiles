# Herdr + Ghostty portable install plan

## Context
- Make Herdr reproducible on a new **macOS** machine using **Homebrew** and this Stow-managed dotfiles repo.
- The user only wants portable installation—not custom keybindings, a Ghostty launcher, agent integrations, or Herdr preferences.
- Herdr is an independent terminal runtime: it runs inside Ghostty without Ghostty-specific configuration.

## Approach
Add Herdr to the existing idempotent Homebrew bootstrap block in `README.md`, then document its normal Ghostty use (`herdr`, detach, reattach). Do not create `.config/herdr/config.toml`: Herdr works without it, and committing one would add an unnecessary preference surface. Do not change `.config/ghostty/config` or `.gitignore`.

## Files to modify
- `README.md` — add the idempotent `brew install herdr` command and a short usage note.

## Reuse
- Existing dependency pattern in `README.md`: `command -v <tool> &> /dev/null || brew install <formula>`.
- Existing machine-bootstrap sequence in `README.md`: clone → `stow -t ~/ -d . .`.
- Existing Ghostty config remains unchanged: `.config/ghostty/config`.

## Steps
- [ ] Add `command -v herdr &> /dev/null || brew install herdr` beside the current terminal/developer dependencies.
- [ ] Add a concise Herdr section explaining that it is launched from a Ghostty terminal in a project directory with `herdr`; use `Ctrl-b q` (or close Ghostty) to detach and rerun `herdr` to reattach.
- [ ] State that upgrades are managed by Homebrew (`brew upgrade herdr`), not `herdr update`, because Homebrew owns the binary.

## Deliberately excluded
- No Ghostty configuration: Herdr has no Ghostty-specific setup requirement.
- No tracked `~/.config/herdr/config.toml`: default configuration is sufficient; Herdr creates/uses its own local config and private session data under `~/.config/herdr/`.
- No agent integrations: they modify agent-specific config and are only needed later for native agent-session resume/status reporting.
- No `.gitignore` rule: Herdr’s default configuration and session data are outside this repository.

## Verification
- `stow -n -t ~/ -d . .` still has no Herdr links to create, confirming installation is intentionally README-managed.
- On a fresh macOS/Homebrew environment, follow the README bootstrap block; `command -v herdr` and `herdr --version` succeed.
- In Ghostty, run `herdr` from a project, detach with `Ctrl-b q`, then rerun `herdr` and confirm it reattaches.
- Confirm `git diff --check` and preserve the user’s pre-existing working-tree changes.
