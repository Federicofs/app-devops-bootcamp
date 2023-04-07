FROM node:14-alpine AS base
WORKDIR /app


FROM base AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build

FROM base AS production
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY ./package.json ./package.json
COPY ./package-lock.json ./package-lock.json
EXPOSE 3000
CMD ["npm","run","start:prod"]