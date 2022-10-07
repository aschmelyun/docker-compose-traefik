FROM node:current-alpine

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

EXPOSE 8081

CMD ["npm", "run", "serve"]