Instance: astacus-cql
InstanceOf: OperationDefinition
Usage: #definition
* version = "0.0.1"
* name = "AstacusCQL"
* title = "Astacus CQL"
* status = #draft
* kind = #operation
* experimental = false
* date = "2023-04-07T09:25:00+02:00"
* description = "Evaluates a CQL expression and returns the results as a Parameters resource."
* jurisdiction = urn:iso:std:iso:3166#FR "France"
* purpose = "This operation is defined to support evaluating CQL expressions directly via an operation"
* affectsState = false
* code = #astacus-cql
* system = true
* type = false
* instance = false
* parameter[0].name = #expression
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Expression to be evaluated. Note that this is an expression of CQL, not the text of a library with definition statements."
* parameter[=].type = #string

* parameter[+].name = #parameters
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Any input parameters for the expression. Parameters defined in this input will be made available by name to the CQL expression. Parameter types are mapped to CQL as specified in the Using CQL section of this implementation guide. If a parameter appears more than once in the input Parameters resource, it is represented with a List in the input CQL. If a parameter has parts, it is represented as a Tuple in the input CQL."
* parameter[=].type = #Parameters

* parameter[+].name = #library
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "*"
* parameter[=].documentation = "A library to be included. The library is resolved by url and made available by name within the expression to be evaluated."
* parameter[=].part[0].name = #url
* parameter[=].part[=].use = #in
* parameter[=].part[=].min = 1
* parameter[=].part[=].max = "1"
* parameter[=].part[=].documentation = "The canonical url (with optional version) of the library to be included"
* parameter[=].part[=].type = #canonical
* parameter[=].part[+].name = #name
* parameter[=].part[=].use = #in
* parameter[=].part[=].min = 0
* parameter[=].part[=].max = "1"
* parameter[=].part[=].documentation = "The name of the library to be used to reference the library within the CQL expression. If no name is provided, the name of the library will be used"
* parameter[=].part[=].type = #string

* parameter[+].name = #dataEndpoint
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "An endpoint to use to access data referenced by retrieve operations in the library. If provided, this endpoint is used after the data or prefetchData bundles, and the server, if the useServerData parameter is true."
* parameter[=].type = #Endpoint

* parameter[+].name = #contentEndpoint
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "An endpoint to use to access content (i.e. libraries) referenced by the library. If no content endpoint is supplied, the evaluation will attempt to retrieve content from the server on which the operation is being performed."
* parameter[=].type = #Endpoint

* parameter[+].name = #terminologyEndpoint
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "An endpoint to use to access terminology (i.e. valuesets, codesystems, and membership testing) referenced by the library. If no terminology endpoint is supplied, the evaluation will attempt to use the server on which the operation is being performed as the terminology server."
* parameter[=].type = #Endpoint

* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "A Bundle conforming to [`AstacusPatientBundle`](StructureDefinition-astacus-patient-bundle.html)."
* parameter[=].type = #Resource

* parameter[+].name = #issues
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "A list of hints and warnings about problems encountered while extracting the resource(s).
If there was nothing to extract, a 'success' OperationOutcome is returned with a warning and/or information messages. In
situations where the input is invalid or the operation otherwise fails to complete successfully, a normal 'erroneous'
OperationOutcome would be returned (as happens with all operations) indicating what the issue was."
* parameter[=].type = #OperationOutcome

Instance: astacus-aggregator-cql
InstanceOf: OperationDefinition
Usage: #definition
* version = "0.0.1"
* name = "AstacusAggregatorCQL"
* title = "Astacus Aggregator CQL"
* status = #draft
* kind = #operation
* experimental = false
* date = "2023-04-07T09:25:00+02:00"
* description = "Evaluates a CQL expression and returns the results as a Parameters resource."
* jurisdiction = urn:iso:std:iso:3166#FR "France"
* purpose = "This operation is defined to support evaluating CQL expressions directly via an operation"
* affectsState = false
* code = #agg-cql
* system = true
* type = false
* instance = false
* parameter[0].name = #expression
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Expression to be evaluated. Note that this is an expression of CQL, not the text of a library with definition statements."
* parameter[=].type = #string

* parameter[+].name = #parameters
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Any input parameters for the expression. Parameters defined in this input will be made available by name to the CQL expression. Parameter types are mapped to CQL as specified in the Using CQL section of this implementation guide. If a parameter appears more than once in the input Parameters resource, it is represented with a List in the input CQL. If a parameter has parts, it is represented as a Tuple in the input CQL."
* parameter[=].type = #Parameters

* parameter[+].name = #library
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "*"
* parameter[=].documentation = "A library to be included. The library is resolved by url and made available by name within the expression to be evaluated."
* parameter[=].part[0].name = #url
* parameter[=].part[=].use = #in
* parameter[=].part[=].min = 1
* parameter[=].part[=].max = "1"
* parameter[=].part[=].documentation = "The canonical url (with optional version) of the library to be included"
* parameter[=].part[=].type = #canonical
* parameter[=].part[+].name = #name
* parameter[=].part[=].use = #in
* parameter[=].part[=].min = 0
* parameter[=].part[=].max = "1"
* parameter[=].part[=].documentation = "The name of the library to be used to reference the library within the CQL expression. If no name is provided, the name of the library will be used"
* parameter[=].part[=].type = #string

* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "A Bundle conforming to [`AstacusAggregatorBundle`](StructureDefinition-astacus-aggregator-bundle.html)."
* parameter[=].type = #Resource

* parameter[+].name = #issues
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "A list of hints and warnings about problems encountered while extracting the resource(s).
If there was nothing to extract, a 'success' OperationOutcome is returned with a warning and/or information messages. In
situations where the input is invalid or the operation otherwise fails to complete successfully, a normal 'erroneous'
OperationOutcome would be returned (as happens with all operations) indicating what the issue was."
* parameter[=].type = #OperationOutcome