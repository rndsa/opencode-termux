#!/data/data/com.termux/files/usr/bin/bash
# ==============================================================================
# OpenCode for Termux - Fast Clean Installer
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

# Wipe terminal screen and scrollback buffer completely
clear 2>/dev/null || true
printf "\033[H\033[2J\033[3J"

# Zinc / OpenCode Colors
ESC="\033"
C_RESET="${ESC}[0m"
C_BOLD="${ESC}[1m"
C_DIM="${ESC}[38;5;242m"
C_CYAN="${ESC}[38;5;81m"
C_GREEN="${ESC}[38;5;120m"
C_RED="${ESC}[38;5;203m"
C_WHITE="${ESC}[38;5;255m"

PREFIX_BIN="/data/data/com.termux/files/usr/bin"
SKILLS_BIN="$PREFIX_BIN/opencode-skills"
REF_DIR="$HOME/.config/opencode/references"
mkdir -p "$REF_DIR"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd || echo "")"

# Sync references
if [ -n "$SCRIPT_DIR" ] && [ -d "$SCRIPT_DIR/references" ]; then
    cp -r "$SCRIPT_DIR/references/"* "$REF_DIR/" 2>/dev/null || true
fi

# Install/update opencode-skills binary
if [ -n "$SCRIPT_DIR" ] && [ -f "$SCRIPT_DIR/bin/opencode-skills" ]; then
    cp "$SCRIPT_DIR/bin/opencode-skills" "$SKILLS_BIN" 2>/dev/null || true
    chmod +x "$SKILLS_BIN" 2>/dev/null || true
else
    curl -fsSL "https://raw.githubusercontent.com/rndsa/opencode-termux/main/bin/opencode-skills?v=$(date +%s)" -o "$SKILLS_BIN" 2>/dev/null || true
    chmod +x "$SKILLS_BIN" 2>/dev/null || true
fi

# Check dependencies
HAS_CURL=true
HAS_RG=true
HAS_OPENCODE=true

command -v curl >/dev/null 2>&1 || HAS_CURL=false
command -v rg >/dev/null 2>&1 || HAS_RG=false
command -v opencode >/dev/null 2>&1 || HAS_OPENCODE=false

# FAST PATH: Already installed? Jump straight to manager!
if [ "$HAS_CURL" = true ] && [ "$HAS_RG" = true ] && [ "$HAS_OPENCODE" = true ]; then
    if [ -f "$SKILLS_BIN" ]; then
        exec "$SKILLS_BIN"
    fi
fi

# SLOW PATH: First time install
echo ""
echo -e "  ${C_CYAN}${C_BOLD}OpenCode${C_RESET} ${C_DIM}v2.0.19 · Initial Setup${C_RESET}"
echo ""

ARCH=$(uname -m)
if [ "$ARCH" != "aarch64" ]; then
    echo -e "  ${C_RED}[!] Error: Arsitektur CPU ($ARCH) bukan aarch64.${C_RESET}\n"
    exit 1
fi

MISSING_PKGS=()
[ "$HAS_CURL" = false ] && MISSING_PKGS+=("curl")
[ "$HAS_RG" = false ] && MISSING_PKGS+=("ripgrep")

if [ ${#MISSING_PKGS[@]} -gt 0 ]; then
    echo -e "  ${C_CYAN}›${C_RESET} Memasang paket: ${MISSING_PKGS[*]}..."
    pkg install -y -o Dpkg::Options::="--force-confold" "${MISSING_PKGS[@]}" >/dev/null 2>&1 || true
fi

if [ "$HAS_OPENCODE" = false ]; then
    DEB_URL="https://github.com/Konaimav2/opencode-termux/releases/download/v2.0.19-android-rc4/opencode_2.0.19_aarch64.deb"
    DEB_FILE="/data/data/com.termux/files/usr/tmp/opencode_installer.deb"

    echo -e "  ${C_CYAN}›${C_RESET} Mengunduh core binary OpenCode aarch64..."
    mkdir -p "$(dirname "$DEB_FILE")"
    curl -fL --progress-bar "$DEB_URL" -o "$DEB_FILE"

    echo -e "  ${C_CYAN}›${C_RESET} Memasang paket ke Termux..."
    dpkg -i "$DEB_FILE" >/dev/null 2>&1
    rm -f "$DEB_FILE"
fi

echo -e "\n  ${C_GREEN}✓ Instalasi selesai.${C_RESET}\n"
sleep 0.8

exec "$SKILLS_BIN"
