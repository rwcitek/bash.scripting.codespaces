# A quick walk through

## Pull an Image

First, list all images.  This is likely an empty list, but it's good to check.

```
docker image list -a
```

Pull an Ubuntu 22.04 image from DockerHub

```
docker pull ubuntu:22.04
```

Verify that it was successfully pulled.

```
docker image list -a
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

## Log in to DockerHub

```

docker login -u rwcitek
```

## Push the Image

```
docker push rwcitek/ubuntu:22.04
```

## Pull the Image
Remove the existing images.

```
docker image rm ubuntu:22.04 rwcitek/ubuntu:22.04
```

Verify that the images were successfully removed.

```
docker image list -a
```

Pull the recently pushed image

```
docker pull rwcitek/ubuntu:22.04
```

Verify that the image was successfully pulled.

```
docker image list -a
```

