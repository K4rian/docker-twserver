docker-twserver
=====

A Docker image for the [twserver-go](https://github.com/K4rian/twserver-go) project based on [Debian](https://hub.docker.com/_/debian/) (bullseye-slim).



## Usage

- Create and run a container with a volume attached to keep the data safe:
```shell
docker run -d \
  --name twserver \
  -v twserver_data:/home/tw \
  -i k4rian/twserver
```

- Same as above but using a different port (`8080`(default) -> `8888`):
```shell
docker run -d \
  --name twserver \
  -p 8888:8080 \
  -v twserver_data:/home/tw \
  -i k4rian/twserver
```

- Using `docker compose` with the provided [compose file](https://github.com/K4rian/docker-twserver/blob/master/docker-compose.yml):
```shell
docker compose up
```



## Manual build

__Requirements__:                               
— Docker >= __18.09.0__                         
— Git *(optional)*

Like any Docker image the building process is pretty straightforward: 

- Clone (or download) the GitHub repository to an empty folder on your local machine:
```shell
git clone https://github.com/K4rian/docker-twserver.git .
```

- Then run the following command inside the newly created folder:
```shell
docker build --no-cache -t twserver .
```

- Or use `docker compose`:
```shell
docker compose build --no-cache
```



## License

[MIT](LICENSE)