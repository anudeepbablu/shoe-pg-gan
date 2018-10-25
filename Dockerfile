FROM nvcr.io/nvidia/tensorflow:18.08-py3
ARG PYTHON_VERSION=3.6
EXPOSE 8888
EXPOSE 6006

# update Ubuntu
RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
   build-essential \
   byobu \
   curl \
   git-core \
   htop \
   pkg-config \
   python3-dev \
   python-pip \
   python-setuptools \
   python-virtualenv \
   unzip \
   && \
apt-get clean && \
rm -rf /var/lib/apt/lists/*

# install Miniconda
RUN curl -o ~/miniconda.sh -O  https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh  && \
    chmod +x ~/miniconda.sh && \
    ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    /opt/conda/bin/conda install -y python=$PYTHON_VERSION pyyaml mkl mkl-include cython typing && \
    /opt/conda/bin/conda install -y jupyter notebook pandas scikit-learn seaborn && \
    /opt/conda/bin/conda clean -ya
ENV PATH /opt/conda/bin:$PATH

# update pip3
RUN pip install -U pip

# custom packages
RUN pip install -U tensorflow-gpu tensorflow_hub
RUN pip install keras
RUN pip install urllib3
RUN pip install pillow
RUN pip install tqdm
#RUN pip install regex
#RUN pip install gensim nltk
#RUN conda install pytorch torchvision -c pytorch

# startup command
WORKDIR /home/anudeep/projects/shopbop
#CMD jupyter notebook --allow-root --ip=0.0.0.0 --no-browser --NotebookApp.token=''

