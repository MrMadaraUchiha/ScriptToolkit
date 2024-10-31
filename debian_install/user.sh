#!/bin/bash


# Installing Groovy
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install groovy || true