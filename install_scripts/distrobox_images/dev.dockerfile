FROM fedora:latest

## Install mise and set up development environment
RUN dnf groupinstall -y "Development Tools"
RUN dnf install -y dnf-plugins-core \
    zlib-devel \
    bzip2-devel \
    openssl-devel \
    ncurses-devel \
    sqlite-devel \
    readline-devel \
    tk-devel \
    gdbm-devel \
    libpcap-devel \
    xz-devel \
    expat-devel \
    libffi-devel
RUN dnf config-manager --add-repo https://mise.jdx.dev/rpm/mise.repo
RUN dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
RUN dnf install -y mise terraform awscli
RUN mise use -g python@latest node@latest go@latest
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

RUN <<EOF
tee -a /etc/yum.repos.d/vscodium.repo << EOY
[gitlab.com_paulcarroty_vscodium_repo]
name=gitlab.com_paulcarroty_vscodium_repo
baseurl=https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg
metadata_expire=1h
EOY
EOF

RUN <<EOF
tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM
[google-cloud-cli]
name=Google Cloud CLI
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el9-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=0
gpgkey=https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOM
EOF

RUN dnf update -y && dnf install google-cloud-cli fish codium -y
RUN chsh -s /usr/bin/fish

RUN fish -c "curl -sL git.io/fisher | source && fisher install jorgebucaran/fisher"
RUN fish -c "fisher update"

ENV PATH=$HOME/.cargo/env.fish:$PATH
ENV GOPATH=$HOME/go
ENV PATH=$PATH:$GOPATH/bin

