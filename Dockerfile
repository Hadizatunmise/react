FROM node:20-bullseye

WORKDIR /app

# Use Yarn Classic for this repo
RUN corepack enable && corepack prepare yarn@1.22.22 --activate

# Copy dependency manifests first for better layer caching
COPY package.json ./
COPY yarn.lock ./
COPY packages ./packages

# Install all workspace dependencies
RUN yarn install --frozen-lockfile

# Copy the rest of the repository
COPY . .

ENV CI=true

# Default command builds the repo
CMD ["yarn", "build"]
