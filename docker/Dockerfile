FROM node:9.4.0
COPY bashrc /root/.bashrc
RUN mkdir -p /opt/node_npm_data && cd /opt/node_npm_data/
RUN npm install -g truffle ganache-cli
ADD package.json /opt/node_npm_data/package.json
RUN cd /opt/node_npm_data/ && npm install
