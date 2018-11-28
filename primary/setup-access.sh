#!/usr/bin/env bash

echo "host replication postgres 0.0.0.0/0 trust" >> "$PGDATA/pg_hba.conf"
