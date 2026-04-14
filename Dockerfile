FROM node:20-bullseye

WORKDIR /app

RUN corepack enable && corepack prepare yarn@1.22.22 --activate

COPY . .

RUN yarn install

ENV CI=true

CMD ["yarn", "build"]
