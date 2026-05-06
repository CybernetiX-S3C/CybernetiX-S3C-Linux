#!/bin/bash

# CybernetiX-S3C-Linux Deployment Script
# Developed by John Modica
# Grace of God, for the people, of Modica.

CYAN='\033[0;36m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m' 

# Path Logic - Automatically detects the repository directory
REPO_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
APP_DIR="$REPO_DIR/CybernetiX-S3C-Linux-App"
BIN_EXE="$APP_DIR/CybernetiX-S3C"
ICON_PATH="$APP_DIR/resources/app/icon.png"

clear

echo -e "${CYAN}${BOLD}"
echo "_________         ___.                                __  .______  ___"
echo "\_   ___ \___.__.\_ |__   ___________  ____   _____/  |_|__\   \/  /"
echo "/     \  \<   |  | | __ \_/ __ \_  __ \/    \_/ __ \   __\  |\     / "
echo "\     \___\___  | | \_\ \  ___/|  | \/    |  \  ___/|  | |  |/     \ "
echo " \______  / ____| |___  /\___  >__|  |___|  /\___  >__| |__/___/\   \\"
echo "        \/\/          \/     \/           \/     \/               \_/"
echo -e "            [ CybernetiX-S3C-Linux DEPLOYMENT ]\n${NC}"

# Verification
if [ ! -d "$APP_DIR" ]; then
    echo -e "${CYAN}[!] Error: App folder not found at $APP_DIR${NC}"
    exit 1
fi

echo -e "${BLUE}Synchronizing permissions...${NC}"
chmod +x "$BIN_EXE"
chmod 4755 "$APP_DIR/chrome-sandbox" 2>/dev/null || true

echo -e "${BLUE}Configuring desktop launcher...${NC}"
cat <<EOF > ~/.local/share/applications/cybernetix-s3c.desktop
[Desktop Entry]
Type=Application
Name=CybernetiX S3C
Comment=Direct access to the CybernetiX S3C website
Exec="$BIN_EXE" --no-sandbox
Icon=$ICON_PATH
Terminal=false
Categories=Network;Development;
StartupWMClass=cybernetix-s3c
EOF

chmod +x ~/.local/share/applications/cybernetix-s3c.desktop
update-desktop-database ~/.local/share/applications 2>/dev/null

echo -e "\n${GREEN}${BOLD}------------------------------------------------"
echo "  CybernetiX-S3C-Linux INTEGRATED SUCCESSFULLY"
echo "  The app is now available in your application drawer."
echo "  Grace of God, for the people, of Modica."
echo -e "------------------------------------------------${NC}\n"
