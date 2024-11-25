#!/bin/bash


echo "==============================================="
echo "K   K  RRRR   Y   Y  PPPP   TTTTT  OOO  SSSS"
echo "K  K   R   R   Y Y   P   P    T   O   O S"
echo "KK     RRRR     Y    PPPP     T   O   O  SSS"
echo "K  K   R  R     Y    P        T   O   O     S"
echo "K   K  R   R    Y    P        T    OOO  SSSS"
echo "=============================================="

sudo sed -i 's@http://archive.ubuntu.com/ubuntu/@http://mirror.xeonbd.com/ubuntu/@g' /etc/apt/sources.list

echo "Updating and upgrading the system..."
sudo apt update
sudo apt -y upgrade

echo "Installing build-essential..."
sudo apt install -y build-essential

echo "Installing Google Chrome..."
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

echo "Installing GCC, G++, and JDK..."
sudo apt install -y gcc g++ default-jdk

echo "Installing Python and pip..."
sudo apt install -y python3 python3-pip

echo "Installing GNOME Tweaks and extensions..."
sudo apt install -y gnome-tweaks gnome-shell-extension-prefs chrome-gnome-shell
sudo apt install -y gnome-shell-extension-user-theme gnome-shell-extension-system-monitor

echo "Installing VLC..."
sudo apt install -y vlc

echo "Installing iFuse..."
sudo apt install -y ifuse

echo "Installing additional file system support and Android tools..."
sudo apt install -y ntfs-3g exfat-fuse exfat-utils exfatprogs mtp-tools android-tools-adb

echo "Installing PPPoE configuration tool..."
sudo apt install -y pppoeconf

echo "Customizing GNOME Dock..."
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock autohide 'true'

echo "Installing Visual Studio Code..."
wget -q https://code.visualstudio.com/sha/download?build=stable&os=linux-deb -O vscode.deb
sudo apt install -y ./vscode.deb
rm vscode.deb

echo "Installing Sublime Text..."
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt install -y apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install -y sublime-text

echo "Installing p7zip for archive extraction..."
sudo apt install -y p7zip-full

echo "Downloading and applying custom Sublime Text build..."
BUILD_URL="https://github.com/mehedi2256/Snippet/raw/main/Sublime%20Text.7z" 
TEMP_DIR=$(mktemp -d)

wget -qO "$TEMP_DIR/Sublime_Text.7z" "$BUILD_URL"
7z x "$TEMP_DIR/Sublime_Text.7z" -o"$TEMP_DIR/extracted"
mkdir -p ~/.config/sublime-text/Packages/User
cp -r "$TEMP_DIR/extracted/"* ~/.config/sublime-text/Packages/User/
rm -rf "$TEMP_DIR"

echo "Installing PyCharm Community Edition..."
sudo snap install pycharm-community --classic

echo "Installing Git and essentials..."
sudo apt install -y git gitk git-gui

echo "Installing Wine and essentials for Windows apps..."
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install -y wine64 wine32 winbind winetricks

echo "Installing Discord..."
wget -qO discord.deb "https://discord.com/api/download?platform=linux&format=deb"
sudo apt install -y ./discord.deb
rm discord.deb

echo "Installing Free Download Manager..."
wget -qO fdm.deb "https://dn3.freedownloadmanager.org/6/latest/freedownloadmanager.deb"
sudo apt install -y ./fdm.deb
rm fdm.deb

echo "Installing and applying GNOME theme..."
THEME_URL="https://github.com/mehedi2256/Snippet/raw/main/Ant.tar.xz"  
TEMP_DIR=$(mktemp -d)
THEME_DIR=~/.themes

mkdir -p "$THEME_DIR"
wget -qO "$TEMP_DIR/Ant.tar.xz" "$THEME_URL"
tar -xf "$TEMP_DIR/Ant.tar.xz" -C "$THEME_DIR"
THEME_NAME="Ant"
gsettings set org.gnome.desktop.interface gtk-theme "$THEME_NAME"
gsettings set org.gnome.shell.extensions.user-theme name "$THEME_NAME"
rm -rf "$TEMP_DIR"

echo "==========================================================================="
echo "MH-007 Setup Complete! Please reboot your system to use all updated system."
echo "==========================================================================="
