nvidia-docker build -t container1 . && \

ifconfig && \

nvidia-docker run --rm -it -p 8888:8888 -v /home/$USER/:/home/$USER/ container1




