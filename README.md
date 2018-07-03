Docker Image for vopt
=====================

Docker image for vopt Optimization

You can download this image from https://hub.docker.com/r/veranostech/vopt/


Prerequisite
------------

* Linux

  Install docker. for example on ubuntu
  
  ```
  $ sudo apt install docker
  ```

* Mac with "**Docker for Mac**"

  * https://store.docker.com/editions/community/docker-ce-desktop-mac

* Windows with "**Docker for Windows**"

  * https://store.docker.com/editions/community/docker-ce-desktop-windows

* Mac/Windows with "**Docker-Toolbox**"

  * https://docs.docker.com/toolbox/overview/
  
  On windows, you **must include git** when install docker toolbox.
  
  The installation script creates a new VirtualBox machine named **"vopt"** 
  when you use Docker-Toolbox on Mac/Windows.
  Check the ip address of the **"vopt"** machine using ``docker-machine ls`` before connect the docker container.


Pull (Download)
---------------

You can download the pre-built image from docker hub using `docker pull` command.
```
$ docker pull veranostech/vopt
```


Build
-----

On Linux, Mac with "Docker for Mac", or Windows with "Docker for Windows", 
the build script ``build.sh`` just builds a docker image named `vopt`.

On Mac/Windows with Docker-Toolbox, the build script ``build_dockertoolbox_mac.sh`` or ``build_dockertoolbox_windows.sh``
creates a new docker-machine named `vopt` 
and builds a docker image named `veranostech/vopt` on it.

* Linux, Mac with "Docker for Mac", or Windows with "Docker for Windows"
  ```
  $ source build.sh
  ```
  
* Mac with "Docker Toolbox"
  ```
  $ source build_dockertoolbox_mac.sh
  ```

* Windows with "Docker Toolbox" (in Docker Quickstart Terminal)
  ```
  $ source build_dockertoolbox_windows.sh
  ```


In ``Dockerfile``, we provide several Ubuntu repositories.

 * http://kr.archive.ubuntu.com/ubuntu/
 * http://ftp.neowiz.com/ubuntu/
 * http://ftp.daumkakao.com/ubuntu/

If there is package download problems in a repo server,
comment out the other repo server and use it instead.


Run
---

Run and go into docker container by typing following commmands. 
If you success in starting docker container, 
you will go into the container and the prompt will be changed as:
```
user@4497c9c5e6d9:~$
```
If you want to go out the docker container without stopping, type ``Ctrl-p + Ctrl-q + Enter``.


* Linux, Mac with "Docker for Mac", or Windows with "Docker for Windows"
  ```
  $ docker run --name vopt -Pit -p 8222:22 -p 8887:8887 veranostech/vopt
  ```

* Mac with "Docker Toolbox"
  ```
  $ docker-machine start vopt
  $ eval $(docker-machine env vopt)
  $ docker run --name vopt -Pit -p 8222:22 -p 8887:8887 veranostech/vopt
  ```

* Windows with "Docker Toolbox" (in Docker Quickstart Terminal)
  ```
  $ docker-machine start vopt
  $ eval $(docker-machine env vopt)
  $ docker run --name vopt -Pit -p 8222:22 -p 8887:8887 veranostech/vopt
  ```

If you want to share your host computer's directory inside docker container, add ``-v`` option like:
```
docker run --name vopt -Pit -p 8222:22 -p 8887:8887 -v /c/Users/호스트계정이름:/home/user/hosthome veranostech/vopt
```


Connect to Jupyter Notebook
----------------------------

If docker container start, jupyter notebook server start automatically.
If you want to connect to jupyter notebook server in container:

1. Attach (go into) the container:
   ```
   $ docker attach vopt
   ```

2. Find jupyter notebook link:
   ```
   user@4497c9c5e6d9:~$ $ jupyter notebook list
   Currently running servers:
   http://localhost:8888/?token=c8de56fa4deed24899803e93c227592aef6538f93025fe01
   ```
   
3. Web browse to the link and start notebook
