#! /bin/sh
# run this sh as root

# ubuntuの場合の処理を記述
ubuntu_setup(){
  cd ~
  if [ -e ~/myEnvforLinux ];then
    echo "myEnvforLinux already exist"
  else
    echo "not exits then clone"
    # git clone https://github.com/steave6/myEnvforLinux.git
  fi
  cd myEnvforLinux

  # I'm adding process of setteing in {{{
    # mplayersetting
    mvsettingfile
  # }}}

  return 3
}

# 基本的な設定ファイルの移動
mvsettingfile(){
  # あとでtestを削除する
  ls
  find ./home/ -type f -exec cp -r {} ~/test/ \;
}

# mplayerの設定
mplayersetting(){
  apt-get install mplayer
}

# vimの設定
vimEnv(){
  return 0
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
