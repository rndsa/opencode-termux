#!/data/data/com.termux/files/usr/bin/bash
# ==============================================================================
# OpenCode for Termux - Fast Intelligent Installer & Mobile Setup
# ==============================================================================

set -e

# Setup TTY
if [ -t 0 ]; then
    HAS_TTY=true
elif [ -e /dev/tty ]; then
    exec < /dev/tty
    HAS_TTY=true
else
    HAS_TTY=false
fi

# ANSI Colors
ESC="\033"
C_RESET="${ESC}[0m"
C_BOLD="${ESC}[1m"
C_DIM="${ESC}[2m"
C_CYAN="${ESC}[1;36m"
C_GREEN="${ESC}[1;32m"
C_YELLOW="${ESC}[1;33m"
C_RED="${ESC}[1;31m"
C_WHITE="${ESC}[1;37m"

PREFIX_BIN="/data/data/com.termux/files/usr/bin"
SKILLS_BIN="$PREFIX_BIN/opencode-skills"
REF_DIR="$HOME/.config/opencode/references"
mkdir -p "$REF_DIR"

# 1. Check if OpenCode and dependencies already exist
HAS_CURL=true
HAS_RG=true
HAS_OPENCODE=true

command -v curl >/dev/null 2>&1 || HAS_CURL=false
command -v rg >/dev/null 2>&1 || HAS_RG=false
command -v opencode >/dev/null 2>&1 || HAS_OPENCODE=false

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd || echo "")"

# Sync references and opencode-skills if present locally
if [ -n "$SCRIPT_DIR" ] && [ -d "$SCRIPT_DIR/references" ]; then
    cp -r "$SCRIPT_DIR/references/"* "$REF_DIR/" 2>/dev/null || true
fi

if [ -n "$SCRIPT_DIR" ] && [ -f "$SCRIPT_DIR/bin/opencode-skills" ]; then
    cp "$SCRIPT_DIR/bin/opencode-skills" "$SKILLS_BIN" 2>/dev/null || true
    chmod +x "$SKILLS_BIN" 2>/dev/null || true
elif [ ! -f "$SKILLS_BIN" ]; then
    curl -fsSL "https://raw.githubusercontent.com/rndsa/opencode-termux/main/bin/opencode-skills" -o "$SKILLS_BIN" 2>/dev/null || true
    chmod +x "$SKILLS_BIN" 2>/dev/null || true
fi

# FAST PATH: If already fully installed, jump straight to skill selector!
if [ "$HAS_CURL" = true ] && [ "$HAS_RG" = true ] && [ "$HAS_OPENCODE" = true ]; then
    if [ -f "$SKILLS_BIN" ]; then
        exec "$SKILLS_BIN"
    fi
fi

# SLOW PATH: First-time setup / Missing dependencies
clear
echo -e "${C_CYAN}┌── OpenCode Termux Installer ──────────┐${C_RESET}"
echo -e "${C_CYAN}│${C_RESET} ${C_BOLD}Menyiapkan runtime dan dependensi...${C_RESET}   ${C_CYAN}│${C_RESET}"
echo -e "${C_CYAN}└───────────────────────────────────────┘${C_RESET}\n"

# Verify CPU Architecture
ARCH=$(uname -m)
if [ "$ARCH" != "aarch64" ]; then
    echo -e "${C_RED}[!] Error: CPU ($ARCH) bukan 64-bit (aarch64).${C_RESET}"
    exit 1
fi

# Install only missing packages
MISSING_PKGS=()
[ "$HAS_CURL" = false ] && MISSING_PKGS+=("curl")
[ "$HAS_RG" = false ] && MISSING_PKGS+=("ripgrep")

if [ ${#MISSING_PKGS[@]} -gt 0 ]; then
    echo -e "${C_CYAN}[1/3]${C_RESET} Memasang paket: ${MISSING_PKGS[*]}..."
    pkg install -y -o Dpkg::Options::="--force-confold" "${MISSING_PKGS[@]}" >/dev/null 2>&1 || true
else
    echo -e "${C_GREEN}[1/3]${C_RESET} Dependensi curl & ripgrep: ${C_GREEN}OK${C_RESET}"
fi

# Install OpenCode binary if missing
if [ "$HAS_OPENCODE" = false ]; then
    DEB_URL="https://github.com/Konaimav2/opencode-termux/releases/download/v2.0.19-android-rc4/opencode_2.0.19_aarch64.deb"
    DEB_FILE="/data/data/com.termux/files/usr/tmp/opencode_installer.deb"

    echo -e "${C_CYAN}[2/3]${C_RESET} Mengunduh core OpenCode (v2.0.19 aarch64)..."
    mkdir -p "$(dirname "$DEB_FILE")"
    curl -fL --progress-bar "$DEB_URL" -o "$DEB_FILE"

    echo -e "${C_CYAN}[3/3]${C_RESET} Memasang OpenCode ke Termux..."
    dpkg -i "$DEB_FILE" > /dev/null 2>&1
    rm -f "$DEB_FILE"
else
    echo -e "${C_GREEN}[2/3]${C_RESET} Core OpenCode: ${C_GREEN}Sudah terpasang${C_RESET}"
fi

# Ensure skills manager is in PATH
if [ ! -f "$SKILLS_BIN" ]; then
    curl -fsSL "https://raw.githubusercontent.com/rndsa/opencode-termux/main/bin/opencode-skills" -o "$SKILLS_BIN"
    chmod +x "$SKILLS_BIN"
fi

echo -e "\n${C_GREEN}${C_BOLD}[✓] Instalasi selesai! Membuka menu pemilihan skill...${C_RESET}"
sleep 1

exec "$SKILLS_BIN"
