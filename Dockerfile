FROM continuumio/anaconda3
RUN apt-get update
RUN apt-get install -y tar git curl nano wget dialog net-tools build-essential pyqt4-dev-tools
RUN mkdir /data
RUN conda install matplotlib
RUN conda install networkx
RUN conda install -c conda-forge nxviz
RUN conda install pandas
RUN conda install numpy
RUN conda install jupyter
RUN mkdir /notebooks
COPY /data/ /data
