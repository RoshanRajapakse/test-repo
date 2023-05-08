#!/bin/bash

#set -e

#echo "Deploying to PythonAnywhere"
#echo "Username: roshanr"
#echo "API token: 9584b23b448ceec0c89dd8aee0b5424553fad57a"

#pip install pythonanywhere
#export PATH=$PATH:$HOME/.local/bin
#pythonanywhere --apikey "9584b23b448ceec0c89dd8aee0b5424553fad57a" webapps


#!/bin/bash

set -e

pip install pythonanywhere
python -m pythonanywhere.deploy --user roshanr --api_token 9584b23b448ceec0c89dd8aee0b5424553fad57a --project_path $TRAVIS_BUILD_DIR --domain roshanr.pythonanywhere.com
