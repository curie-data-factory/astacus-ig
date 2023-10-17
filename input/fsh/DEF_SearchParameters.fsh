Instance: Patient-id
InstanceOf: SearchParameter
Usage: #definition
Title: "Search by _id in Patients with multipleOr"
* name = "PatientIdSearchParameter"
* status = #draft
* experimental = true
* description = "This SearchParameter enables query of patients by `_id` with `mutlipleOr` enabled."
* code = #_id
* base[0] = #Patient
* type = #token
* multipleOr = true
* expression = "Patient.id"
* xpath = "f:Patient/f:id"
* xpathUsage = #normal

Instance: Condition-code
InstanceOf: SearchParameter
Usage: #definition
Title: "Search by code:in in Conditions"
* name = "ConditionCodeSearchParameter"
* status = #draft
* experimental = true
* description = "This SearchParameter enables query of conditions by code with the `in` modifier."
* code = #code
* base[0] = #Condition
* type = #uri
* expression = "Condition.code"
* xpath = "f:Condition/f:code"
* xpathUsage = #normal
* modifier = #in