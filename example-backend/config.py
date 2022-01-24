# This config script is supposed to be used in order to pass environment variables set by docker &/ local
# environments to python applications. Required environment variables can be definded as instance variables using
# os.getenv(). The constructor then asserts that all required variables have been provided.

from mtc_api_utils.config import Config


class ExampleConfig(Config):
    backend_url = Config.parse_env_var("BACKEND_URL", default="http://localhost:5000")


ExampleConfig.assert_variables_are_present()
