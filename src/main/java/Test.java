/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package jena.examples.rdf;

import org.apache.jena.lang.csv.CSV2RDF;
import org.apache.jena.rdf.model.*;
import org.apache.jena.vocabulary.VCARD;

import java.io.*;

/**
 * Tutorial 1 creating a simple model
 */

public class Test extends Object {
    // some definitions
    static String personURI = "http://somewhere/JohnSmith";
    static String fullName = "John Smith";
    static String given = "John";
    static String family = "Smith";
    static String csvFile = "src/main/java/WB_test.csv";
    static String outFile = "src/main/java/WB_test.rdf";

    public static void main(String args[]) {
        Test test = new Test();
        //test.tutorial1();
        test.CSVtoRDFTest();
    }

    private void tutorial1() {
        // create an empty model
        Model model = ModelFactory.createDefaultModel();

        // create the resource
        Resource johnSmith = model.createResource(personURI);

        // add the property
        johnSmith
                .addProperty(VCARD.FN, fullName)
                .addProperty(VCARD.N, model.createResource()
                        .addProperty(VCARD.Given, given)
                        .addProperty(VCARD.Family, family)
                );

        // list the statements in the Model
        StmtIterator iter = model.listStatements();

        // print out the predicate, subject and object of each statement
        while (iter.hasNext()) {
            Statement stmt = iter.nextStatement();  // get next statement
            Resource subject = stmt.getSubject();     // get the subject
            Property predicate = stmt.getPredicate();   // get the predicate
            RDFNode object = stmt.getObject();      // get the object

            System.out.print(subject.toString());
            System.out.print(" " + predicate.toString() + " ");
            if (object instanceof Resource) {
                System.out.print(object.toString());
            } else {
                // object is a literal
                System.out.print(" \"" + object.toString() + "\"");
            }
            System.out.println(" .");
        }

        model.write(System.out);
        System.out.print("");
        model.write(System.out, "RDF/XML-ABBREV");
        System.out.print("");
        model.write(System.out, "N-TRIPLES");
        System.out.print("Check Jena complied");
    }

    private void CSVtoRDFTest() {

        BufferedReader br = null;
        FileOutputStream fop = null;
        try {
            System.out.print(System.getProperty("user.dir"));
            br = new BufferedReader(new FileReader(csvFile));
            fop = new FileOutputStream(outFile);
            CSV2RDF.init();
            //load through manager:
            //Model m = RDFDataMgr.loadModel("test.csv") ;
            //classic way to load:
            Model m = ModelFactory.createDefaultModel();
            m.read(br, "http://example.com", "csv");
            m.setNsPrefix("test", "http://example.com#");
            m.write(fop, "RDF/XML"); //RDF/XML", "RDF/XML-ABBREV", "N-TRIPLE" and "N3
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}