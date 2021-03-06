# use minimal jupyter base notebook
FROM martinclaus/base-notebook:ebd3af46eee7

# enable jupyterlab as default app
ENV JUPYTER_ENABLE_LAB=true

# Install from requirements.txt file with conda
COPY requirements.txt /tmp/
RUN mamba install --yes --file /tmp/requirements.txt && \
    # Build Jupyterlab extensions
    jupyter labextension install -y --clean --no-build \
        jupyterlab-jupytext dask-labextension && \
    jupyter lab build && \
    # clean conda cache, index and package tarballs
    mamba clean -a && \
    # fix file permissions
    fix-permissions $CONDA_DIR && \
    fix-permissions $HOME
