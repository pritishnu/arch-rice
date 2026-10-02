# Dotfiles Configuration

This directory is my personal Linux configuration folder for the apps and desktop environment I use daily. It mirrors the usual `~/.config` layout and groups everything by application or system area.

## Overview

This setup is centered around a Hyprland desktop environment and includes terminal, launcher, editor, system monitor, and desktop appearance configuration.

## Main directories

- `hypr/` — Hyprland window manager configuration, modules, binds, and theme settings
- `nvim/` — Neovim configuration and editor plugins
- `kitty/` and `alacritty/` — terminal emulator settings
- `rofi/` and `fuzzel/` — app launchers and menu utilities
- `btop/`, `htop/`, `nvtop/`, `cava/` — system/resource monitoring
- `fastfetch/` — system fetch display config
- `gtk-3.0/` and `gtk-4.0/` — GTK theming
- `qt6ct/` and `nwg-look/` — Qt and GTK look configuration
- `dconf/`, `systemd/`, `environment.d/` — system-level desktop settings
- `Code/`, `Codex/`, `Vencord/`, `discord/`, `obsidian/`, `zed/`, `zen/` — app-specific data and config

## Personal notes

- This is not a full machine backup; it is a curated config folder for desktop customization.
- Some files are host-specific, especially monitor layouts, keybindings, startup commands, and app defaults.
- Review files before copying or symlinking them into a new machine.

## Recommended workflow

1. Back up your current `~/.config` directory.
2. Review the files you want to reuse.
3. Symlink or copy only the relevant directories.
4. Reload the desktop environment or restart the affected app.

## Important

- Do not commit secrets, browser data, cached logs, or personal app state.
- Keep machine-specific files such as monitor settings and session state separate when needed.

This setup is intended to make my Linux environment reproducible and easy to maintain.
