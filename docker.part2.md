# Building a Titanic image

## Build an Image

First, list all images.

```
docker image list -a
```
```
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE
```

Build the image from the Dockerfile

```
cd ./docker
docker image build --tag rwcitek/titanic:v001 ./.
```
```
...
 => [4/4] COPY Dockerfile /
 => exporting to image
 => => exporting layers
 => => writing image sha256:9ae8050b8d1bb797f328d393dc43717d722d9244c4426db23eeb1dda0b22f0bf
 => => naming to docker.io/rwcitek/titanic:v001
```

Verify that it was successfully built.

```
docker image list -a
```
```
REPOSITORY        TAG       IMAGE ID       CREATED              SIZE
rwcitek/titanic   v001      9ae8050b8d1b   About a minute ago   340MB
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
docker image push rwcitek/titanic:v001
```
```
The push refers to repository [docker.io/rwcitek/titanic]
d4737984e05b: Pushed 
627f4062178a: Pushed 
0f022cc4d065: Pushed 
b93c1bd012ab: Pushed 
v001: digest: sha256:649d426cb04e913c1a518967fd3d6b285a14ddf61dbc20716c8f9ded8fd5a4f8 size: 1157
```

## Pull the Image
Remove the existing images.

```
docker image rm rwcitek/titanic:v001
```
```
Untagged: rwcitek/titanic:v001
Untagged: rwcitek/titanic@sha256:649d426cb04e913c1a518967fd3d6b285a14ddf61dbc20716c8f9ded8fd5a4f8
Deleted: sha256:9ae8050b8d1bb797f328d393dc43717d722d9244c4426db23eeb1dda0b22f0bf
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
docker image pull rwcitek/titanic:v001 
```
```
v001: Pulling from rwcitek/titanic
74ac377868f8: Already exists 
bac77504e754: Already exists 
6d3e57422948: Already exists 
06395c47ddb2: Already exists 
Digest: sha256:649d426cb04e913c1a518967fd3d6b285a14ddf61dbc20716c8f9ded8fd5a4f8
Status: Downloaded newer image for rwcitek/titanic:v001
docker.io/rwcitek/titanic:v001
```

Verify that the image was successfully pulled.

```
docker image list -a
```
```
REPOSITORY        TAG       IMAGE ID       CREATED         SIZE
rwcitek/titanic   v001      9ae8050b8d1b   8 minutes ago   340MB
```

## Run an instance

```
docker container run --rm rwcitek/titanic:v001 bash -c 'csvcut -c 1-5 titanic.csv | head | csvlook '
```
```
| PassengerId | Survived | Pclass | Name                                                | Sex    |
| ----------- | -------- | ------ | --------------------------------------------------- | ------ |
|           1 |    False |      3 | Braund, Mr. Owen Harris                             | male   |
|           2 |     True |      1 | Cumings, Mrs. John Bradley (Florence Briggs Thayer) | female |
|           3 |     True |      3 | Heikkinen, Miss. Laina                              | female |
|           4 |     True |      1 | Futrelle, Mrs. Jacques Heath (Lily May Peel)        | female |
|           5 |    False |      3 | Allen, Mr. William Henry                            | male   |
|           6 |    False |      3 | Moran, Mr. James                                    | male   |
|           7 |    False |      1 | McCarthy, Mr. Timothy J                             | male   |
|           8 |    False |      3 | Palsson, Master. Gosta Leonard                      | male   |
|           9 |     True |      3 | Johnson, Mrs. Oscar W (Elisabeth Vilhelmina Berg)   | female |
```




