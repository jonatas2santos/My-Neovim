#!/bin/bash
clear
set -euo pipefail
section () {
  echo
  echo
  echo "==========================================================="
  echo "==> $1"
  echo "==========================================================="
  echo
  echo
}

section "Please enter your sudo password to install required packages via pacman..."
sudo -v
echo

section "Creating runtime directory and setting permissions..."
sleep 5
jupyter kernelspec remove datascience -f 2>/dev/null || true
cd ~/
mkdir -p ~/.local/share/jupyter/runtime
chmod 700 ~/.local/share/jupyter/runtime
echo "Done!!"
echo

section "Starting Neovim setup installation..."
sleep 5
echo

section "Installing required system packages..."
sleep 2
sudo pacman -S --needed --noconfirm \
  neovim \
  git \
  ripgrep \
  fd \
  unzip \
  wget \
  curl \
  python \
  python-pynvim \
  python-jupyter-client \
  python-pip \
  python-pipx \
  lua-language-server \
  lua-jsregexp \
  nodejs \
  npm \
  ueberzug \
  imagemagick \
  lazygit \
  fzf \
  tree-sitter \
  clang \
  lua \
  ttf-jetbrains-mono-nerd \
  stylua

echo
section "Installing Python CLI tools via pipx..."
pipx install rich --include-deps || true
echo
pipx install ruff || true
echo
pipx install jupytext || true
echo
pipx ensurepath
echo

section "Creating Python virtual environment..."
sleep 5
python3 -m venv .venv
source .venv/bin/activate
echo "Virtual environment created successfully!!"
echo

section "Installing Python libraries into the virtual environment..."
sleep 5
pip install --upgrade pip 
pip install \
  pandas \
  matplotlib \
  seaborn \
  numpy \
  jupyter \
  plotly \
  pyperclip \
  nbformat \
  pillow \
  requests \
  scikit-learn \
  statsmodels \
  pyarrow \
  ipykernel

echo
section "Finalizing virtual environment setup..."
sleep 5
VENV_PY="$(pwd)/.venv/bin/python"
"$VENV_PY" -m ipykernel install \
  --user \
  --name datascience \
  --display-name "Data Science (Neovim)"

# Manual alternative: python -m ipykernel install --user --name datascience --display-name "Data Science(Neovim)"

echo
section "Kernel successfully installed!!"
sleep 3
echo

section "Backing up existing Neovim configuration..."
if [[ -d ~/.config/nvim ]] then
  mv ~/.config/nvim ~/.config/OLDnvim
  sleep 3
  echo "Backup completed!!"
else
  sleep 3
  echo "No previous Neovim configuration found."
fi
sleep 5

echo
section "Downloading Neovim configuration..."
cd ~/.config/
git clone https://github.com/jonatas2santos/My-Neovim.git
mv My-Neovim nvim
cd nvim
rm -rf images README.md install.sh
if [[ -d .git ]] then
  rm -rf .git
fi
sleep 5
echo

section "Final step"
echo "Open Neovim and wait for Lazy to install all plugins."
echo "After that, run :Lazy update & :UpdateRemotePlugins"
echo "Then close Neovim and this terminal."
sleep 3
echo
read -rp "Everything is ready! Press ENTER to exit :)"
