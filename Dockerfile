FROM 540798973460.dkr.ecr.us-east-1.amazonaws.com/nodebase_10.16_backend:latest

ENV LC_ALL=C

ARG deploy_env=staging

ENV APP_ENV=staging
ENV appName=eventservice-transformer
ENV DEPLOY_ENV=staging
ENV etcdHost=stg-docker-secrets.urbanladder.com 
ENV JOB_NAME=pm2
ENV robotsurl=
# Create app directory
WORKDIR /app

# Create required directories for nginx and beaver
RUN mkdir -p shared/pids public/system shared/sockets nginx/cache nginx/logs beaver
RUN touch /etc/logrotate.d/app beaver/beaver.conf

RUN mkdir -p /app/node_modules
ARG version
ENV transformer_build_version=$version
COPY package*.json ./

# Install dependencies and create a build
RUN apk --no-cache update && \
    apk --no-cache add tini python make g++ git make curl jq && \
    rm -rf /var/cache/apk/* && \
    echo "DEPLOY_ENV=${deploy_env}" > /app/.env && \
    npm install && \
    apk del  --purge git g++ make

COPY . ./

ENV NODE_ENV=production
RUN chmod ug+x /app/startup.sh && chown root:root /app/startup.sh

ENTRYPOINT ["/sbin/tini", "--", "/app/startup.sh"]
