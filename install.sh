#!/bin/bash

DOTFILES=~/dotfiles

#--- Zsh ---
ln -sf $DOTFILES/zsh/.zshrc ~/.zshrc
ln -sf $DOTFILES/zsh/.zprofile ~/.zprofile

#--- Git ---
ln -sf $DOTFILES/git/.gitconfig ~/.gitconfig

#--- WezTerm ---
mkdir -p ~/.config/wezterm
ln -sf $DOTFILES/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua
ln -sf $DOTFILES/wezterm/keybinds.lua ~/.config/wezterm/keybinds.lua

#--- Neovim ---
mkdir -p ~/.config/nvim
ln -sf $DOTFILES/nvim ~/.config/nvim

#--- StarShip ---
mkdir -p ~/.config
ln -sf $DOTFILES/starship/starship.toml ~/.config/starship.toml

#--- brewinstall ---
# starship 
# eza 
# fzf 
# ghq 
# zsh-autosuggestions 
# zsh-syntax-highlighting 
# zsh-completions 
# font-cica 
# font-jetbrains-mono-nerd-font 
# wezterm 
# neovim
# ripgrep
# fd