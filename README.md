# GitHub Action: Run sqlboiler

This action runs [sqlboiler](https://github.com/volatiletech/sqlboiler) on pull requests to improve code review experience.

<!-- [![sample annotation](https://user-images.githubusercontent.com/3797062/64926127-b8b0bc00-d834-11e9-97d5-5b6aa06dc573.png)](https://github.com/reviewdog/action-misspell/pull/1/files) -->

## Inputs

### `github_token`

Required. `${{ github.token }}` is used by default.

### `github_repository`

Required. `${{ github.repository }}` is used by default.

### `mysql_host`

Optional. --host flag of mysqldef. (default: 127.0.0.1)

### `mysql_port`

Optional. --port flag of mysqldef. (default: 3306)

### `mysql_user`

Required. --user flag of mysqldef.

### `mysql_password`

Required. --password flag of mysqldef.

### `mysql_database`

Required. database name of mysqldef.

### `sqlboiler_path`

Required. sqlboiler path of mysqldef. (default: sqlboiler.yml)

### `sqlboiler_output`

Required. The name of the folder to output to (default "models")

## Example usage

```yml
name: sqlboiler
on: [pull_request]
jobs:
  sqlboiler:
    name: sqlboiler
    runs-on: ubuntu-latest
    services:
      mysql:
        image: mysql:5.7
        env:
          MYSQL_DATABASE: githubaction
          MYSQL_USER: githubaction
          MYSQL_PASSWORD: githubaction
    steps:
    - uses: actions/checkout@v2
    - name: Run Sqlboiler
      uses: locona/action-sqlboiler@master
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        github_repository: ${{ github.repository }}
        mysql_user: circleci
        mysql_password: circleci
        mysql_database: circleci
        sqlboiler_path: sqlboiler/sqlboiler.yaml
        sqlboiler_output: server/models
```
