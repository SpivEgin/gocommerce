FROM netlify/go-glide:v0.12.3

RUN mkdir /opt/dep/
ADD . /go/src/github.com/netlify/gocommerce
ADD https://github.com/golang/dep/releases/download/v0.5.0/dep-linux-amd64 /opt/dep/dep
RUN chmod +x /opt/dep/dep && ln -s /opt/dep/dep /bin/dep &&\
    useradd -m netlify && cd /go/src/github.com/netlify/gocommerce && make deps build_linux && mv gocommerce /usr/local/bin/

USER netlify
CMD ["gocommerce"]
EXPOSE 8080
