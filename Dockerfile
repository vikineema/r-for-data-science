FROM quay.io/jupyter/r-notebook:latest AS base

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
