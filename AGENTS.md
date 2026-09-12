# Agents.md - Repository Guide for AI Agents

## Overview
This repository contains personal dotfiles for a Linux system, heavily integrated with the **Omarchy** framework. The environment targets **Hyprland** (wayland compositor) and uses **zsh** as the primary shell.

## Essential Commands
Since this is a dotfiles repository, there are no traditional "build" or "test" steps.
- **Shell**: `zsh` (config in `.zshrc`)
- **Prompt**: `starship` (config in `starship.toml`)
- **Terminal**: `ghostty` (config in `ghostty/config`)
- **WM**: `Hyprland` (Lua-based input config in `hypr/input.lua`)

## Project Structure
- `.zshrc`: Main shell configuration. Sources Omarchy system-wide defaults.
- `starship.toml`: Customizes the multi-line prompt. Includes right-aligned shell/time and right-justified memory usage.
- `ghostty/`: Configuration for the Ghostty terminal emulator.
- `hypr/`: Hyprland configuration.
    - `input.lua`: Personal input overrides (mouse sensitivity, scrolling, etc.).

## Conventions & Patterns
- **Omarchy Integration**: Most configurations (`.zshrc`, `ghostty/config`, `hypr/input.lua`) source or reference Omarchy-specific paths (e.g., `/usr/share/omarchy-zsh/`, `~/.local/state/omarchy/`).
- **Prompt Logic**: The `starship.toml` uses a `$fill` module to push `$memory_usage` to the right side of the main prompt line, while `right_format` handles the separate right-hand prompt area.
- **Lua for Hyprland**: This setup uses a Lua-based configuration bridge for Hyprland (`hl.config`).

## Gotchas
- **Vi Mode**: Zsh is configured with `bindkey -v`.
- **Ghostty Slowness**: An `async-backend = epoll` fix is applied in the Ghostty config for Hyprland compatibility.
- **Hardcoded Keys**: `.zshrc` contains an exported `GEMINI_API_KEY`. Avoid modifying or exposing this further.
- **Input Overrides**: Changes to mouse/keyboard settings should be made in `hypr/input.lua` within the provided `hl.config` blocks.

## Development Workflow
1. Modify configuration files.
2. Changes to `starship.toml` and `ghostty/config` are usually picked up immediately or on next terminal launch.
3. Changes to `.zshrc` require `source ~/.zshrc`.
4. Changes to `hypr/input.lua` require a Hyprland reload.
