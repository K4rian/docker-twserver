docker-twserver
=====

A Docker image for the [twserver-go](https://github.com/K4rian/twserver-go) project based on [debian](https://hub.docker.com/_/debian/):[buster-slim](https://hub.docker.com/_/debian/?tab=tags&page=1&name=buster-slim).



## Usage

- Create and run a container with a volume attached to keep the data safe:
```
$ docker run -d \
    --name twserver \
    -v twserver_data:/home/tw \
    -i k4rian/twserver
```

- Same as above but using a different port (`8080`(default) -> `8888`):
```
$ docker run -d \
    --name twserver \
    -p 8888:8080 \
    -v twserver_data:/home/tw \
    -i k4rian/twserver
```



## Manual build

__Requirements__:                               
— Docker >= __18.03.1__                         
— Git *(optional)*

Like any Docker image the building process is pretty straightforward: 

- Clone (or download) the GitHub repository to an empty folder on your local machine:
```
$ git clone https://github.com/K4rian/docker-twserver.git .
```

- Then run the following command inside the newly created folder:
```
$ docker build --no-cache -t twserver .
```



## License

[MIT](LICENSE)