#!/bin/bash

#set -e

#echo "Deploying to PythonAnywhere"
#echo "Username: roshanr"
#echo "API token: 9584b23b448ceec0c89dd8aee0b5424553fad57a"

#pip install pythonanywhere
#export PATH=$PATH:$HOME/.local/bin
#pythonanywhere --apikey "9584b23b448ceec0c89dd8aee0b5424553fad57a" webapps


#!/bin/bash

#set -e

#pip install pythonanywhere
#python -m pythonanywhere.deploy --user roshanr --api_token 9584b23b448ceec0c89dd8aee0b5424553fad57a --project_path $TRAVIS_BUILD_DIR --domain roshanr.pythonanywhere.com


#!/bin/bash
set -e

# Install the required packages
pip install flask

# Download the PythonAnywhere helper script for Flask
curl -O https://raw.githubusercontent.com/pythonanywhere/helper_scripts/master/bash/pa_install_webapp.py

# Provide execution permissions
chmod +x pa_install_webapp.py

# Execute the helper script
./pa_install_webapp.py --username roshanr --api_token 9584b23b448ceec0c89dd8aee0b5424553fad57a --app_name roshanr.pythonanywhere.com --source_directory $TRAVIS_BUILD_DIR
