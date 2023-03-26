FROM node:14-alpine AS build    
WORKDIR /app 
COPY dist ./

# stage 2: prod stage
FROM nginx:1.21-alpine AS production
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD [ "ngin","-g", "daemon off" ] 