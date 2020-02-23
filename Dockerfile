ARG IMAGE="node:lts-alpine3.9"
FROM $IMAGE

COPY ./package.json /app/package.json
COPY ./package-lock.json /app/package-lock.json
COPY ./public /app/public
COPY ./src /app/src
COPY server.js /app/server.js

WORKDIR /app

ARG BUILD_PRODUCTION="true"

# this is going to be baked into the production build; can still be overwritten when running dev
ARG API_URL="http://localhost:8000"
ENV REACT_APP_API_URL=${API_URL}

RUN npm i && rm -rf /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp
RUN if [ "${BUILD_PRODUCTION}" = "true" ]; then npm run build; fi

CMD ["node", "server.js"]
