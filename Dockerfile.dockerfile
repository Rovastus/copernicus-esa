FROM jupyter/datascience-notebook:latest
LABEL maintainer "Rovastus"
USER root

#download and install conda
ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"

RUN apt-get update
RUN sudo apt-get install -y wget

RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh 
    
RUN conda --version

#install needed libraries
RUN pip install sentinelsat
RUN conda install -c conda-forge rasterio
RUN conda install -c conda-forge netcdf4