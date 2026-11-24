#!/usr/bin/env bash
set -Eeuo pipefail

if (( EUID == 0 )); then
  printf '%s\n' "Run this script as a regular user; do not run it with sudo." >&2
  exit 1
fi

if ! command -v sudo >/dev/null 2>&1; then
  printf '%s\n' "sudo is required to uninstall the Zsh package." >&2
  exit 1
fi

is_zsh_path() {
  [[ -n "${1:-}" && -x "$1" ]] || return 1
  local shell_name resolved_path resolved_name
  shell_name=${1##*/}
  resolved_path=$(readlink -f "$1")
  resolved_name=${resolved_path##*/}
  [[ "$shell_name" == zsh || "$shell_name" == zsh-* || "$resolved_name" == zsh || "$resolved_name" == zsh-* ]]
}

login_shell=$(getent passwd "$(id -un)" | cut -d: -f7)
if [[ ! -x "$login_shell" || -z "${SHELL:-}" ]] || is_zsh_path "$login_shell" || is_zsh_path "$SHELL"; then
  printf '%s\n' "Set a different default shell and log in again before removing Zsh." >&2
  exit 1
fi

case "$(awk -F= '$1 == "ID" {gsub(/"/, "", $2); print $2; exit}' /etc/os-release)" in
  debian|ubuntu|linuxmint|pop)
    package_manager=apt
    ;;
  fedora|rhel|rocky|almalinux|centos)
    package_manager=dnf
    ;;
  *)
    printf '%s\n' "Automatic removal is not supported on this distro. Supported: Debian/Ubuntu and Fedora/RHEL." >&2
    exit 1
    ;;
esac

read -r -p "Back up Zsh/Oh My Zsh/Powerlevel10k settings and uninstall Zsh? [y/N] " answer
if [[ ! "$answer" =~ ^[Yy]$ ]]; then
  printf '%s\n' "Cancelled; no files or packages were changed."
  exit 0
fi

backup_dir="$HOME/.local/share/zsh-migration-backups/$(date +%Y%m%d-%H%M%S)"
mkdir -p "$backup_dir"
for item in .zshrc .zprofile .zshenv .zlogin .zsh_history .oh-my-zsh .p10k.zsh .p10k_old.zsh; do
  if [[ -e "$HOME/$item" || -L "$HOME/$item" ]]; then
    mv -- "$HOME/$item" "$backup_dir/"
  fi
done

if [[ "$package_manager" == apt ]]; then
  if dpkg-query -W -f='${Status}' zsh 2>/dev/null | grep -q 'install ok installed'; then
    sudo apt-get remove zsh
  fi
elif rpm -q zsh >/dev/null 2>&1; then
  sudo dnf remove zsh
fi

printf 'Old shell settings were backed up to: %s\n' "$backup_dir"
printf '%s\n' "Zsh and the Oh My Zsh/Powerlevel10k user configuration cleanup is complete."
