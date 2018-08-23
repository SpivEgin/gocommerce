FROM quay.io/spivegin/golangdart2

RUN mkdir /opt/dep/
ADD . /opt/src/github.com/netlify/gocommerce
ADD https://github.com/golang/dep/releases/download/v0.5.0/dep-linux-amd64 /opt/dep/dep
RUN chmod +x /opt/dep/dep && ln -s /opt/dep/dep /bin/dep &&\
    useradd -m netlify && cd /opt/src/github.com/netlify/gocommerce && dep ensure && make build_linux && cp gocommerce
    /usr/local/bin/

USER netlify
CMD ["gocommerce"]
EXPOSE 8080
