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
  sudo apt-get install -y byobu mplayer curl vim xdotool xbindkeys aria2 midori vim-gnome
  sudo apt-get install -y redshift redshift-gtk
  # nodejs v6.xx install
  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
  sudo apt-get install -y nodejs
  sudo apt-get install -y build-essential
}

envsetting(){
  echo "envsetting start"
  LANG=C xdg-user-dirs-gtk-update
  echo "folder name change to english"
  mvsettingfile
  export PATH=$PATH:${HOME}/bin
  kvmsettings
}

# 基本的な設定ファイルの移動
mvsettingfile(){
  # あとでtestを削除する
  ls
  echo "move fundamental file .* to home folder"
  find ./home/ -type f -exec cp {} ~/ \;
  echo "moving foler bin ..."
    cp -r ./bin ~/
  echo "move foler bin ends"
  echo "moving foler .fonts ..."
    cp -r ./.fonts ~/
  echo "move foler .fonts ends"
  echo "moving foler .vim ..."
    cp -r ./.vim ~/
  echo "move foler .vim ends"
  echo "moving foler for redshift ..."
    cp -r ./.config ~/
  echo "move foler .fonts ends"
  echo "move foler P ..."
    cp -rf ./Documents ~/
  echo "move foler P ends"
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
