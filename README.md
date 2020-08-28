# py-da-stack

![env-create](https://github.com/martinclaus/py-da-stack/workflows/env-create/badge.svg)
![repo2docker](https://github.com/martinclaus/py-da-stack/workflows/repo2docker/badge.svg)

Python Data Analysis stack in Docker container

## How to use?

### Use the pre-built Docker images with _Docker_

You can use [docker images](https://hub.docker.com/r/martinclaus/py-da-stack) that come with a fully working (repo2docker-built) Jupyter environment and run them with docker.

Assuming you want to expose your work directory to `/work` in the container, then run:
```shell
docker pull martinclaus/py-da-stack:latest
docker run \
    -v ${HOME}/work/:/work -w /work \
    -p 8888:8888 martinclaus/py-da-stack:latest \
    jupyter lab --no-browser --ip="0.0.0.0" --port="8888"
```
If you want to run a specific version of this image, replace the tag `latest` accordingly.
All available versions [are found on Dockerhub](https://hub.docker.com/r/martinclaus/py-da-stack/tags).


### Use the pre-built Docker images with _Singularity_

To run from your `work/` dir with Singularity:
```shell
cd /work
singularity run \
    -B $(mktemp -d):/run/user \
    docker://martinclaus/py-da-stack:latest \
    jupyer lab --no-browser --ip="0.0.0.0"
```

If you want to run a specific version of this image, replace the tag `latest` accordingly.
All available versions [are found on Dockerhub](https://hub.docker.com/r/esmvfc/esm-vfc-stacks/tags).
