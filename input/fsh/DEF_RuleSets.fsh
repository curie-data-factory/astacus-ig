RuleSet: ObservationComponentSlicingRules
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "Slice based on the component.code pattern"

RuleSet: CategorySlicingRules
* category 1.. MS
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category ^slicing.description = "Slicing requires the given value but allows additional categories"
* category contains requiredCategory 1..1

RuleSet: SliceReferenceOnProfile(path)
* {path} ^slicing.discriminator.type = #profile
* {path} ^slicing.discriminator.path = "$this.resolve()"
* {path} ^slicing.rules = #open
* {path} ^slicing.description = "Slicing based on profile conformance of the referenced resource."

RuleSet: BundleSlice(name, min, max, short, definition, class)
* entry contains {name} {min}..{max} MS
* entry[{name}] ^short = "{short}"
* entry[{name}] ^definition = "{definition}"
* entry[{name}].resource only {class}

/* MustSupportOnReference applies an MS flag to a selected reference. For example in Reference(Patient or Practitioner), an MS can be put on Practitioner without a MS on Patient. In some cases, this might better than using an "only" rule
For example, given that Practitioner is element [1] in the element "recorder":
* insert MustSupportOnReference(recorder, 1)
*/
RuleSet: MustSupportOnReference(path, refIndex)
* {path} ^type[0].targetProfile[{refIndex}].extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* {path} ^type[0].targetProfile[{refIndex}].extension[0].valueBoolean = true

RuleSet: NotUsed(path)
* {path} ^short = "Not used in this profile"
* {path} ^definition = "Not used in this profile"

RuleSet: CreateComponent(sliceName, min, max)
* component contains {sliceName} {min}..{max} MS
* component[{sliceName}].code MS
* component[{sliceName}].value[x] MS
//* component[{sliceName}].dataAbsentReason MS

RuleSet: SNOMEDCopyrightForVS
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* ^experimental = false

RuleSet: LOINCCopyrightForVS
* ^copyright = "This material contains content from LOINC (http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc"
* ^experimental = false

RuleSet: ExtensionContext(path)
* ^context[+].type = #element
* ^context[=].expression = "{path}"

RuleSet: CancerConditionCommonRules
* ^extension[FMM].valueInteger = 4
* category = CondCat#problem-list-item
* subject only Reference(AstacusCancerPatient)
* extension contains
    HistologyMorphologyBehavior named histologyMorphologyBehavior 0..1 MS
* insert BodySiteQualifierAndLaterality(bodySite)
* bodySite from CancerBodyLocationVS (extensible)

RuleSet: BodySiteQualifierAndLaterality(path)
// path is the bodySite element that gets the qualifier and laterality extension
// may just be bodySite for elements at the top level
* {path}.extension contains
     BodyLocationQualifier named locationQualifier 0..*   and
     LateralityQualifier named lateralityQualifier 0..1
* {path}.extension[locationQualifier] ^short = "General location qualifier (excluding laterality) for this bodySite"
* {path}.extension[locationQualifier] ^definition = "General location qualifier (excluding laterality) for this bodySite"
* {path}.extension[lateralityQualifier] ^short = "Laterality qualifier for this bodySite"
* {path}.extension[lateralityQualifier] ^definition = "Laterality qualifier for this bodySite"

// Defines common operations for the server role
RuleSet: astacus_CapabilityStatement_Server_Common
* status = #draft
* experimental = true
* date = "2023-04-11T14:00:00.000000+02:00"
* kind = #requirements
* format[0] = #xml
* format[+] = #json
* fhirVersion = #4.0.1
* implementationGuide = "https://aphp.fr/fhir/fr/astacus/ImplementationGuide/aphp.fhir.fr.astacus"
* rest.mode = #server
* rest.documentation =  "An Astacus Server **SHALL**:\n\n1. Support all profiles defined in this Implementation Guide..\n1.  Implement the RESTful behavior according to the FHIR specification.\n1. Return the following response classes:\n   - (Status 400): invalid parameter\n   - (Status 401/4xx): unauthorized request\n   - (Status 403): insufficient scope\n   - (Status 404): unknown resource\n   - (Status 410): deleted resource.\n1. Support json source formats for all Astacus interactions.\n1. Identify the Astacus profiles supported as part of the FHIR `meta.profile` attribute for each instance.\n1. Support the searchParameters on each profile individually and in combination.\n\nThe Astacus Server **SHOULD**:\n\n1. Support xml source formats for all Astacus interactions.\n"
* rest.security.description = "1. See the [General Security Considerations](https://www.hl7.org/fhir/security.html#general) section for requirements and recommendations.\n1. A server **SHALL** reject any unauthorized requests by returning an `HTTP 401` unauthorized response code."
/*
* imports = "http://hl7.org/fhir/us/core/CapabilityStatement/us-core-server"   // Import the US Core Server Capability Statement
*/

/////////////////////////////////////////////////////////////////////////////////////
RuleSet: astacus_CapabilityStatement_Patient_Server_Common_Rules
* rest.resource[0].type = #Patient
* rest.resource[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension.valueCode = #SHALL
* rest.resource[=].supportedProfile[0] = "https://aphp.fr/fhir/fr/astacus/StructureDefinition/astatus-cancer-patient"
* rest.resource[=].supportedProfile[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension.valueCode = #SHALL
// GET [base]/Patient/[id]
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #SHALL


/////////////////////////////////////////////////////////////////////////////////////

// Common rules used by `patients-and-cancer-conditions` and `cancer-conditions-then-patients`
RuleSet: astacus_CapabilityStatement_Condition_Server_Common_Rules
* rest.resource[+].type = #Condition
* rest.resource[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension.valueCode = #SHALL
* rest.resource[=].supportedProfile[0] = "https://aphp.fr/fhir/fr/astacus/StructureDefinition/astatus-cancer-patient"
* rest.resource[=].supportedProfile[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension.valueCode = #SHALL
* rest.resource[=].interaction[0].code = #search-type
* rest.resource[=].interaction[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #SHALL
* rest.resource[=].interaction[=].documentation = "Identify Patient resources conforming to Astacus's CancerPatient profile via searching for conditions in a specific ValueSet."
* rest.resource[=].searchParam[0].name = "code:in"
* rest.resource[=].searchParam[=].type = #uri
* rest.resource[=].searchParam[=].definition = "https://aphp.fr/fhir/fr/astacus/SearchParameter/Condition-code"
* rest.resource[=].searchParam[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
// GET [base]/Group?code=astacus-cancer-patient
// This must be implemented regardless of the method for identifying in-scope patients
* rest.resource[+].type = #Group
* rest.resource[=].extension.valueCode = #SHALL
* rest.resource[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[0].code = #search-type
* rest.resource[=].interaction[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #SHALL
* rest.resource[=].interaction[=].documentation = "Retrieve Group of references to Patient resources conforming to Astacus."
* rest.resource[=].searchParam[0].name = "code"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Group-code"
* rest.resource[=].searchParam[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL

// Defines common operations for the client role
RuleSet: astacus_CapabilityStatement_Client_Common
* status = #draft
* experimental = true
* date = "2023-04-21T14:06:00.000000+02:00"
* kind = #requirements
* format[0] = #xml
* format[1] = #json
* fhirVersion = #4.0.1
* implementationGuide = "https://aphp.fr/fhir/fr/astacus/ImplementationGuide/aphp.fhir.fr.astacus"
* rest.mode = #client
* rest.documentation =  "An Astacus Client **SHALL**:\n\n1. Support all profiles defined in this Implementation Guide..\n1.  Implement the RESTful behavior according to the FHIR specification.\n1. Return the following response classes:\n   - (Status 400): invalid parameter\n   - (Status 401/4xx): unauthorized request\n   - (Status 403): insufficient scope\n   - (Status 404): unknown resource\n   - (Status 410): deleted resource.\n1. Support json source formats for all Astacus interactions.\n1. Identify the Astacus profiles supported as part of the FHIR `meta.profile` attribute for each instance.\n1. Support the searchParameters on each profile individually and in combination.\n\nThe Astacus Client **SHOULD**:\n\n1. Support xml source formats for all Astacus interactions.\n"
* rest.security.description = "1. See the [General Security Considerations](https://www.hl7.org/fhir/security.html#general) section for requirements and recommendations.\n1. A client **SHALL** reject any unauthorized requests by returning an `HTTP 401` unauthorized response code."

///////////////////////////////////////////////////////////////////////////////////////////////////
RuleSet: astacus_CapabilityStatement_Patient_Client_Common_Rules
* rest.resource[0].type = #Patient
* rest.resource[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension.valueCode = #SHALL
* rest.resource[=].supportedProfile[0] = "http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-cancer-patient"
* rest.resource[=].supportedProfile[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension.valueCode = #SHALL
// GET [base]/Patient/[id]
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #SHALL

///////////////////////////////////////////////////////////////////////////////////////////////////

// Common rules used by `patients-and-cancer-conditions` and `cancer-conditions-then-patients`
RuleSet: astacus_CapabilityStatement_Condition_Client_Common_Rules
* rest.resource[1].type = #Condition
* rest.resource[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension.valueCode = #SHALL
* rest.resource[=].supportedProfile[0] = "http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-cancer-patient"
* rest.resource[0].supportedProfile[0].extension.valueCode = #SHALL
* rest.resource[1].interaction[0].code = #search-type
* rest.resource[=].interaction[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #SHALL
* rest.resource[=].interaction[=].documentation = "Identify Patient resources conforming to mCODE's CancerPatient profile via searching for conditions in a specific ValueSet."

* rest.resource[=].searchParam[0].name = "code:in"
* rest.resource[=].searchParam[=].type = #uri
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/us/mcode/SearchParameter/Condition-code"
* rest.resource[=].searchParam[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL

// GET [base]/Group?code=mcode-cancer-patient
// This must be implemented regardless of the method for identifying in-scope patients
* rest.resource[2].type = #Group
* rest.resource[=].extension.valueCode = #SHALL
* rest.resource[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[0].code = #search-type
* rest.resource[=].interaction[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #SHALL
* rest.resource[=].interaction[=].documentation = "Retrieve Group of references to Patient resources conforming to mCODE."

* rest.resource[=].searchParam[0].name = "code"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Group-code"
* rest.resource[=].searchParam[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL