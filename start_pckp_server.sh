#!/bin/bash
#
# Install and start a pckp server from https://github.com/krista-chan/pckp-server

if ! command -v rustup &> /dev/null
then
  >&2 echo "Rustup could not be found on path."
  echo "Would you like to install it? - y/n (default)"
  
  select yn in "y" "n"; do
    case $yn in
      y ) curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh; break;;
      n ) exit;;
    esac
   done
fi

git clone https://github.com/krista-chan/pckp-server
cd pckp-server
cargo run --release &
