#!/usr/bin/env bash

sudo yum update -y

# Install Java JRE
if [ ! -f /var/log/jreinstalled ]; then
  sudo rpm -ivh /vagrant/provision/jre-8u65-linux-x64.rpm
  java -version
  sudo touch /var/log/jreinstalled
fi

# Install leiningen
if [ ! -f /var/log/leininstalled ]; then
  wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
  sudo mv ./lein /usr/local/bin/
  sudo chmod a+x /usr/local/bin/lein
  /usr/local/bin/lein
  /usr/local/bin/lein -v
  sudo touch /var/log/leininstalled
fi

# Install and configure emacs 24.5
if [ ! -f /var/log/emacsinstalled ]; then
  sudo yum install gcc ncurses-devel giflib-devel libjpeg-devel libtiff-devel unzip -y
  wget http://ftp.heanet.ie/mirrors/gnu/emacs/emacs-24.5.tar.gz
  tar xzvf emacs-24.5.tar.gz
  cd emacs-24.5
  ./configure --prefix=$HOME --without-x
  make
  sudo make install
  cd ..
  which emacs
  emacs —version
  unzip /vagrant/provision/emacs-for-clojure-book1.zip -d /tmp
  mv /tmp/emacs-for-clojure-book1 ~/.emacs.d
  echo "{:user {:plugins [[cider/cider-nrepl \"0.8.1\"]]}}" >> ~/.lein/profiles.clj
  sudo touch /var/log/emacsinstalled
fi
