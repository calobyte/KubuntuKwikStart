# remove kate
sudo apt remove -yq kate

# flatpaks
flatpak install --noninteractive -y flathub org.kde.kdenlive
flatpak install --noninteractive -y flathub org.gimp.GIMP
flatpak install --noninteractive -y flathub com.ultimaker.cura
flatpak install --noninteractive -y flathub com.usebruno.Bruno
flatpak install --noninteractive -y flathub com.bitwarden.desktop
flatpak install --noninteractive -y flathub io.dbeaver.DBeaverCommunity
flatpak install --noninteractive -y flathub com.github.PintaProject.Pinta
flatpak install --noninteractive -y flathub org.darktable.Darktable
flatpak install --noninteractive -y flathub com.obsproject.Studio
flatpak install --noninteractive -y flathub org.localsend.localsend_app
flatpak install --noninteractive -y org.videolan.VLC
flatpak install --noninteractive -y org.libreoffice.LibreOffice

# INSTALL: docker
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
sudo apt-get update
sudo apt-get install -yq ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get -yq install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER

# INSTALL: VS CODE
echo "code code/add-microsoft-repo boolean true" | sudo debconf-set-selections
sudo apt-get install -yq wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg
sudo apt-get install -yq apt-transport-https
sudo apt-get update
sudo apt-get install -yq code



# fonts
wget https://raw.githubusercontent.com/calobyte/woza/refs/heads/main/fonts/jetbrains-fonts.tar -O $DOWNLOAD_PATH/jetbrains-fonts.tar
sudo tar -xf $DOWNLOAD_PATH/jetbrains-fonts.tar -C /usr/share/fonts/truetype/ --wildcards "*.ttf"
fc-cache -f

# Run Lavavel-Localenv
curl -o- https://raw.githubusercontent.com/calobyte/Laravel-Localenv/refs/heads/main/run.sh | bash

# install extra vs code extensions
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension usernamehw.errorlens
code --install-extension esbenp.prettier-vscode
code --install-extension eamodio.gitlens

# vs code theme stuff
code --install-extension GitHub.github-vscode-theme
code --install-extension Catppuccin.catppuccin-vsc-icons

# vs code user settings
wget wget https://raw.githubusercontent.com/calobyte/woza/refs/heads/main/vscode_settings.json -O $HOME/.config/Code/User/settings.json

# temp dir
DOWNLOAD_PATH=$HOME/Downloads/tmp
mkdir -p $DOWNLOAD_PATH


