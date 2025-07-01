#!/bin/bash
    echo "START: Building Katana"
    apt update
    apt install -y build-essential ca-certificates wget unzip git
    apt install -y python3 python3-pip python-is-python3
    wget https://go.dev/dl/go1.21.6.linux-amd64.tar.gz && tar -C /usr/local -xzf go1.21.6.linux-amd64.tar.gz && rm go1.21.6.linux-amd64.tar.gz
    ENV GOROOT=/usr/local/go
    ENV GOPATH=/go
    ENV PATH=$GOPATH/bin:$GOROOT/bin:$PATH
    ENV GO111MODULE=on
    ENV CGO_ENABLED=1
    mkdir -p /go/src
    mkdir -p /go/bin
    cd /tmp && go install github.com/projectdiscovery/katana/cmd/katana@latest
    echo "END: Building httpx"