#!/bin/sh

wait_for_postgres () {
  until pg_isready --host=$1 --user=postgres; do
    sleep 1s
  done
}

wait_for_postgres primary
wait_for_postgres replica

exec "$@"
