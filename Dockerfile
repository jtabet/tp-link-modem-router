# syntax=docker/dockerfile:1
FROM node:lts-alpine
WORKDIR /home/node
COPY src /home/node/tp-link-modem-router
WORKDIR /home/node/tp-link-modem-router
RUN yarn

FROM node:lts-alpine
WORKDIR /home/node/tp-link-modem-router
COPY --from=0 /home/node/tp-link-modem-router .
CMD ["node", "./api-bridge.js"]