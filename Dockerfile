FROM ubuntu:24.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install -y software-properties-common && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt update && \
    apt install -y curl git ansible build-essential vim

ARG USERNAME=ductran
RUN useradd -ms /bin/bash $USERNAME

WORKDIR /home/root

CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]
