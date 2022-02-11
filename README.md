# py-pkgs JupyterLab Docker support

Docker support for the open-source [py-pkgs book](https://py-pkgs.org). This repository automatically builds and publishes the image `pypkgs/jupyter` to DockerHub. The image is intended to be used for development with [JupyterLab](https://jupyterlab.readthedocs.io/en/stable/#).

## Usage

To develop with Docker in JupyterLab follow the instructions below. Helpful information and tutorials can also be found in the Jupyter Docker Stacks [documentation](https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html).

1. Install and configure Docker Desktop for your operating system following the instructions on the [official website](https://www.docker.com/get-started).
2. Once docker is installed, open a command-line interface and pull the `pypkgs/jupyter` docker image by running the following command:

    ```{prompt} bash \$ auto
    $ docker pull pypkgs/jupyter
    ```

3. From the command line, navigate to the directory you want to develop in (this can be called anything and located wherever you like on your file system).
4. Start a new container from that directory by running the following command from the command line:

    ```{prompt} bash \$ auto
    $ docker run -it \
      -p 8888:8888 \
      -v "${PWD}":/home/jovyan/work \
      pypkgs/jupyter
    ```
    
    ```{tip}
    In the command above, `-it` creates an interactive bash shell in the container, `-p` binds port 8888 in the container to port 8888 on the host machine and `-v` mounts the current directory into the container at the location `/home/jovyan/work`. You can read more about the `docker run` command and its arguments in the Docker command-line interface [documentation](https://docs.docker.com/engine/reference/commandline/run/).
    ```
    
5. Copy the unique URL printed to screen (that looks something like this: `http://127.0.0.1:8888/lab?token=45d53a348580b3acfafa`) to your browser. This will open an instance of JupyterLab running inside a Docker container.
6. Navigate to the `work` directory in JupyterLab. This is where you can develop and create new files and directories that will persist in the directory from where you launched your container.
7. Test that you have access to the three pre-installed pieces of packaging software we need by opening a terminal in JupyterLab and trying the following commands:

    ```{prompt} bash \$ auto
    $ poetry --version
    $ conda --version
    $ cookiecutter --version
    ```

8. When you've finished a working session, you can exit JupyterLab, and kill your terminal, and your container will persist for you to use later. To re-enter the container at a later time, first find its ID:

    ```{prompt} bash \$ auto
    $ docker ps -a
    ```
    
    ```md
    CONTAINER ID   IMAGE
    653daa2cd48e   pypkgs/jupyter
    ```
    
9. Re-enter the container using the `docker start`command combined with the container's ID:

    ```{prompt} bash \$ auto
    $ docker start -a 653daa2cd48e
    ```
    
10. If you want to completely remove the container, use the following command:

    ```{prompt} bash \$ auto
    $ docker rm 653daa2cd48e
    ```
