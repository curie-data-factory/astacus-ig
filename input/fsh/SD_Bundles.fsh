Profile: AstacusPatientBundle
Parent: Bundle
Id: astacus-patient-bundle
Title: "Astacus Patient Bundle Profile"
Description: "A collection of data for an Astacus patient."
* ^extension[FMM].valueInteger = 1
* type = #collection
* entry 1..* MS
* entry.resource 1..1 MS // each entry must have a resource
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.description = "Slicing based on the profile"
* insert BundleSlice(cancerPatient, 1, 1, Cancer Patient, The Cancer Patient whose data is included in the bundle., AstacusCancerPatient)

Profile: AstacusAggregatorBundle
Parent: Bundle
Id: astacus-aggregator-bundle
Title: "Astacus Aggregator Bundle Profile"
Description: "A collection of data for an Astacus patient."
* ^extension[FMM].valueInteger = 1
* type = #collection
* entry 1..* MS
* entry.fullUrl 1..1 MS
* entry.resource 1..1 MS // each entry must have a resource
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.description = "Slicing based on the profile"
* insert BundleSlice(parameters, 1, 1, Parameters, The Parameters., AstacusAggregatorParameters)

Profile: AstacusAggregatorParameters
Parent: Parameters
Id: astacus-aggregator-parameters
Title: "Astacus Aggregator Parameters Profile"
Description: "A parameters."
* ^extension[FMM].valueInteger = 1
* parameter 1..1
* parameter.name = "total" (exactly)
* parameter.value[x] only unsignedInt
* parameter.value[x] 1..1
* parameter.resource 0..0
* parameter.part 0..0
* parameter and parameter.name and parameter.value[x] MS
