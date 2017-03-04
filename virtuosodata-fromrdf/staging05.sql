-- Open PHACTS Chemical Registry

ld_dir('/staging/ocrs/data/CHEMBL', '*.ttl.gz', 'http://ops.rsc.org');
ld_dir('/staging/ocrs/data/CHEBI', '*.ttl.gz', 'http://ops.rsc.org');
ld_dir('/staging/ocrs/data/DRUGBANK', '*.ttl.gz', 'http://ops.rsc.org');
ld_dir('/staging/ocrs/data/PDB', '*.ttl.gz', 'http://ops.rsc.org');
ld_dir('/staging/ocrs/data/MESH', '*.ttl.gz', 'http://ops.rsc.org');
ld_dir('/staging/ocrs/data/HUMAN_METABOLOME_DATABASE', '*.ttl.gz', 'http://ops.rsc.org');


rdf_loader_run();
