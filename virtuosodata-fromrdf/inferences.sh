#!/bin/bash

isql ops-virtuoso dba dba exec="trace_on('ddl_log', 'errors', 'dsn', 'sql_send', 'remote_transact', 'thread', 'cursor');"

## Datasets with a "insert_queries.sparql" file.

declare -a datasets=(
    "enzyme"
    "chembl"
    "bao"
    "go"
    "disgenet"
    "chebi"
)

## A function that given a file containing a SPARQL query uses Virtuoso's 'isql' command to execute
## the query in the file. For a SPARQL query to execute properly 

function run_insert_query() {
    local insert_query_file="$1"

    echo "execute SPARQL INSERT query in file: ${insert_query_file}"

    (echo "SPARQL"; cat "${insert_query_file}"; echo ";") | isql ops-virtuoso dba dba
}

for dataset in "${datasets[@]}"
do
    run_insert_query "/staging/${dataset}/data/insert_queries.sparql"
done


isql ops-virtuoso dba dba exec="rdf_loader_run();"
