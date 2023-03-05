# Running a Docker service in Code Spaces

Open this file in a Code Space.  Then, in the terminal, run this code block ( note the curly braces ):
```bash
{ SHARED=${PWD}
mkdir -p "${SHARED}"
docker container run \
  --rm \
  -it \
  -p 8888:8888 \
  -v "${SHARED}":/home/jovyan/shared ${DooD} \
  -w /home/jovyan/shared \
  jupyter/base-notebook \
    start-notebook.sh \
    --NotebookApp.allow_origin_pat='.*.preview.app.github.dev'
}
```

This will start a Docker container running a Jupyter Lab session on port 8888, which is being tunneled to your local system.  If you ctrl+click on the link with the token shown in the terminal window, Code Spaces will open a new tab with and display the Jupyter Lab environment.  For example:

```
http://127.0.0.1:8888/lab?token=b8b0a62e4265d5a89e0aa91adb8248d5410fbe55620c3266
```




