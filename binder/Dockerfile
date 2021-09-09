
FROM martinclaus/py-da-stack:latest

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID

# Copy repo content to home directory
COPY . $HOME/

WORKDIR $HOME
