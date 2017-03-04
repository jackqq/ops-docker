-- ChEMBL v20
ld_dir('/staging/chembl/data', '*.ttl.gz', 'http://www.ebi.ac.uk/chembl');


rdf_loader_run();
