# use minimal jupyter base notebook
FROM martinclaus/base-notebook:lab-3.0.9

# enable jupyterlab as default app
ENV JUPYTER_ENABLE_LAB=true

# Install from requirements.txt file with conda
COPY requirements.txt /tmp/
RUN conda install -c conda-forge --yes --update-deps --file /tmp/requirements.txt && \
    # Build Jupyterlab extensions
    jupyter labextension install -y --clean --no-build \
        jupyterlab-jupytext dask-labextension && \
    jupyter lab build && \
    # clean conda cache, index and package tarballs
    conda clean -a && \
    # Fix https://github.com/jupyter/docker-stacks/issues/1205 to run with Jupyter Server 1.4.0
    echo "c.ExtensionApp.open_browser = False" >> /etc/jupyter/jupyter_server_config.py && \
    # fix file permissions
    fix-permissions $CONDA_DIR && \
    fix-permissions $HOME
