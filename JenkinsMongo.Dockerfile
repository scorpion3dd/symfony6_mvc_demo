# This file is part of the Universal Docker stand for web development project.
#
# This project is no longer maintained.
# The project is written as Universal Docker stand Release.
#
# @link https://github.com/scorpion3dd
# @author Denis Puzik <scorpion3dd@gmail.com>
# @copyright Copyright (c) 2022-2023 scorpion3dd

FROM mongo

COPY jenkins.mongod.conf.orig  /etc/mongod.conf.orig

ARG MONGO_CONNECT_USER
ARG MONGO_CONNECT_PASSWORD
ARG MONGO_CONNECT_ROLE
ARG MONGO_CONNECT_DB
ARG MONGO_CONNECT_DB_INTEGRATION
ARG MONGO_CONNECT_COLLECTION

RUN printf 'db.createUser({\n \
               user: "%s",\n \
               pwd: "%s",\n \
               roles: [\n \
                   {\n \
                       role: "%s",\n \
                       db: "%s" \
                   }\n \
               ]\n \
           });\n \
       db.createCollection("%s");\n' \
       ${MONGO_CONNECT_USER} \
       ${MONGO_CONNECT_PASSWORD} \
       ${MONGO_CONNECT_ROLE} \
       ${MONGO_CONNECT_DB} \
       ${MONGO_CONNECT_COLLECTION} \
       > /docker-entrypoint-initdb.d/mongo-init.js

EXPOSE 27017
