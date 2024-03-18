<p align="center">
 <img alt="docker-twserver logo" src="https://raw.githubusercontent.com/K4rian/docker-twserver/assets/icons/logo-docker-twserver.svg" width="25%" align="center">
</p>

A Docker image for the [twserver-go][1] project based on the official [Alpine Linux][2] [image][3].

---
<div align="center">

Docker Tag  | Version | Platform     | Description
---         | ---     | ---          | ---
[latest][4] | 1.1     | amd64, arm64 | Latest release
</div>
<p align="center"> <a href="#usage">Usage</a> &bull; <a href="#using-compose">Using Compose</a> &bull; <a href="#manual-build">Manual build</a> &bull; <a href="#license">License</a></p>

## Usage
- Create and run a container with a volume attached to keep the data safe:
```shell
docker run -d \
  --name twserver \
  -p 8080:8080/tcp \
  -v twserver_data:/home/tw \
  -i k4rian/twserver
```

- Same as above but using a different port (`8080`(default) -> `52041`):
```shell
docker run -d \
  --name twserver \
  -p 52041:8080/tcp \
  -v twserver_data:/home/tw \
  -i k4rian/twserver
```

## Using Compose
- Deploying the server with the provided [compose file][5]:
```shell
docker compose -p twserver up -d
```
> A named volume is defined in order to store the server data that can be recovered if the container is removed and restarted.

## Manual build
__Requirements__:<br>
— Docker >= __18.09.0__<br>
— Git *(optional)*

Like any Docker image the building process is pretty straightforward: 

- Clone (or download) the GitHub repository to an empty folder on your local machine:
```shell
git clone https://github.com/K4rian/docker-twserver.git .
```

- Then run the following command inside the newly created folder:
```shell
docker build --no-cache -t k4rian/twserver .
```

## License
[MIT][6]

[1]: https://github.com/K4rian/twserver-go "twserver-go GitHub Repository"
[2]: https://www.alpinelinux.org/ "Alpine Linux Official Website"
[3]: https://hub.docker.com/_/alpine "Alpine Linux Docker Image"
[4]: https://github.com/K4rian/docker-twserver/blob/master/Dockerfile "Latest Dockerfile"
[5]: https://github.com/K4rian/docker-twserver/blob/master/docker-compose.yml "Compose file"
[6]: https://github.com/K4rian/docker-twserver/blob/master/LICENSE