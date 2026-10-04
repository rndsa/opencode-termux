#!/data/data/com.termux/files/usr/bin/bash
# ==============================================================================
# OpenCode for Termux - Automated Installer & Modular Setup
# ==============================================================================

set -e

# If user just wants to manage skills:
if [ "$1" == "--skills" ] || [ "$1" == "-s" ]; then
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    if [ -f "$SCRIPT_DIR/bin/opencode-skills" ]; then
        exec "$SCRIPT_DIR/bin/opencode-skills"
    elif command -v opencode-skills > /dev/null 2>&1; then
        exec opencode-skills
    else
        echo "Error: opencode-skills tidak ditemukan."
        exit 1
    fi
fi

# Setup TTY
if [ -t 0 ]; then
    HAS_TTY=true
elif [ -e /dev/tty ]; then
    exec < /dev/tty
    HAS_TTY=true
else
    HAS_TTY=false
fi

# Colors
ESC="\033"
C_RESET="${ESC}[0m"
C_BOLD="${ESC}[1m"
C_DIM="${ESC}[2m"
C_CYAN="${ESC}[1;36m"
C_GREEN="${ESC}[1;32m"
C_YELLOW="${ESC}[1;33m"
C_RED="${ESC}[1;31m"
C_WHITE="${ESC}[1;37m"

clear_screen() { printf "${ESC}[2J${ESC}[H"; }

clear_screen
echo -e "${C_CYAN}"
cat << "EOF"
  ___                    ____          _      
 / _ \ _ __   ___ _ __  / ___|___   __| | ___ 
| | | | '_ \ / _ \ '_ \| |   / _ \ / _` |/ _ \
| |_| | |_) |  __/ | | | |__| (_) | (_| |  __/
 \___/| .__/ \___|_| |_|\____\___/ \__,_|\___|
      |_|            Termux Edition
EOF
echo -e "${C_RESET}"

ARCH=$(uname -m)
if [ "$ARCH" != "aarch64" ]; then
    echo -e "${C_RED}[!] Error: Arsitektur perangkat ($ARCH) tidak didukung.${C_RESET}"
    echo -e "OpenCode Termux membutuhkan CPU 64-bit (aarch64)."
    exit 1
fi

echo -e "${C_CYAN}[1/4]${C_RESET} Memeriksa dan memperbarui dependensi sistem (ripgrep, curl)..."
pkg update -y > /dev/null 2>&1 || true
pkg install -y curl ripgrep > /dev/null 2>&1

DEB_URL="https://github.com/Konaimav2/opencode-termux/releases/download/v2.0.19-android-rc4/opencode_2.0.19_aarch64.deb"
DEB_FILE="/data/data/com.termux/files/usr/tmp/opencode_installer.deb"

echo -e "${C_CYAN}[2/4]${C_RESET} Mengunduh core binary OpenCode (v2.0.19 aarch64)..."
mkdir -p "$(dirname "$DEB_FILE")"
curl -fL --progress-bar "$DEB_URL" -o "$DEB_FILE"

echo -e "${C_CYAN}[3/4]${C_RESET} Memasang core binary ke sistem Termux..."
dpkg -i "$DEB_FILE" > /dev/null
rm -f "$DEB_FILE"

echo -e "${C_CYAN}[4/4]${C_RESET} Memasang manajer skill independen dan referensi modular..."
PREFIX_BIN="/data/data/com.termux/files/usr/bin"
LOCAL_BIN="$HOME/.local/bin"
REF_DIR="$HOME/.config/opencode/references"
mkdir -p "$REF_DIR"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd || echo "")"
if [ -n "$SCRIPT_DIR" ] && [ -d "$SCRIPT_DIR/references" ]; then
    cp -r "$SCRIPT_DIR/references/"* "$REF_DIR/" 2>/dev/null || true
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd || echo "")"
SKILLS_SRC=""
if [ -n "$SCRIPT_DIR" ] && [ -f "$SCRIPT_DIR/bin/opencode-skills" ]; then
    SKILLS_SRC="$SCRIPT_DIR/bin/opencode-skills"
fi

# Install opencode-skills binary to PATH
TARGET_BIN=""
if [ -d "$PREFIX_BIN" ] && [ -w "$PREFIX_BIN" ]; then
    TARGET_BIN="$PREFIX_BIN/opencode-skills"
else
    mkdir -p "$LOCAL_BIN"
    TARGET_BIN="$LOCAL_BIN/opencode-skills"
fi

if [ -n "$SKILLS_SRC" ]; then
    cp "$SKILLS_SRC" "$TARGET_BIN"
else
    # Fetch directly if running via curl pipe
    curl -fsSL "https://raw.githubusercontent.com/rndsa/opencode-termux/main/bin/opencode-skills" -o "$TARGET_BIN"
fi
chmod +x "$TARGET_BIN"

echo ""
echo -e "${C_GREEN}${C_BOLD}[✓] Core OpenCode berhasil terpasang!${C_RESET}"
echo -e "    Tools manajer skill telah terpasang di: ${C_CYAN}$TARGET_BIN${C_RESET}"
echo ""
echo -e "${C_DIM}Membuka antarmuka pemilihan skill internal... (Tekan sembarang tombol)${C_RESET}"
sleep 1

# Launch skill manager immediately
exec "$TARGET_BIN"
