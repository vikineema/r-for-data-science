FROM quay.io/jupyter/r-notebook:latest AS base

USER root

# Install quarto
RUN apt-get update --yes && \
    apt-get install -y librsvg2-bin && \
    wget -O /tmp/quarto.deb  https://github.com/quarto-dev/quarto-cli/releases/download/v1.8.26/quarto-1.8.26-linux-amd64.deb   && \
    dpkg -i /tmp/quarto.deb && \
    rm /tmp/quarto.deb && \     
    apt-get clean && rm -rf /var/lib/apt/lists/*
RUN quarto install tinytex --update-path

# macOS Rosetta virtualization creates junk directory which gets owned by root further up.
# It'll get re-created, but as USER runner after the next directive so hopefully should not cause permission issues.
#
# More info: https://github.com/jupyter/docker-stacks/issues/2296
RUN rm -rf "/home/${NB_USER}/.cache/"

USER ${NB_UID}

RUN mamba install --yes \
    'r-arrow' \
    'r-babynames' \
    'r-curl' \
    'r-duckdb' \
    'r-gapminder' \
    'r-ggthemes' \
    'r-ggrepel' \
    'r-hexbin' \
    'r-janitor' \
    'r-Lahman' \
    'r-leaflet' \
    'r-maps' \
    'r-nycflights13' \
    'r-openxlsx' \
    'r-palmerpenguins' \
    'r-repurrrsive' \
    'r-tidymodels' \
    'r-writexl' && \
    mamba clean --all -f -y
