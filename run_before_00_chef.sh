#!/bin/bash

set -euxo pipefail

if [ "$(uname)" = "Darwin" ]; then
  if ! xcode-select -p &>/dev/null; then
    sudo xcodebuild -license accept
    xcode-select --install
  fi

  if [ "$(uname -m)" = "arm64" ]; then
    BREWPREFIX="/opt/homebrew"
  else
    BREWPREFIX="/usr/local"
  fi

  if ! [ -x "$BREWPREFIX"/bin/brew ]; then
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    eval "$("$BREWPREFIX"/bin/brew shellenv)"
  fi

  if ! which chef-solo >/dev/null; then
    brew install chef/chef/chef-infra-client
  fi
fi

# TODO: Linux install

cd "$(chezmoi source-path)/chef"
CHEF_LICENSE=accept-silent chef-solo -c solo.rb -j attributes.json
