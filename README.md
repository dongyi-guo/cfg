# Dongyi Guo's Configs

These are my dotfiles, managed with a bare Git repository on Linux only.
macOS files are kept locally and are not part of this repository.

## How this repository works

This repository is a bare Git repository with its work-tree set to `$HOME`.
It is managed using the `config` alias below rather than a normal `git`
checkout, so that dotfiles can live directly in the home directory without
turning the entire home directory into a Git working copy.

More background on this technique is available at
[Atlassian's dotfiles tutorial](https://www.atlassian.com/git/tutorials/dotfiles).

```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

This alias is already defined in `.bashrc`. Use `config` in place of `git`
for all operations on these dotfiles, for example:

```bash
config status
config add .bashrc
config commit -m "Update bashrc"
config push
```

## Scope

| Platform | Shell | Managed by this repo |
|----------|-------|-----------------------|
| Linux    | bash  | Yes, via the bare repo above |
| macOS    | zsh (Oh My Zsh) | No, files are placed manually |

macOS is deliberately excluded from the bare repo. The `.zshrc` on macOS is
maintained locally on each Mac and is not tracked here.

## Files

- **`.bashrc`** — Linux shell configuration. Sources `.shell_common` for
  aliases, exports, and functions shared with macOS, and separately defines
  bash-specific settings (history behaviour, the `config` alias, prompt).
- **`.shell_common`** — Shell-agnostic aliases, exports, and functions
  (`ls`/`grep`/`diff` colour handling, `less` colours, NeoVim as the default
  editor with a Vim then Vi fallback, the `up` function, and a fallback
  `extract` function). This file is written in POSIX-compatible syntax so it
  can be sourced by both bash and zsh without modification. Sourced by
  `.bashrc` on Linux. On macOS, a copy of this same file is placed manually
  at `~/.shell_common` and sourced from `.zshrc`; it is not fetched or synced
  automatically.

## Setting up a new Linux machine

1. Clone this repository as a bare repository into `~/.cfg`:
   ```bash
   git clone --bare <repository-url> $HOME/.cfg
   ```
2. Define the `config` alias shown above (or source `.bashrc` once it is
   checked out, which defines it for you).
3. Check out the working files:
   ```bash
   config checkout
   ```
   If this fails because existing dotfiles would be overwritten, back up the
   conflicting files first, then repeat the checkout.
4. Set Git to ignore untracked files when running `config status`, so it
   does not list your entire home directory:
   ```bash
   config config --local status.showUntrackedFiles no
   ```
5. Restart your shell, or run `source ~/.bashrc`, to load the configuration.

## Setting up a new Mac

macOS is not part of this repository. To bring a Mac to the same shell
configuration:

1. Install [Oh My Zsh](https://ohmyz.sh/) first. Doing this before placing a
   custom `.zshrc` avoids Oh My Zsh's installer overwriting it (the
   installer backs up and replaces any existing `.zshrc` it finds).
2. Place `.zshrc` and `.shell_common` in the home directory manually
   (for example, via `scp` or by copying the current versions from a Linux
   machine or from this README's companion files).
3. Restart your terminal, or run `source ~/.zshrc`, to load the
   configuration.

## Notes

- `.shell_common` is intentionally kept free of bash-only or zsh-only
  syntax so that it behaves identically on both platforms.
- History size is set to 10,000 entries on both platforms (`HISTSIZE`/
  `HISTFILESIZE` in bash; `HISTSIZE`/`SAVEHIST` in zsh).
- The `extract` function in `.shell_common` only defines itself if a command
  named `extract` is not already available, so it steps aside for Oh My
  Zsh's `extract` plugin on macOS.

More information can be found [here](https://www.atlassian.com/git/tutorials/dotfiles).
