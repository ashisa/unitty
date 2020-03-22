# UniTTY
 UniTTY is a linux container that unlocks new ways to access a linux shell and automate stuff on Azure. You can customize for other clouds too if you need to.

 Get it from - **docker.io/ashisa/unitty**

 It is built on top of the official Docker Python 3.6.10 Debian 10 image - **python:3.6.10-slim-buster**

 Also bundled is **[GoTTY](https://github.com/yudai/gotty)** which allows you to run the commands or access the shell over HTTP/S - that's the gear in the project that turns everything else that you will see below - visit the project page to learn more about GoTTY.

 As for the other tools included, Azure CLI, Kubectl and PowerShell Core the major ones.

 You can customize the image based on your own requirements and some examples are included in the repo. 

## What can I use it for?
You can use for practically anything that you need an Alpine or Debian image today to do. However, the advantage of Unitty is that with ttyd and a little imagonation you automate a lot of things that otherwise requires shell access.

## How do I get it?
 It's a container image that you can build using the Dockerfile available in this repository or download the pre-built image from Docker Hub - **docker.io/ashisa/unitty**


## Examples
Get a shell with docker - 
```
docker run -it docker.io/ashisa/unitty
```
Run a command with docker and see the output in the browser -
```
docker run -it -p 8080:8080 docker.io/ashisa/unitty gotty ls -l /etc
```
Open a browser on your machine and point it to http://127.0.0.1:8080 to see the output of the command in the window.

Run a command (such as vi) interactively in a browser window -
```
docker run -it -p 8080:8080 docker.io/ashisa/unitty gotty -w vi  
```
Run a command of a script and send arguments using the URL -
```
docker run -it -p80:8080 docker.io/ashisa/unitty gotty -w --permit-arguments bash -c
```
Now, you can send arguments to this instance using this URL format - http://127.0.0.01:8080?arg="ls%20-l%20/etc"

That's the interesting bit since you can replace the **bash -c** with a script that takes the arguments from the browser and process them without permitting write to the users.

Please visit my blog https://ashisa.github.io for learn about how I use for some of my more interesting projects.



