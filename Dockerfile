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
RUN mkdir /opt/gocommerce/ /opt/tlmcommerce
WORKDIR /opt/tlmcommerce
COPY --from=build-env /opt/gocommerce/gocommerce /opt/gocommerce/gocommerce
RUN chmod +x /opt/gocommerce/gocommerce && ln -s /opt/gocommerce/gocommerce /bin/gocommerce
CMD ["gocommerce"]
EXPOSE 8080
