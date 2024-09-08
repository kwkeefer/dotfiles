FROM fedorabase:latest

RUN sudo dnf update && sudo dnf install -y \
    npm \
    golang

ENV GOPATH=$HOME/go
ENV PATH=$PATH:$GOPATH/bin

RUN npm install -g tldr
RUN go install github.com/tomnomnom/anew@latest
RUN go install github.com/mmmorris1975/aws-runas@latest

ENTRYPOINT [ "bash" ]

