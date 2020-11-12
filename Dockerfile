FROM lachlanevenson/k8s-kubectl:v1.18.10 AS k8scli

FROM rancher/cli:v2.0.4

COPY --from=k8scli /usr/local/bin/kubectl /usr/local/bin

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

RUN apk update \
    && apk --no-cache add curl \
    && apk --no-cache add bash

RUN curl -L https://github.com/kubernetes/kompose/releases/download/v1.16.0/kompose-linux-amd64 -o kompose

RUN chmod +x kompose
RUN mv ./kompose /usr/local/bin/kompose

ENTRYPOINT []
CMD ["/bin/bash"]
