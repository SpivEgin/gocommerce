FROM quay.io/spivegin/golangdart2

RUN mkdir /opt/dep/ /opt/gocommerce /opt/src/src
ADD . /opt/src/src/github.com/netlify/gocommerce
ADD https://github.com/golang/dep/releases/download/v0.5.0/dep-linux-amd64 /opt/go/bin/dep
ADD build.sh /opt/src/
RUN cd /opt/src && chmod +x build.sh && ./build.sh
CMD ["gocommerce"]
EXPOSE 8080
