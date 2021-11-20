#!/bin/bash

# TODO: Linux install
if ! which chef-solo > /dev/null; then
  brew install chef/chef/chef-infra-client
fi

cd "$(chezmoi source-path)/chef"
CHEF_LICENSE=accept-silent chef-solo -c solo.rb -j attributes.json
