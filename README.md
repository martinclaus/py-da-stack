# py-da-stack

![build and push](https://github.com/martinclaus/py-da-stack/workflows/build-and-push/badge.svg)
[![Binder badget](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/martinclaus/py-da-stack/master?urlpath=lab "Launch a martinclaus/py-da-stack container on mybinder.org")

Python Data Analysis stack in a Docker container

## How this works
This image is based on the latest [jupyter/base-notebook](https://hub.docker.com/r/jupyter/base-notebook) image. These images are maintained by the [Project Jupyter](https://jupyter.org) at the [docker-stacks](https://github.com/jupyter/docker-stacks) GitHub repository and ensure a recent Jupyter environment that can run Jupyter Lab or Notebook server or behind a JupyterHub.

The additional packages that are installed via `conda` from the `conda-forge` channel are specified in the file [requirements.txt](requirements.txt).

Every Sunday, 5:45 UTC, the image will be rebuild so that the package versions are kept up-to-date. To pin an envronment, you may tag the image you use for the analysis (see below). 

## How to use

### Use the pre-built Docker images with _Docker_

You can use [docker images](https://hub.docker.com/r/martinclaus/py-da-stack) that come with a fully working Jupyter environment and run them with docker.

Assuming you want to expose your work directory to `/work` in the container, then run:
```shell
docker pull martinclaus/py-da-stack:latest
docker run \
    -v ${HOME}/work/:/work -w /work \
    -p 8888:8888 \
    --user $(id -u):$(id -g) --group-add users \
    martinclaus/py-da-stack:latest
```
If you want to run a specific version of this image, replace the tag `latest` accordingly.
All available versions [are found on Dockerhub](https://hub.docker.com/r/martinclaus/py-da-stack/tags).


### Use the pre-built Docker images with _Singularity_

To run from your `/work` dir with Singularity:
```shell
cd /work
singularity run \
    -B $(mktemp -d):/run/user \
    docker://martinclaus/py-da-stack:latest
```

If you want to run a specific version of this image, replace the tag `latest` accordingly.
All available versions [are found on Dockerhub](https://hub.docker.com/r/martinclaus/py-da-stack/tags).

## Run on mybinder.org

To run the latest version of the image on [mybinder.org](https://mybinder.org) use the following URL

https://mybinder.org/v2/gh/martinclaus/py-da-stack/master

To use this image in your own repo, copy the `binder/` folder to your repo and change the binder
URL accordingly.

## Make you analysis reproducible

To obtain a reproducible analysis, it is necessary to freeze your software environment.
This can be achieved by tagging the image you want to use for the analysis.
```shell
docker tag martinclaus/py-da-stack:latest <my_docker_namespace>/py-da-stack:<analysis_id>
```
You can then push the image to your own docker namespace `<my_docker_namespace>`.
```shell
docker push <my_docker_namespace>/py-da-stack:<analysis_id>
```
Note that you need to register at [DockerHub](https://hub.docker.com) to get you own namespace.
You can also choose a a different repository name than `py-da-stack`.
