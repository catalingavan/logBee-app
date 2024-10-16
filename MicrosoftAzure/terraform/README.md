```bash
https://learn.microsoft.com/en-us/answers/questions/1296678/az-login-error-failed-to-authenticate-my-guid-defa

az config set core.encrypt_token_cache=false
az account clear
az config set core.encrypt_token_cache=true

**az login --use-device-code **
```