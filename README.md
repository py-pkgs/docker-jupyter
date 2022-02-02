# py-pkgs JupyterLab Docker support

Docker support for the open-source [py-pkgs book](https://py-pkgs.org). This repository automatically builds and publishes the image `tbeuzen/py-pkgs-jupyterlab` to DockerHub. The image is intended to be used for development with [JupyterLab](https://jupyterlab.readthedocs.io/en/stable/#).

## Usage

1. Install and configure Docker Desktop for your operating system following the instructions on the [official website](https://www.docker.com/get-started).
2. From the command line, open/create a working directory you want to develop in (this can be called anything and located wherever you like on your file system).
3. Create a file called *`docker-compose.yml`* and add the following content to it (or simply copy the file from our [GitHub repository](https://github.com/py-pkgs/docker-jupyter/blob/main/docker-compose.yml)):

    ```yaml
    services:
      poetry:
        image: tbeuzen/py-pkgs-jupyter
        ports:
          - "8888:8888"
        volumes:
          - .:/home/jovyan/work
    ```

4. Start a new container by running the following command from the command line:

    ```{prompt} bash \$ auto
    $ docker-compose up
    ```

5. Copy the unique URL printed to screen (that looks something like this: `http://127.0.0.1:8888/lab?token=45d53a348580b3acfafaa830e99b37d51a501d125663a5c0`) to your browser. This will open an instance of JupyterLab running inside a Docker container.
6. Navigate to the `work` directory in JupyterLab. This is where you can develop and create new files and directories that will persist in the directory from where you launched your container (i.e., where you ran `docker-compose up`).
7. Test that you have access to the three pre-installed pieces of packaging software we need by opening  a Terminal in JupyterLab and trying the following commands:

    ```{prompt} bash \$ auto
    $ poetry --version
    $ conda --version
    $ cookiecutter --version
    ```

8. When you've finished a working session, exit JupyterLab, kill your terminal, and run the following command:

    ```{prompt} bash \$ auto
    $ docker-compose down
    ```
