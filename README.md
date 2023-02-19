# Running a Docker service in Code Spaces

I am trying out running a Docker container of Jupyter Lab in Code Spaces.  I'm running into a what looks like a CORS error.

Open this file in a Code Space.  Then, in the terminal, run this command:
```bash
docker container run -it -p 8888:8888 jupyter/base-notebook
```

This will start a Docker container running a Jupyter Lab session on port 8888, which is being tunneled to your local system.  If you ctrl+click on the link with the token shown in the terminal window, Code Spaces will open a new tab with and display the Jupyter Lab environment.  For example:

```
http://127.0.0.1:8888/lab?token=b8b0a62e4265d5a89e0aa91adb8248d5410fbe55620c3266
```

I can launch a Python notebook and enter a command in a code cell, e.g. "2+2" and press run.  However, the cell never finishes running, i.e. the [\*] next to the cell never turns to a number and there is no output cell.

In the logs, several entries like this appear:
```
[W 2023-02-18 20:37:42.380 ServerApp] Blocking Cross Origin WebSocket Attempt.  Origin: https://rwcitek-turbo-space-pancake-96rvgw5pxf9rpv-8888.preview.app.github.dev, Host: localhost
```

I'm not exactly sure what my questions is.  It could be any one of the following:
- What do I need to change so that I see a result of "4" in the output cell?
- What do I need to change so that I no longer see these error messages in the logs?
- How do I allow localhost access?
- How do I allow rwcitek-... access?
- or is it something else?

