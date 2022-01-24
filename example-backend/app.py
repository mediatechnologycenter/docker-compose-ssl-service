from mtc_api_utils.api import BaseApi
from config import ExampleConfig

app = BaseApi(__name__, is_ready=lambda: True, cors_enabled=True)

print("API is listening to {}".format(ExampleConfig.backend_url))
