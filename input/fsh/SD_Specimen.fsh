Profile: AstacusHumanSpecimen
Parent: Specimen
Id: astacus-human-specimen
Title:  "Astacus Human Specimen Profile"
Description:  "A specimen taken from a Patient. The profile includes extensions to specify a more precise body site and an identifier of source body structure at that site (for example, a tumor identifier)."
* ^extension[FMM].valueInteger = 1
* type from HumanSpecimenTypeVS (extensible)
* subject only Reference(AstacusCancerPatient)
* subject ^definition = "The patient associated with this specimen."
* insert BodySiteQualifierAndLaterality(collection.bodySite)
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slicing by identifier.type"
* identifier contains bodyStructureIdentifier 0..*
* identifier[bodyStructureIdentifier] only BodyStructureIdentifier
* identifier[bodyStructureIdentifier] ^short = "An identifier associating the specimen with a identified body structure, such as a tumor with a tumor identifier."
// FHIR-32352
// * identifier[bodyStructureIdentifier] ^definition = "To associate this with a specific BodyStructure conforming to the Tumor profile, add an identifier with a value that matches a persistent identifier from `BodyStructure.identifier.value` that is unique in the context of the Patient."
* subject and status and type and collection and collection.bodySite and collection.bodySite.extension and collection.bodySite.extension[locationQualifier] and collection.bodySite.extension[lateralityQualifier] MS
* identifier and identifier[bodyStructureIdentifier] and identifier[bodyStructureIdentifier].type and identifier[bodyStructureIdentifier].value MS