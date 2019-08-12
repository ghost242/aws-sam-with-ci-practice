# AWS

This is a sample template for AWS - Below is a brief explanation of what we have generated for you:

```bash
.
├── Dockerfile
├── README.md
├── app_stack
│   ├── __init__.py
│   ├── hello_lambda
│   │   ├── __init__.py
│   │   └── app.py
│   └── hello_world
│       ├── __init__.py
│       └── app.py
├── buildspec.yml
├── buildup.sh
├── event.json
├── requirements.txt
├── scripts
│   ├── build_project.sh
│   ├── deploy_project.sh
│   ├── package_project.sh
│   └── validate_project.sh
└── tests
    └── unit
        ├── __init__.py
        └── test_handler.py
```

## Requirements

* AWS CLI already configured with Administrator permission
* [Python 3 installed](https://www.python.org/downloads/)
* [Docker installed](https://www.docker.com/community-edition)


## Make AWS deploy environment in docker container(Optional)

This section for separate each environment of development and delivery.

1. Replace "iam key", "iam secret key", "region", "output" and execute with
 bash. 
    ```bash 
    docker build --tag aws/maker \
    --build-arg key=<your iam key> \
    --build-arg secret_key=<your iam secret_key> \
    --build-arg region=<your region> \
    --build-arg output=<json|text|table> \
    . 
    ```

2. Replace "project path" for volume mount to "/root/src" 

    ```bash
    docker create --name aws-maker \
    --volume <This project directory path>:/root/src \
    -it \
    aws/maker
    ```

3. Start container and attach using bash to use

    ```bash
    $ docker start aws-maker
    $ docker exec -it aws-maker "/bin/bash" 
    ``` 

