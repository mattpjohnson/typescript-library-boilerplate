FROM node

WORKDIR /home/node/app

EXPOSE 3000

COPY package.json .
COPY yarn.lock .

RUN yarn

COPY . .

RUN yarn run build

CMD [ "node", "dist/index.js" ]

