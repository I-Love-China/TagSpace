## Get into Docker cotainer's shell



> `docker attach` will let you connect to your Docker container, but this isn't really the same thing as `ssh`. If your container is running a webserver, for example, `docker attach` will probably connect you to the *stdout* of the web server process. It won't necessarily give you a shell.
>
> 
>
> ==The `docker exec` command is probably what you are looking for==; this will let you run arbitrary commands inside an existing container. For example:
>
> ```bash
> docker exec -it <mycontainer> bash
> ```





## 参考

1. [How do I get into a Docker container's shell?](https://stackoverflow.com/questions/30172605/how-do-i-get-into-a-docker-containers-shell)