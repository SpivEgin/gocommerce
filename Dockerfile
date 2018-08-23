FROM quay.io/spivegin/golangbase

RUN mkdir /opt/dep/ /opt/gocommerce /opt/src/src
ADD . /opt/src/src/github.com/netlify/gocommerce
ADD build.sh /opt/src/
RUN cd /opt/src && chmod +x build.sh
CMD ["gocommerce"]
EXPOSE 8080
