#!/bin/bash

cd "$GITHUB_WORKSPACE" || exit 1

export GITHUB_TOKEN="${INPUT_GITHUB_TOKEN}"

echo "MYSQL_HOST: ${INPUT_MYSQL_HOST}"
echo "MYSQL_PORT: ${INPUT_MYSQL_PORT}"
echo "MYSQL_USER: ${INPUT_MYSQL_USER}"
echo "MYSQL_PASSWORD: ${INPUT_MYSQL_PASSWORD}"
echo "MYSQL_DATABASE: ${INPUT_MYSQL_DATABASE}"
echo "SQLBOILER_OUTPUT: ${INPUT_SQLBOILER_OUTPUT}"

sed -i -e "/dbname:/s/dbname: .*$/dbname:  ${INPUT_MYSQL_DATABASE}/" ${INPUT_SQLBOILER_PATH}
sed -i -e "/host:/s/host: .*$/host:  ${INPUT_MYSQL_HOST}/" ${INPUT_SQLBOILER_PATH}
sed -i -e "/user:/s/user: .*$/user:  ${INPUT_MYSQL_USER}/" ${INPUT_SQLBOILER_PATH}
sed -i -e "/pass:/s/pass: .*$/pass:  ${INPUT_MYSQL_PASSWORD}/" ${INPUT_SQLBOILER_PATH}
sed -i -e "/port:/s/port: .*$/port:  ${INPUT_MYSQL_PORT}/" ${INPUT_SQLBOILER_PATH}

# ex) sqlboiler mysql --no-tests --no-hooks --wipe -c sqlboiler.yml -o models
sqlboiler mysql --no-tests --no-hooks --wipe -c ${INPUT_SQLBOILER_PATH} -o ${INPUT_SQLBOILER_OUTPUT}
