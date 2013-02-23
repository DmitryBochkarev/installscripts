#!/bin/bash
RUBY_VERSION=1.9.3-p385

sudo apt-get update
sudo apt-get install -y git-core curl

cat > ~/.rvmrc <<EOF
CFLAGS="-march=native -O2 -pipe -fomit-frame-pointer"
rvm_configure_env=(CFLAGS="-march=native -O2 -pipe -fomit-frame-pointer")
EOF

cat >> ~/.profile <<EOF
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_FREE_MIN=500000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=100000000

source ~/.rvm/scripts/rvm
rvm use ruby-${RUBY_VERSION}-railsexpress
EOF

curl -L https://get.rvm.io | bash -s head

source ~/.profile

rvm install $RUBY_VERSION --patch railsexpress -n railsexpress -j 2

echo "Done ruby version: $RUBY_VERSION"