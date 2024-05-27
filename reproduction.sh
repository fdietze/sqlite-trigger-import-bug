#!/usr/bin/env bash
# https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail
set -Eeuo pipefail
# cd to script location
cd "$(dirname "${BASH_SOURCE[0]}")"

sqlite3 -init /dev/null --version

DB=test.db
rm -f $DB
sqlite3 -init /dev/null $DB < schema.sql
sqlite3 -init /dev/null $DB "insert into myview (id) values (10)"; # works
sqlite3 -init /dev/null $DB -csv -header  ".import data.csv myview"; # fails on 3.45.2
echo success
