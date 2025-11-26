# Use required base image
FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

# copy lock file into the container
COPY conda-linux-64.lock /tmp/conda-linux-64.lock

#install packages from lock file
RUN conda create --name docker_prac_env --file /tmp/conda-linux-64.lock && conda clean --all -y

#set environment 
ENV PATH /opt/conda/envs/docker_prac_env/bin:$PATH

#default command 
CMD ["bash"]