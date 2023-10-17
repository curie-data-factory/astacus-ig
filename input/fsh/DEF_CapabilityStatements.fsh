Instance: astacus-sender-cql-patient-bundle
InstanceOf: CapabilityStatement
Usage: #definition
* description = "Retrieves a Bundle of references to Patient resources that conform to Astacus."
* name = "CapabilityStatementCQLPatientBundle"
* title = "Astacus Data Sender: Get Bundle for Patients"
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h2 id=\"title\">Astacus Data Sender: Get Bundle for Patients</h2><ul><li><b>Official URL:</b><code>https://aphp.fr/fhir/fr/astacus/CapabilityStatement/astacus-sender-cql-patient-bundle</code></li><li><b>Implementation Guide Version:</b> None</li><li><b>FHIR Version:</b> 4.0.1</li><li><b>Intended Use:</b> Requirements</li><li><b>Supported Formats:</b>\n\t\t\t\t\n                    XML, JSON\n\t\t\t\t\n\t\t\t\t</li><li><b>Published:</b> 2023-04-10 10:52:00.000000+02:00</li><li><b>Published by:</b> None</li><li><b>Status:</b> Draft (experimental)</li></ul><p>Retrieves a Bundle of references to Patient resources that conform to Astacus.</p><!-- No support expectation extension --><h3 class=\"no_toc\" id=\"igs\">Support the Following Implementation Guides:</h3><ul><li><a href=\"./index.html\">Implementation Guide for Astacus project</a></li></ul><!-- REST Behavior --><h3 id=\"behavior\">FHIR Server RESTful Capabilities</h3><p>An Astacus Server <strong>SHALL</strong>:</p><ol><li>Support all profiles defined in this Implementation Guide.</li><li>Implement the RESTful behavior according to the FHIR specification.</li><li>Return the following response classes:\n<ul><li>(Status 400): invalid parameter</li><li>(Status 401/4xx): unauthorized request</li><li>(Status 403): insufficient scope</li><li>(Status 404): unknown resource</li><li>(Status 410): deleted resource.</li></ul>\n</li><li>Support json source formats for all Astacus interactions.</li><li>Identify the Astacus profiles supported as part of the FHIR <code>meta.profile</code> attribute for each instance.</li><li>Support the searchParameters on each profile individually and in combination.</li></ol><p>The Astacus Server <strong>SHOULD</strong>:</p><ol><li>Support xml source formats for all Astacus interactions.</li></ol><p id=\"security\"><strong>Security:</strong></p><ol><li>See the <a href=\"https://www.hl7.org/fhir/security.html#general\">General Security Considerations</a> section for requirements and recommendations.</li><li>A server <strong>SHALL</strong> reject any unauthorized requests by returning an <code>HTTP 401</code> unauthorized response code.</li></ol><p><strong>Summary of Server Wide Operations</strong></p><ul><li><strong>SHALL</strong> support the <a href=\"OperationDefinition-astacus-cql.html\"><code>$astacus-cql</code></a> operation.</li></ul></div>"
* text.status = #generated
* insert astacus_CapabilityStatement_Server_Common
* rest
  // GET [base]/$astacus-cql
  * operation[0]
    * name = "astacus-cql"
    * definition = "https://aphp.fr/fhir/fr/astacus/OperationDefinition/astacus-cql"
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL

Instance: astacus-sender-aggregator-cql-bundle
InstanceOf: CapabilityStatement
Usage: #definition
* description = "Retrieves a Bundle of references to length of Patient that conform to Astacus."
* name = "CapabilityStatementAggregatorCQLBundle"
* title = "Astacus Data Sender: Get Bundle for aggregator"
* insert astacus_CapabilityStatement_Server_Common
// GET [base]/$agg-cql
* rest
  * operation[0]
    * name = "agg-cql"
    * definition = "https://aphp.fr/fhir/fr/astacus/OperationDefinition/astacus-aggregator-cql"
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
