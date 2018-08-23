FROM quay.io/spivegin/golangbase AS build-env

RUN mkdir /opt/dep/ /opt/gocommerce /opt/src/src
ADD . /opt/src/src/github.com/netlify/gocommerce
ADD build.sh /opt/src/
RUN cd /opt/src && chmod +x build.sh



FROM quay.io/spivegin/tlmbasedebian
RUN mkdir /opt/gocommerce/ /opt/tlmcommerce
COPY --from=build-env /opt/gocommerce/gocommerce /opt/gocommerce/gocommerce
RUN chmod +x /opt/gocommerce/gocommerce && ln -s /opt/gocommerce/gocommerce /bin/gocommerce
CMD ["gocommerce"]
EXPOSE 8080
