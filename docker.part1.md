# A quick walk through

## Pull an Image

First, list all images.  This is likely an empty list, but it's good to check.

```
docker image list -a
```
```
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE
```

Pull an Ubuntu 22.04 image from DockerHub

```
docker pull ubuntu:22.04
```
```
22.04: Pulling from library/ubuntu
2ab09b027e7f: Pull complete 
Digest: sha256:67211c14fa74f070d27cc59d69a7fa9aeff8e28ea118ef3babc295a0428a6d21
Status: Downloaded newer image for ubuntu:22.04
docker.io/library/ubuntu:22.04
```

Verify that it was successfully pulled.

```
docker image list -a
```
```
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
ubuntu       22.04     08d22c0ceb15   2 weeks ago   77.8MB
```

## Tag the Image
In order to push it to DockerHub, the image needs to have
the username as a prefix of the repository name.

```
docker image tag ubuntu:22.04 rwcitek/ubuntu:22.04
```

Verify that it was successfully tagged.

```
docker image list -a
```
```
REPOSITORY       TAG       IMAGE ID       CREATED       SIZE
ubuntu           22.04     08d22c0ceb15   2 weeks ago   77.8MB
rwcitek/ubuntu   22.04     08d22c0ceb15   2 weeks ago   77.8MB
```
## Log in to DockerHub

```
docker login -u rwcitek
```
```
Password: 
WARNING! Your password will be stored unencrypted in /home/codespace/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
```

## Push the Image

```
docker push rwcitek/ubuntu:22.04
```
```
The push refers to repository [docker.io/rwcitek/ubuntu]
b93c1bd012ab: Mounted from library/ubuntu 
22.04: digest: sha256:5523f822d85895b0a75236aba20ff6bf4135721b031fceee7a5c4a74a700c1e6 size: 529
```

## Pull the Image
Remove the existing images.

```
docker image rm ubuntu:22.04 rwcitek/ubuntu:22.04
```
```
Untagged: ubuntu:22.04
Untagged: ubuntu@sha256:67211c14fa74f070d27cc59d69a7fa9aeff8e28ea118ef3babc295a0428a6d21
Untagged: rwcitek/ubuntu:22.04
Untagged: rwcitek/ubuntu@sha256:5523f822d85895b0a75236aba20ff6bf4135721b031fceee7a5c4a74a700c1e6
Deleted: sha256:08d22c0ceb150ddeb2237c5fa3129c0183f3cc6f5eeb2e7aa4016da3ad02140a
Deleted: sha256:b93c1bd012ab8fda60f5b4f5906bf244586e0e3292d84571d3abb56472248466
```

Verify that the images were successfully removed.

```
docker image list -a
```
```
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE
```

Pull the recently pushed image

```
docker pull rwcitek/ubuntu:22.04
```
```
22.04: Pulling from rwcitek/ubuntu
2ab09b027e7f: Pull complete 
Digest: sha256:5523f822d85895b0a75236aba20ff6bf4135721b031fceee7a5c4a74a700c1e6
Status: Downloaded newer image for rwcitek/ubuntu:22.04
docker.io/rwcitek/ubuntu:22.04
```

Verify that the image was successfully pulled.

```
docker image list -a
```
```
REPOSITORY       TAG       IMAGE ID       CREATED       SIZE
rwcitek/ubuntu   22.04     08d22c0ceb15   2 weeks ago   77.8MB
```


