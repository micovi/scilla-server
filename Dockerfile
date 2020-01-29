FROM zilliqa/scilla:latest

EXPOSE 8080

# Install node.js
RUN curl -sL https://deb.nodesource.com/setup_10.x  | bash -
RUN apt-get -y install nodejs

COPY . /scilla-server

WORKDIR /scilla-server
RUN npm install
RUN npm run build

ENTRYPOINT NODE_ENV=production SCILLA_VERSION=0 npm run start