FROM rancher/cli:v2.0.4

ENV KUBERNETES_VERSION=v1.12.3

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

RUN apk --update --no-cache add curl bash \
    && curl -LO https://storage.googleapis.com/kubernetes-release/release/$KUBERNETES_VERSION/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl

COPY assets/root/ /

ENTRYPOINT ["entrypoint"]
CMD ["rancher"]
