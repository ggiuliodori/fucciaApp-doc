FROM node:8.16.2

ADD . /app
WORKDIR /app

RUN npm install -g yarn \
    && yarn install \
    && yarn build 

EXPOSE 80

CMD ["yarn", "start-prod"]
