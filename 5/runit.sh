#!/bin/bash

cat input.txt | sed 's/ \-> /,/' > input.processed.csv
docker run -i --rm -v "$PWD":/usr/myapp -w /usr/myapp nouchka/sqlite3 < commands.sql

