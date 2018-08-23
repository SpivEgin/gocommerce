FROM quay.io/spivegin/golangdart2

RUN mkdir /opt/dep/ /opt/gocommerce
ADD . /opt/src/github.com/netlify/gocommerce
ADD https://github.com/golang/dep/releases/download/v0.5.0/dep-linux-amd64 /opt/dep/dep
RUN chmod +x /opt/dep/dep && ln -s /opt/dep/dep /bin/dep &&\
    cd /opt/src/github.com/netlify/gocommerce && dep ensure && make build_linux &&\
    cp gocommerce /opt/gocommerce/gocommerce && ln -s /opt/gocommerce/gocommerce /bin/gocommerce

CMD ["gocommerce"]
EXPOSE 8080
