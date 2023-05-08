#!/bin/bash

# Install PythonAnywhere API client
pip install pythonanywhere

# Run PythonAnywhere deployment script
pythonanywhere --apikey 9584b23b448ceec0c89dd8aee0b5424553fad57a webapps_update roshanr.pythonanywhere.com --repo https://github.com/RoshanRajapakse/test-repo.git
