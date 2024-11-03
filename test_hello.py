class boto3:

    def client(self, a, region):
        pass


def setup_secrets_manager():
    # Initialize the mocked AWS environment
    def abc():
        secrets_manager_client = boto3().client("secretsmanager", "us-east-1")
        secret_name = "my_client_secret"
        secret_value = {"username": "test_user", "password": "test_pass"}

        ecs_neo_auth_config = {"client_secret_name": secret_name}
