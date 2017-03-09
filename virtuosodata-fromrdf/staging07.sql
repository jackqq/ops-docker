-- BAO
ld_dir('/staging/bao/data', '*.gz', 'http://www.bioassayontology.org');

-- NCATS
-- in Graph: <http://rdf.ncats.nih.gov/opddr>
ld_dir('/staging/ncats/data', 'npcpd2_assay.ttl.gz', 'http://rdf.ncats.nih.gov/opddr');
ld_dir('/staging/ncats/data', 'npcpd2_bao.ttl.gz', 'http://rdf.ncats.nih.gov/opddr');
ld_dir('/staging/ncats/data', 'npcpd2_substance.ttl.gz', 'http://rdf.ncats.nih.gov/opddr');
-- in Graph: <http://rdf.ncats.nih.gov/opddr/pubchem>
ld_dir('/staging/ncats/data', 'pubchem_*.ttl.gz', 'http://rdf.ncats.nih.gov/opddr/pubchem');

-- FDA Adverse Events
ld_dir('/staging/aers/data', '*.nt.gz', 'http://aers.data2semantics.org/');

-- Caloha
ld_dir('/staging/caloha/data', '*.ttl.gz', 'http://www.nextprot.org/caloha');

-- ChEBI
ld_dir('/staging/chebi/data', '*.owl.gz', 'http://www.ebi.ac.uk/chebi');

-- ConceptWiki
ld_dir('/staging/conceptwiki/data/', '*.ttl.gz', 'http://www.conceptwiki.org');

-- DisGeneT
ld_dir('/staging/disgenet/data', '*.ttl.gz', 'http://rdf.imim.es');

-- DrugBank v4.1
ld_dir('/staging/drugbank/data', '*.nt.gz', 'http://www.openphacts.org/bio2rdf/drugbank');

-- Enzyme
ld_dir('/staging/enzyme/data', '*.rdf.gz', 'http://purl.uniprot.org/enzyme');

-- Gene Ontology
ld_dir('/staging/go/data', '*.owl.gz', 'http://www.geneontology.org');


-- doid
ld_dir('/staging/doid/data', '*.owl.gz', 'http://www.openphacts.org/api/datasetDescriptors');


-- VoID Dataset Descriptors
ld_dir('/staging/void/data', '*.ttl.gz', 'http://www.openphacts.org/api/datasetDescriptors');
