FROM ubuntu:focal

# Update packages
RUN apt update && apt install -y curl git

# Download gitea
RUN curl https://dl.gitea.io/gitea/1.16.7/gitea-1.16.7-linux-amd64 --output /usr/bin/gitea
RUN chmod +x /usr/bin/gitea

# Configure user
RUN groupadd -g 4200 git_volume
RUN adduser --system --shell /bin/bash --gecos 'Git Version Control' --gid 4200 --disabled-password --home /home/git git

# Prepare directories
RUN mkdir -pv /var/lib/gitea/{custom,data,log}
RUN chown -Rv git:git_volume /var/lib/gitea
RUN mkdir -v /etc/gitea
RUN chown -Rv root:git_volume /etc/gitea
RUN chmod -Rv 770 /etc/gitea

# Prepare environment
ENV USER=git
ENV HOME=/home/git
ENV GITEA_WORK_DIR=/var/lib/gitea

USER git

# COPY app.ini /etc/gitea/app.in
# COPY gitea.db /etc/gitea/gitea.db

CMD ["usr/bin/gitea", "web", "--config", "/etc/gitea/app.ini"]
