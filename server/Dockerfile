FROM node:lts

ENV NODE_ENV production

WORKDIR /usr/server

COPY package.json /usr/server
COPY package-lock.json /usr/server

RUN npm install --only=production

RUN curl -LJO https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh \
&& chmod +x ./wait-for-it.sh

COPY src /usr/server/src
COPY public /usr/server/public
COPY config /usr/server/config

EXPOSE 3000

CMD ["node", "src/server.js"]