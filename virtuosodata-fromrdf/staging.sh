#!/bin/bash

# Exit on first error
set -e

function isql {
 /usr/local/bin/isql ops-virtuoso dba dba VERBOSE=OFF BANNER=OFF PROMPT=OFF ECHO=OFF BLOBS=ON ERRORS=stdout "$@"
}


# FIXME: Is this needed? It seems overly permissive..
  echo "Configuring SPARQL"
  isql 'exec=GRANT EXECUTE ON DB.DBA.SPARQL_INSERT_DICT_CONTENT TO "SPARQL";'
  isql 'exec=GRANT EXECUTE ON DB.DBA.L_O_LOOK TO "SPARQL";'
  isql 'exec=GRANT EXECUTE ON DB.DBA.SPARUL_RUN TO "SPARQL";'
  isql 'exec=GRANT EXECUTE ON DB.DBA.SPARQL_DELETE_DICT_CONTENT TO "SPARQL";'
  isql 'exec=GRANT EXECUTE ON DB.DBA.RDF_OBJ_ADD_KEYWORD_FOR_GRAPH TO "SPARQL";'

for o in /staging/staging*.sql ; do
  echo "Populating from $o"
  isql $o
done

