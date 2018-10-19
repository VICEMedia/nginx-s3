FROM nginx:1.15

RUN apt-get -y update && \
    apt-get -y install python-dev && \
    apt-get -y install curl && \
    curl https://bootstrap.pypa.io/get-pip.py | python && \
    pip install awscli

COPY ./nginx-entrypoint /usr/local/sbin/nginx-entrypoint

EXPOSE 80
EXPOSE 443

ENTRYPOINT [ "/usr/local/sbin/nginx-entrypoint" ]
CMD ["nginx", "-g", "daemon off;"]
