#!/bin/bash

set -e

echo "Deploying to PythonAnywhere"
echo "Username: roshanr"
echo "API token: 9584b23b448ceec0c89dd8aee0b5424553fad57a"

pip install pythonanywhere
python -m pythonanywhere --apikey "9584b23b448ceec0c89dd8aee0b5424553fad57a" webapps
