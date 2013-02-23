#!/bin/bash
RUBY_VERSION="1.9.3-p385"
TMP=/tmp

sudo apt-get update
sudo apt-get install -y curl checkinstall \
  bison openssl libreadline6 libreadline6-dev zlib1g zlib1g-dev libssl-dev libyaml-dev libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev \
  sqlite3 libsqlite3-dev \
  language-pack-en-base
cd $TMP 
curl -sSo ./ruby-${RUBY_VERSION}.tar.gz ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-${RUBY_VERSION}.tar.gz
tar -xzf ./ruby-${RUBY_VERSION}.tar.gz
rm ./ruby-${RUBY_VERSION}.tar.gz
cd ruby-${RUBY_VERSION}
./configure
make
sudo checkinstall -y
sudo gem update --system
sudo gem install rails --no-rdoc --no-ri
cd $TMP
rm -rf ./ruby-${RUBY_VERSION}

echo "Ruby + Ruby on Rails installed"
