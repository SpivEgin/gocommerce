# Build image
FROM quay.io/spivegin/golangbase AS build-env
RUN mkdir /opt/dep/ /opt/gocommerce /opt/src/src
WORKDIR /opt/gocommerce
ADD . /opt/src/src/github.com/netlify/gocommerce
RUN cd /opt/src/src/github.com/netlify/gocommerce &&\
    dep ensure &&\
    go build -o gocommerce main.go &&\
    cp gocommerce /opt/gocommerce/gocommerce

#Deploy Image
FROM quay.io/spivegin/tlmapis_base
RUN mkdir -p /opt/gocommerce/ /opt/tlmcommerce /opt/tlm/bin
ADD DockerFiles/docker/bash/daptin_entry.sh /opt/tlm/entry.sh
WORKDIR /opt/tlmcommerce
COPY --from=build-env /opt/gocommerce/gocommerce /opt/tlm/bin/gocommerce
RUN chmod +x /opt/tlm/bin/gocommerce && ln -s /opt/tlm/bin/gocommerce /bin/gocommerce &&\
    chmod +x /opt/tlm/entry.sh

EXPOSE 6380
CMD ["/opt/tlm/entry.sh"]
