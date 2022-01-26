from mtc_api_utils.api import BaseApi

app = BaseApi(__name__, is_ready=lambda: True, cors_enabled=True)

print("Proxy is running")
