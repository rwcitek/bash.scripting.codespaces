# Running a Docker service in Code Spaces

## Running the base Jupyter notebook
Open this repository in a Code Space.  
Then, in the terminal, run this code block ( note the curly braces ):
```bash
{ SHARED=${PWD}
mkdir -p "${SHARED}"
docker container run \
  --rm \
  --interactive \
  --tty \
  --publish 8888:8888 \
  --volume "${SHARED}":/home/jovyan/shared \
  --workdir /home/jovyan/shared \
  --name jupyter_lab \
  jupyter/base-notebook \
    start-notebook.sh \
    --NotebookApp.allow_origin_pat='.*.preview.app.github.dev' \
    --NotebookApp.token=''
}
```

This will start a Docker container running a Jupyter Lab session on port 8888, which is being tunneled to your local system.  
If you ctrl+click on the link with the token shown in the terminal window, 
Code Spaces will open a new browser tab and display the Jupyter Lab environment.  
For example:

```
http://127.0.0.1:8888/lab?token=b8b0a62e4265d5a89e0aa91adb8248d5410fbe55620c3266
```

## Running the Data Science Jupyter notebook
For a more feature-rich data science environment, 
open this repository in a Code Space.  
Then, in the terminal, run this code block ( note the curly braces ):
```bash
{ SHARED=${PWD}
mkdir -p "${SHARED}"
docker container run \
  --rm \
  --interactive \
  --tty \
  --publish 8888:8888 \
  --volume "${SHARED}":/home/jovyan/shared \
  --workdir /home/jovyan/shared \
  --name jupyter_lab \
  jupyter/datascience-notebook \
    start-notebook.sh \
    --NotebookApp.allow_origin_pat='.*.preview.app.github.dev' \
    --NotebookApp.token=''
}
```

