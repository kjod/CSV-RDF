## Creating RDF File
Commands to use once virtual graph has been created:

```
./stardog-admin virtual options Test2 > test2.properties 
./stardog-admin virtual mappings --format r2rml Test2 > test2.ttl
./stardog-admin db create -n RDFTest2 test2.ttl
./stardog-admin virtual import RDFTest2 test.properties test.ttl --format r2rml
./stardog data export --format NTRIPLES RDFTest2 RDFTestTriple.rdf
```
