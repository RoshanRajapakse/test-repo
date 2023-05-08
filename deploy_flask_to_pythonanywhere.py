import os
import sys
from pythonanywhere.api import Webapp, get_webapps
from pythonanywhere.exceptions import PythonAnywhereException

PA_USERNAME = os.environ.get('roshanr')
PA_API_TOKEN = os.environ.get('9584b23b448ceec0c89dd8aee0b5424553fad57a')
PA_APP_NAME = os.environ.get('roshanr.pythonanywhere.com')
TRAVIS_BUILD_DIR = os.environ.get('TRAVIS_BUILD_DIR')

if not all([PA_USERNAME, PA_API_TOKEN, PA_APP_NAME, TRAVIS_BUILD_DIR]):
    print("Some environment variables are missing. Please set PA_USERNAME, PA_API_TOKEN, PA_APP_NAME, and TRAVIS_BUILD_DIR.")
    sys.exit(1)

webapp_exists = False
for webapp in get_webapps(PA_USERNAME, PA_API_TOKEN):
    if webapp.name == PA_APP_NAME:
        webapp_exists = True
        break

if not webapp_exists:
    try:
        Webapp.create(PA_USERNAME, PA_API_TOKEN, domain=PA_APP_NAME, python_version="3.8")
    except PythonAnywhereException as e:
        print(f"Error creating web app: {e}")
        sys.exit(1)

webapp = Webapp(PA_USERNAME, PA_API_TOKEN, domain=PA_APP_NAME)
webapp.update(
    source_directory=os.path.join(TRAVIS_BUILD_DIR, '/home/roshanr/mysite'),
    working_directory=os.path.join(TRAVIS_BUILD_DIR, '/home/roshanr/mysite'),
)
webapp.reload()
print("Flask app deployed successfully")
