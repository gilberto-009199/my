# Como usar

./setup.bash

<!--
 Primeiro atualize o repositorio:


``
sudo apt update
sudo apt upgrade
``

Instale as ferramentas de build basicas:

``
sudo apt install make cmake wget apt-transport-https ca-certificates curl sed git-lfs
``

 habilite a architetura de 32 bits 

``
sudo dpkg --add-architecture i386 
``
## Habilitando auto login e os themas 

Para habilitar o autologin e preciso o `/etc/lightdm/lightdm.conf` para colocar o usuario `administrador` no autologin:

``
sudo cp /etc/lightdm/lightdm.conf /etc/lightdm/lightdm.conf.bkp
sudo sed -i 's/^#autologin-user=/autologin-user=administrador/g' /etc/lightdm/lightdm.conf
sudo sed -i 's/^#autologin-user-timeout=/autologin-user-timeout=0/g' /etc/lightdm/lightdm.conf
``


Bem, vamos criar nossa arvore `my` no diretorio de usuario então vamos fazer agora

``
mkdir -p . ~/my
cp -r . ~/my/
``

Por padrão eu uso xfce, logo vou mostrar como definir o meu thema e configurações padrão.

+ Primeiro vamos colocar o themas no local aonde o xfce encontre:
``
ln -s ~/my/config/user/.themes ~/.themes
``
+ Primeiro vamos colocar os icones no local aonde o xfce encontre:
``
ln -s ~/my/config/user/.icons ~/.icons
``
+ Backgrounds de fundo
``
ln -s ~/my/config/user/.backgrounds ~/.backgrounds
``

+ Vamos pegar as configurações de painel do xfce:
(Cuidado, de pendendo da sua versoa talves seja melhor criar um backup!)
```
tar -cvf ~/.config/xfce4.bkp.tar  ~/.config/xfce4.bkp.tar
rm -Rf ~/.config/xfce4 && ln -s ~/my/config/user/.config/xfce4 ~/.config/xfce4
```

Vamos agora Redefinir nossos diretorios padrões no XFCE e criar links simbolicos para as pastas padrões:
``
# Backup do user-dirs.dirs
cp ~/.config/user-dirs.dirs ~/.config/user-dirs.dirs.bkp

sed -i 's#^XDG_DOWNLOAD_DIR="$HOME/Downloads"#XDG_DOWNLOAD_DIR="$HOME/my/doc/Downloads"#g' ~/.config/user-dirs.dirs
rm -Rf ~/Downloads && ln -s ~/my/doc/Downloads ~/Downloads

sed -i 's#^XDG_DOCUMENTS_DIR="$HOME/Documents"#XDG_DOCUMENTS_DIR="$HOME/my/doc/Documents"#g' ~/.config/user-dirs.dirs
rm -Rf ~/Documents && ln -s ~/my/doc/Documents ~/Documents

sed -i 's#^XDG_MUSIC_DIR="$HOME/Music"#XDG_MUSIC_DIR="$HOME/my/doc/Music"#g' ~/.config/user-dirs.dirs
rm -Rf ~/Music &&  ln -s ~/my/doc/Music ~/Music

sed -i 's#^XDG_PICTURES_DIR="$HOME/Pictures"#XDG_PICTURES_DIR="$HOME/my/doc/Pictures"#g' ~/.config/user-dirs.dirs
rm -Rf ~/Pictures &&  ln -s ~/my/doc/Pictures ~/Pictures

sed -i 's#^XDG_VIDEOS_DIR="$HOME/Videos"#XDG_VIDEOS_DIR="$HOME/my/doc/Videos"#g' ~/.config/user-dirs.dirs
rm -Rf ~/Videos &&  ln -s ~/my/doc/Videos ~/Videos
``
Eu prefiro deixar o Desktop como esta uma vez que quanto usei o link sisbolico para ele tive muitos problemas!! kkk

## Instalar repositorios e ferramental adicional:


 + wineHQ - https://wiki.winehq.org/Debian
``
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
# version bookworm
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bookworm/winehq-bookworm.sources
sudo apt install --install-recommends winehq-stable
``
 + vscode - https://code.visualstudio.com/docs/setup/linux
``
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt update
sudo apt install code
`` 
 + vivaldi  - https://gist.github.com/pkorpine/16fcdbe070222cf1d99e67cf542e60c2
``
echo "deb http://repo.vivaldi.com/stable/deb/ stable main" | sudo tee /etc/apt/sources.list.d/vivaldi.list > /dev/null
wget -O - http://repo.vivaldi.com/stable/linux_signing_key.pub | sudo apt-key add -
sudo apt update && sudo apt install vivaldi-stable
``

 + steam - https://repo.steampowered.com/steam/
``
sudo wget -O /etc/apt/keyrings/steam.gpg https://repo.steampowered.com/steam/archive/stable/steam.gpg
sudo tee /etc/apt/sources.list.d/steam-stable.list <<'EOF'
deb [arch=amd64,i386 signed-by=/etc/apt/keyrings/steam.gpg] https://repo.steampowered.com/steam/ stable steam
deb-src [arch=amd64,i386 signed-by=/etc/apt/keyrings/steam.gpg] https://repo.steampowered.com/steam/ stable steam
EOF
sudo apt-get update
sudo apt-get install \
  libgl1-mesa-dri:amd64 \
  libgl1-mesa-dri:i386 \
  libgl1-mesa-glx:amd64 \
  libgl1-mesa-glx:i386 \
  steam-launcher
``
+ nodejs - https://github.com/nodesource/distributions?tab=readme-ov-file#installation-instructions
``
sudo curl -fsSL https://deb.nodesource.com/setup_21.x | bash - && sudo apt-get install -y nodejs
curl -L https://npmjs.org/install.sh | sudo sh
``
+ google-chrome
``
sudp wget -O /opt/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install /opt/google-chrome-stable_current_amd64.deb
cat /etc/apt/sources.list.d/google-chrome.list 
``
+ docker - https://docs.docker.com/engine/install/debian/
``
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
``

 + qemu-kvm
``
sudo apt -y install qemu-kvm libvirt-daemon  bridge-utils virtinst libvirt-daemon-system
sudo modprobe vhost_net
echo vhost_net | sudo tee -a /etc/modules
sudo apt -y install vim libguestfs-tools libosinfo-bin  qemu-system virt-manager
``
-->



