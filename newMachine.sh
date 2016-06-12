#! /bin/sh
# run this sh as root

# ubuntuの場合の処理を記述
ubuntu_setup(){
  install_apt

  cd ~
    if [ -e ~/myEnvforLinux ];then
      echo "myEnvforLinux already exist"
    else
      echo "not exits then clone"
      # git clone https://github.com/steave6/myEnvforLinux.git
    fi
  cd myEnvforLinux
  
  envsetting

  return 0
}


install_apt(){
  sudo apt-get update
  echo "install fundamental software"
  sudo apt-get install byobu mplayer git curl
  # kvm install
  sudo apt-get install kvm virt-manager libvirt-bin bridge-utils
  #docker install
  curl -fsSL https://get.docker.com/ | sh
  # nodejs v6.xx install
  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
  sudo apt-get install -y nodejs
  sudo apt-get install -y build-essential
  # install pia manager
  echo "install pia manager"
  wget "https://jpn.privateinternetaccess.com/installer/download_installer_linux"
  tar -xvf installer_linux.tar.gz
  chmod +x installer_linux.sh
  ./installer_linux.sh
}

envsetting(){
  echo "envsetting start"
  LANG=C xdg-user-dirs-gtk-update
  echo "folder name change to english"
  mvsettingfile
  PATH=$PATH:/home/steav/bin
  kvmsettings
}

# 基本的な設定ファイルの移動
mvsettingfile(){
  # あとでtestを削除する
  ls
  echo "move fundamental file .* to home folder"
  find ./home/ -type f -exec cp {} ~/test/ \;
  echo "moving foler bin ..."
    cp -r ./bin ~/test
  echo "move foler bin ends"
  echo "moving foler .fonts ..."
    cp -r ./.fonts ~/test
  echo "move foler .fonts ends"
  echo "moving foler .vim ..."
    cp -r ./.vim ~/test
  echo "move foler .vim ends"
  echo "move foler P ..."
    cp -rf ./Documents ~/test/
  echo "move foler P ends"
}

kvmsettings(){
  echo vhost_net >> /etc/modules
  sudo service libvirt-bin start
  sudo update-rc.d libvirt-bin defaults
}


# Get Linux distribution name
main(){
  if   [ -e /etc/debian_version ] ||
     [ -e /etc/debian_release ]; then
    # Check Ubuntu or Debian
    if [ -e /etc/lsb-release ]; then
      # Ubuntu
      echo "ubuntu"
      ubuntu_setup
    else
      # Debian
      echo "debian"
    fi
  elif [ -e /etc/fedora-release ]; then
    # Fedra
    echo "fedora"
  elif [ -e /etc/redhat-release ]; then
    # CentOS
    echo "redhat"
  elif [ -e /etc/gentoo-release ]; then
    # Gentoo Linux
    echo "gentoo"
  else
    # Other
    echo "unkown distribution"
    echo "unkown"
  fi
}

main
