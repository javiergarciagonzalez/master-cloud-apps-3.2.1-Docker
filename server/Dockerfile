FROM node:14-alpine3.13

ENV NODE_ENV production

WORKDIR /usr/server

COPY server/package.json /usr/server
COPY server/package-lock.json /usr/server

RUN npm install --only=production

RUN curl -LJO https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh \
&& chmod +x /usr/server/wait-for-it.sh

COPY server/src /usr/server/src
COPY server/public /usr/server/public
COPY server/config /usr/server/config

EXPOSE 3000

CMD ["node", "src/server.js"]