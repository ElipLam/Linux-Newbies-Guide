#!/usr/bin/env bash
set -Eeuo pipefail

if (( EUID == 0 )); then
  printf '%s\n' "Run this script as a regular user; do not run it with sudo." >&2
  exit 1
fi

if ! command -v sudo >/dev/null 2>&1; then
  printf '%s\n' "sudo is required to install system packages." >&2
  exit 1
fi

bash_path=$(command -v bash || true)
if [[ -z "$bash_path" ]]; then
  printf '%s\n' "Bash was not found on this system." >&2
  exit 1
fi

distro_id=$(awk -F= '$1 == "ID" {gsub(/"/, "", $2); print $2; exit}' /etc/os-release)
distro_like=$(awk -F= '$1 == "ID_LIKE" {gsub(/"/, "", $2); print $2; exit}' /etc/os-release)

case " $distro_id $distro_like " in
  *" debian "*|*" ubuntu "*|*" linuxmint "*|*" pop "*)
    sudo apt-get update
    sudo apt-get install -y bash-completion git make gawk curl
    ;;
  *" fedora "*|*" rhel "*|*" rocky "*|*" almalinux "*|*" centos "*|*" nobara "*)
    sudo dnf install -y bash-completion git make gawk curl
    ;;
  *)
    printf '%s\n' "Automatic setup is not supported on this distro. Supported: Debian/Ubuntu and Fedora/RHEL." >&2
    exit 1
    ;;
esac

bash_realpath=$(readlink -f "$bash_path")
is_bash_path() {
  [[ -n "${1:-}" && -x "$1" ]] && [[ "$(readlink -f "$1")" == "$bash_realpath" ]]
}

if ! grep -Fxq "$bash_path" /etc/shells && ! grep -Fxq "$bash_realpath" /etc/shells; then
  printf '%s\n' "Bash is not listed in /etc/shells; it cannot be set as the default shell." >&2
  exit 1
fi
if ! grep -Fxq "$bash_path" /etc/shells; then
  bash_path=$bash_realpath
fi

temp_dir=$(mktemp -d)
trap 'rm -rf "$temp_dir"' EXIT

git clone --recursive --depth 1 --shallow-submodules \
  https://github.com/akinomyoga/ble.sh.git "$temp_dir/ble.sh"
make -C "$temp_dir/ble.sh" install PREFIX="$HOME/.local"

mkdir -p "$HOME/.local/bin"
curl -fsSL https://starship.rs/install.sh -o "$temp_dir/starship-install.sh"
sh "$temp_dir/starship-install.sh" -y -b "$HOME/.local/bin"

bashrc="$HOME/.bashrc"
if [[ -L "$bashrc" ]]; then
  bashrc=$(readlink -f "$bashrc")
fi
touch "$bashrc"
timestamp=$(date +%Y%m%d-%H%M%S)

if ! grep -Fq '# >>> linux-newbies-guide bash stack: early setup >>>' "$bashrc"; then
  cp -a "$bashrc" "$bashrc.backup-$timestamp"
  temporary_bashrc=$(mktemp)
  {
    cat <<'EOF'
# >>> linux-newbies-guide bash stack: early setup >>>
if [[ $- == *i* ]]; then
  if [[ -r /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
  elif [[ -r /etc/profile.d/bash_completion.sh ]]; then
    source /etc/profile.d/bash_completion.sh
  fi
  source -- "$HOME/.local/share/blesh/ble.sh" --attach=none
fi
# <<< linux-newbies-guide bash stack: early setup <<<

EOF
    cat "$bashrc"
  } > "$temporary_bashrc"
  chmod --reference="$bashrc" "$temporary_bashrc"
  mv "$temporary_bashrc" "$bashrc"
fi

if ! grep -Fq '# >>> linux-newbies-guide bash stack: final setup >>>' "$bashrc"; then
  cp -a "$bashrc" "$bashrc.backup-$timestamp-final"
  cat <<'EOF' >> "$bashrc"

# >>> linux-newbies-guide bash stack: final setup >>>
export PATH="$HOME/.local/bin:$PATH"
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init bash)"
fi
[[ ! ${BLE_VERSION-} ]] || ble-attach
# <<< linux-newbies-guide bash stack: final setup <<<
EOF
fi

current_shell=$(getent passwd "$(id -un)" | cut -d: -f7)
if ! is_bash_path "$current_shell"; then
  if ! command -v chsh >/dev/null 2>&1 || [[ ! -t 0 ]]; then
    printf '%s\n' "An interactive terminal and chsh are required to set Bash as the default shell." >&2
    exit 1
  fi
  chsh -s "$bash_path"
fi

current_shell=$(getent passwd "$(id -un)" | cut -d: -f7)
if ! is_bash_path "$current_shell"; then
  printf '%s\n' "Could not verify Bash as the default shell; check the account settings." >&2
  exit 1
fi

printf '%s\n' "Bash is verified as the default shell. Log out and back in to start a new Bash session."
printf '%s\n' "For Starship symbols, install and select a Nerd Font (e.g. FiraCode Nerd Font) in your terminal settings."
