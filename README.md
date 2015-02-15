# Using

Shamelessly copied from coreyoconnor

## Manual Bootstrap

1. clone this repo
2. `git submodule update --init --recursive`
3. create or select a config under `computers`
    * the name of the directory containing the config should match the hostname
4. `export NIX_PATH=computers/$HOSTNAME/configuration.nix`
5. `./bin/build`
6. `./bin/switch

# Prep

* add the nix unstable channel

    nix-channel --add http://nixos.org/channels/nixos-unstable nixos

