FROM node:lts-alpine3.9

COPY ./package.json /app/package.json
COPY ./package-lock.json /app/package-lock.json
COPY ./public /app/public
COPY ./src /app/src
COPY server.js /app/server.js

WORKDIR /app

ARG API_URL
ENV REACT_APP_API_URL=${API_URL}

RUN npm i && rm -rf /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp && npm run build

CMD ["node", "server.js"]
