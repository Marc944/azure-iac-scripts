from flask import Flask
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient

app = Flask(__name__)

# Initialize the Key Vault client
key_vault_name = "emiliekeyvaultrepo1"
key_vault_uri = f"https://emiliekeyvaultrepo1.vault.azure.net"
credential = DefaultAzureCredential()
client = SecretClient(vault_url=key_vault_uri, credential=credential)

# Retrieve a secret from Azure Key Vault
secret_name = "SOURCE"
retrieved_secret = client.get_secret(secret_name).value

@app.route('/')
def hello_world():
    return f'Hello, World! The secret value is from {retrieved_secret}'

if __name__ == '__main__':
    app.run(host='0.0.0.0')
