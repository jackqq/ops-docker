-- Uniprot
ld_dir('/staging/uniprot/data', '*.rdf.xml.gz', 'http://purl.uniprot.org');
ld_dir('/staging/uniprot/data', '*.ttl.gz', 'http://purl.uniprot.org');


rdf_loader_run();
