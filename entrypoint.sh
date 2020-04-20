#!/bin/bash

cd "$GITHUB_WORKSPACE" || exit 1

export GITHUB_TOKEN="${INPUT_GITHUB_TOKEN}"

echo "MYSQL_HOST: ${MYSQL_HOST}"
echo "MYSQL_PORT: ${MYSQL_PORT}"
echo "MYSQL_USER: ${MYSQL_USER}"
echo "MYSQL_PASSWORD: ${MYSQL_PASSWORD}"
echo "MYSQL_DATABASE: ${MYSQL_DATABASE}"
echo "SCHEMA_PATH: ${SCHEMA_PATH}"
echo "SQLBOILER_OUTPUT: ${SQLBOILER_OUTPUT}"

sed -i -e "/dbname:/s/dbname: .*$/dbname:  ${MYSQL_DATABASE}/" ${SQLBOILER_PATH}
sed -i -e "/user:/s/user: .*$/user:  ${MYSQL_USER}/" ${SQLBOILER_PATH}
sed -i -e "/pass:/s/pass: .*$/pass:  ${MYSQL_PASSWORD}/" ${SQLBOILER_PATH}
sed -i -e "/port:/s/port: .*$/port:  ${MYSQL_PORT}/" ${SQLBOILER_PATH}

# ex) sqlboiler mysql --no-tests --no-hooks --wipe -c sqlboiler.yml -o models
sqlboiler mysql --no-tests --no-hooks --wipe -c ${SQLBOILER_PATH} -o ${SQLBOILER_OUTPUT}
