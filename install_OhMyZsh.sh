#!/bin/bash
set -e

echo "===== Installing Zsh, Oh My Zsh, Autosuggestions, and Powerlevel10k ====="

# --- Install Zsh ---
if [ "$(uname)" == "Darwin" ]; then
    # Install Homebrew
    if ! command -v brew &> /dev/null; then
        echo "📥 Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew install zsh git curl unzip
elif [ -f /etc/debian_version ]; then
    echo "[INFO] Debian/Ubuntu detected"
    sudo apt-get update && sudo apt-get install -y zsh git curl wget unzip fontconfig
elif [ -f /etc/redhat-release ]; then
    echo "[INFO] Fedora/RHEL/Almalinux detected"
    sudo dnf install -y zsh git curl wget unzip fontconfig
else
    echo "[ERROR] Unsupported OS for this script!"
    exit 1
fi

# Verify installation
if ! command -v zsh >/dev/null 2>&1; then
    echo "[ERROR] Failed to install Zsh!"
    exit 1
fi
echo "[INFO] Zsh installed at: $(which zsh)"

# --- Set Zsh as default shell ---
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "[INFO] Setting Zsh as the default shell for user $USER"
    chsh -s "$(which zsh)" "$USER"
fi

# --- Install Oh My Zsh ---
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "[INFO] Installing Oh My Zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "[INFO] Oh My Zsh already installed"
fi

# --- Install zsh-autosuggestions plugin ---
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
    echo "[INFO] Installing plugin: zsh-autosuggestions"
    git clone https://github.com/zsh-users/zsh-autosuggestions.git \
        ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
else
    echo "[INFO] Plugin zsh-autosuggestions already exists"
fi

# Enable plugin in ~/.zshrc
if grep -q "plugins=(" ~/.zshrc; then
    sed -i 's/plugins=(.*/plugins=(git zsh-autosuggestions)/' ~/.zshrc
else
    echo 'plugins=(git zsh-autosuggestions)' >> ~/.zshrc
fi

# Ensure autosuggestions loads correctly
if ! grep -q "zsh-autosuggestions.zsh" ~/.zshrc; then
    cat << 'EOF' >> ~/.zshrc

# Load zsh-autosuggestions manually if not loaded
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
EOF
fi

install_fonts() {
  if [ "$(uname)" == "Darwin" ]; then
    echo "📦 Installing MesloLGS Nerd Font via brew..."
    brew tap homebrew/cask-fonts
    brew install --cask font-meslo-lg-nerd-font
  else
    # FONT_DIR="$HOME/.local/share/fonts"
    FONT_DIR="/usr/share/fonts/MesloLGS"
    echo "📦 Installing MesloLGS Nerd Font manually..."
    sudo mkdir -p "$FONT_DIR"
    for font in "MesloLGS NF Regular.ttf" "MesloLGS NF Bold.ttf" "MesloLGS NF Italic.ttf" "MesloLGS NF Bold Italic.ttf"; do
        if [ ! -f "$FONT_DIR/$font" ]; then
            echo "Downloading $font ..."
            MESLO_URL="https://github.com/romkatv/powerlevel10k-media/raw/master"
            sudo wget -q "$MESLO_URL/$font" -O "$FONT_DIR/$font"
        else
            echo "$font already exists, skipping..."
        fi
    done
    # Refresh font cache (Linux)
    if command -v fc-cache &> /dev/null; then
        fc-cache -fv "$FONT_DIR"
    fi
  fi
}

# Call font installer (common for all OS)
install_fonts
echo "[INFO] MesloLGS NF font installed"

# --- Install Powerlevel10k theme ---
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    echo "[INFO] Installing Powerlevel10k theme"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
        ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# Change theme in ~/.zshrc
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

# --- Copy p10k.zsh config if available ---
if [ -f "./.p10k.zsh" ]; then
    echo "[INFO] Copying ./.p10k.zsh to ~/.p10k.zsh"
    cp ./.p10k.zsh ~/.p10k.zsh
# Ensure autosuggestions loads correctly

else
    echo "[INFO] No ./p10k.zsh found in current directory, skipping."
fi

if ! grep -q "source ~/.p10k.zsh" ~/.zshrc; then
    echo "[INFO] Add customize customize prompt in ~/.zshrc"
    cat << 'EOF' >> ~/.zshrc

# To customize prompt, run \`p10k configure\` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
EOF
fi

echo "===== Installation Completed! ====="
echo "👉 Please logout and login again for Zsh to start automatically."
echo "👉 Then open a terminal to launch Powerlevel10k with MesloLGS NF font."
echo "👉 If you want to change the theme configuration later, run: p10k configure"
