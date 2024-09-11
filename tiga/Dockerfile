FROM mhart/alpine-node

# intall yarn,pm2
RUN mkdir -p /app/logs && npm install -g yarn && \
    yarn config set registry http://registry.npm.taobao.org/ && \
    npm install -g pm2

# env settings
ENV PATH /usr/bin/pm2:/usr/bin/pm2-docker:$PATH

#工作目录
WORKDIR /app

COPY ./package.json /app
RUN [ "yarn", "install"]

COPY . /app/

EXPOSE 1337

# logs dir
VOLUME /app/logs

CMD [ "pm2","start","/app/boot.json","--no-daemon"]

# Or run the following command
#CMD [ "pm2-docker","start","/app/boot.json"]
