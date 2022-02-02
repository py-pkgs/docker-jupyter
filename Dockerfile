# Author: Tiffany A. Timbers
FROM jupyter/minimal-notebook:python-3.9.7

USER root

# install curl needed for installing Poetry
RUN apt update --yes && \
  apt upgrade --yes && \
  apt install --yes --no-install-recommends \
  curl

USER ${NB_UID}

# install cookiecutter and jupyter extensions
RUN conda install -c conda-forge --quiet --yes \
  cookiecutter \
  jupyterlab-git \
  jupyterlab-spellchecker \
  jupytext \
  jupyterlab-lsp \
  jupyter-lsp-python

RUN curl -sSL https://install.python-poetry.org | python3 -

ENV PATH="$HOME/.local/bin:${PATH}"
