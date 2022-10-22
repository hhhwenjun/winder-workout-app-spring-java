FROM node:17 AS frontend-build

# install simple http server for serving static content
# RUN npm install -g http-server

# make the 'app' folder the current working directory
WORKDIR /app

COPY VUE/ ./
# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY --from=frontend-build /app/dist ./dist
COPY --from=frontend-build /app/node_modules ./node_modules
COPY --from=frontend-build /app/server.js /app/package*.json ./

EXPOSE 8080
# install project dependencies
RUN npm install && npm run build

## copy both 'package.json' and 'package-lock.json' (if available)
#FROM node:17 AS server-build
#
#WORKDIR /root/
## copy project files and folders to the current working directory (i.e. 'app' folder)
#COPY --from=frontend-build /app/dist ./dist
#COPY --from=frontend-build /app/node_modules ./node_modules
#COPY --from=frontend-build /app/server.js /app/package*.json ./
#
#EXPOSE 8080
#CMD [ "npm", "run", "serve" ]

FROM openjdk:8-jdk-alpine
MAINTAINER springboot.example.com
COPY target/springboot-0.0.1-SNAPSHOT.jar springboot-0.0.1-SNAPSHOT.jar.original
EXPOSE 9090
ENTRYPOINT ["java","-jar","/message-server-1.0.0.jar"]