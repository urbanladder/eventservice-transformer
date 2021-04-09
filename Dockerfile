FROM 540798973460.dkr.ecr.us-east-1.amazonaws.com/nodebase_10.16:latest

RUN apk add --no-cache tini python make g++
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

# Create app directory
WORKDIR /home/node/app
USER node

ARG version
ENV transformer_build_version=$version
COPY package*.json ./
RUN npm install

USER root
COPY . .
RUN chown -R node:node . 

USER node
ENTRYPOINT ["/sbin/tini", "--"]
CMD [ "npm", "start" ]
