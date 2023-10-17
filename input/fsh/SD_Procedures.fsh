Profile: AstacusProcedureProfile
Parent: Procedure
Id: astacus-procedure
Title: "Astacus Procedure Profile"
Description: "Astacus Procedure Profile is based upon the core FHIR Procedure Resource. This profile sets minimum expectations for the Procedure resource to record, search, and fetch procedures associated with a patient to promote interoperability and adoption through common implementation. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile. It provides the floor for standards development for specific uses cases."
* subject 1.. MS
* subject only Reference(AstacusCancerPatient)
* subject ^definition = "Patient whose test result is recorded."
* code from AstacusProcedureCodes (extensible)