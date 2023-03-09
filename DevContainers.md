# Developing inside a Container
## [Dev Containers](https://code.visualstudio.com/docs/devcontainers/tutorial)

**Follow the steps below**
##### VScode - Requirements
```bash
# Requirements
# Install Docker extension from vscode store

# Install Remote Development extension from vscode store

# Install Dev Containers extension from vscode store
```

##### VScode
```bash
# Create a Dev Containers from menu to get project Skeleton
ctrl + shift + p

# select from menu:
Dev Containers: Add Dev Container Configuration Files...

# create a base container from alpine, etc...

# inside .devcontainer open devcontainer.json
# edit "name": "NAME" to your container name

# uncomment "customizations" and add your settings or extensions like
"customizations": {
		"vscode": {
			"settings": {},
			"extensions": ["ms-python.python"]
		}
	},

# to add a extension, go to store and search for a extension
# then click with right button and click on Copy Extension ID
# the extension id will be something like
"ms-python.python"

# Using Dockerfiles

# Remove the image property from devcontainer.json (if it exists) and
# add the build and dockerfile properties instead:
# remove "image": "mcr.microsoft.com/devcontainers/base:alpine-3.17" and
# add Dockerfile config and path
"build": {
        // Path is relataive to the devcontainer.json file.
        "dockerfile": "Dockerfile"
    }

# Using Docker Compose

# Remove the image property from devcontainer.json (if it exists) and
# add the build and dockerComposeFile properties instead:
# remove "image": "mcr.microsoft.com/devcontainers/base:alpine-3.17" and
# add Docker Compose config and path
"dockerComposeFile": "docker-compose.yml",
"service": "devcontainer",
"workspaceFolder": "/workspaces/${localWorkspaceFolderBasename}"

- dockerComposeFile: a "docker-compose.yml" file
- service: the container that will open by default after building everything
- workspaceFolder: the folder where the container will open when it starts
```

##### Examples
Folder structure example
```
.devcontainer
├── devcontainer.json
└── docker-compose.yml
```

###### devcontainer.json
```json
// For format details, see https://aka.ms/devcontainer.json. For config options, see the
// README at: https://github.com/devcontainers/templates/tree/main/src/alpine
{
	"name": "Back",
	// Or use a Dockerfile or Docker Compose file. More info: https://containers.dev/guide/dockerfile
	"dockerComposeFile": "docker-compose.yml",
	"service": "postgres",
	"workspaceFolder": "/"

	// Features to add to the dev container. More info: https://containers.dev/features.
	// "features": {},

	// Use 'forwardPorts' to make a list of ports inside the container available locally.
	// "forwardPorts": [],

	// Use 'postCreateCommand' to run commands after the container is created.
	// "postCreateCommand": "uname -a",

	// Configure tool-specific properties.
	"customizations": {
		"vscode": {
			"settings": {},
			"extensions": ["ms-python.python"]
		}
	},

	// Uncomment to connect as root instead. More info: https://aka.ms/dev-containers-non-root.
	// "remoteUser": "root"
}
```

###### docker-compose.yml
```yml
version: "3"
services:
  postgres:
    image: postgres:14-alpine
    container_name: postgres
    ports:
      - "5432:5432"
    environment:
      POSTGRES_USER: root
      POSTGRES_PASSWORD: root
      POSTGRES_DB: postgres
  # front-dev:
  #   image: front-dev
  #   build:
  #     context: ./front
  #   container_name: front-dev
  #   ports:
  #     - "8080:8080"
  #   volumes:
  #     - ./front/mentorme:/home/mentorme
  #   restart: always
  #   depends_on:
  #     - postgres
  # back-dev:
  #   image: back-dev
  #   build:
  #     context: ./back
  #   container_name: back-dev
  #   ports:
  #     - "3000:3000"
  #   volumes:
  #     - ./back:/back
  #   restart: always
  #   depends_on:
  #     - postgres
```

###### Dockerfile
```Dockerfile
FROM python:3.10

RUN mkdir -p /back

WORKDIR /back

COPY ./app/requirements.txt .

RUN pip install --no-cache-dir --upgrade -r /back/app/requirements.txt

EXPOSE 3000

ENTRYPOINT ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "3000", "--reload"]
```

---

## External links

https://code.visualstudio.com/docs/devcontainers/containers <br>
https://code.visualstudio.com/docs/devcontainers/tutorial <br>
https://containers.dev/ <br>
https://containers.dev/features <br>
https://containers.dev/guide/dockerfile#docker-compose-image <br>
