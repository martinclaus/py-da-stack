# use minimal jupyter base notebook
FROM jupyter/base-notebook:latest

# enable jupyterlab as default app
ENV JUPYTER_ENABLE_LAB=true

# Install from requirements.txt file with conda
COPY requirements.txt /tmp/
RUN conda install -c conda-forge --yes --file /tmp/requirements.txt && \
    # Build Jupyterlab extensions
    jupyter labextension install -y --clean --no-build jupyterlab-jupytext dask-labextension && \
    jupyter lab build && \
    # fix file permissions
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER
