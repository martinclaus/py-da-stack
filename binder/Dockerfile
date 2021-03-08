
FROM martinclaus/py-da-stack:2020.08.28-b393f80

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID

# Copy repo content to home directory
COPY . $HOME/

WORKDIR $HOME
