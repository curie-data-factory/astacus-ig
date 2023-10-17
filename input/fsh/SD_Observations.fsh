Profile: AstacusLaboratoryResultObservationProfile
Parent: Observation
Id: astacus-observation-lab
Title: "Astacus Laboratory Result Observation Profile"
Description: "Astacus Laboratory Result Observation Profile is based upon the core FHIR Observation Resource, and, along with the Fr Core DiagnosticReport Profile for Laboratory Results Reporting. Laboratory results are grouped and summarized using the DiagnosticReport resource which reference Observation resources. Each Observation resource represents an individual laboratory test and result value, a “nested” panel (such as a microbial susceptibility panel) which references other observations, or rarely a laboratory test with component result values. The Fr Core Laboratory Result Observation Profile sets minimum expectations for the Observation resource resource to record, search, and fetch laboratory test results associated with a patient to promote interoperability and adoption through common implementation. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile. It provides the floor for standards development for specific uses cases."
* ^version = "0.0.1"
* ^experimental = true
* ^jurisdiction = urn:iso:std:iso:3166#FR "France"
* ^copyright = "Used by permission of HL7 International, all rights reserved Creative Commons License"
* status MS
* category MS
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains Laboratory 1..1 MS
* category[Laboratory] = ObsCat#laboratory
* code MS
* code from LOINCCodes (extensible)
* code ^short = "Laboratory Test Name"
* code ^definition = "The test that was performed.  A LOINC **SHALL** be used if the concept is present in LOINC."
* code ^comment = "The typical patterns for codes are:  1)  a LOINC code either as a translation from a \"local\" code or as a primary code, or 2)  a local code only if no suitable LOINC exists,  or 3)  both the local and the LOINC translation.   Systems SHALL be capable of sending the local code if one exists.  When using LOINC , Use either the SHORTNAME or LONG_COMMON_NAME field for the display."
* code ^alias[0] = "Test Name"
* code ^alias[+] = "Observation Identifier"
* code ^binding.description = "LOINC codes"
* subject 1.. MS
* subject only Reference(AstacusCancerPatient)
* subject ^definition = "Patient whose test result is recorded."
* effective[x] only dateTime or Period or Timing or instant
* effective[x] MS
* effective[x] ^definition = "For lab tests this is the specimen collection date.  For Ask at Order Entry Questions (AOE)'s this is the date the question was asked."
* value[x] only Quantity or CodeableConcept or string or boolean or integer or Range or Ratio or SampledData or time or dateTime or Period
* value[x] MS
* value[x] ^short = "Result Value"
* value[x] ^definition = "The Laboratory result value.  If a coded value,  the valueCodeableConcept.code **SHOULD** be selected from [SNOMED CT](http://hl7.org/fhir/ValueSet/uslab-obs-codedresults) if the concept exists. If a numeric value, valueQuantity.code **SHALL** be selected from [UCUM](http://unitsofmeasure.org).  A FHIR [UCUM Codes value set](http://hl7.org/fhir/STU3/valueset-ucum-units.html) that defines all UCUM codes is in the FHIR specification."
* dataAbsentReason MS

Profile: AstacusTumorMarkerTest
Parent:  AstacusLaboratoryResultObservationProfile
Id:      astacus-tumor-marker-test
Title:   "French Tumor Marker Test Profile"
Description: "The result of a tumor marker test. Tumor marker tests are generally used to guide cancer treatment decisions and monitor treatment, as well as to predict the chance of recovery and cancer recurrence."
* ^extension[FMM].valueInteger = 4
* subject 1..1
* value[x] 1..1
* code from TumorMarkerTestVS (extensible)
* effective[x] only dateTime or Period
* value[x] only Quantity or Ratio or string or CodeableConcept
// Already MS in FR Core Obs Lab: status, category, code, subject, effective[x], value[x], dataAbsentReason
* specimen only Reference(AstacusHumanSpecimen)
* specimen MS  // is not MS in FR Core 4.0.0 and 5.0.1
// RelatedCondition added 11/14/2022, see https://chat.fhir.org/#narrow/stream/229074-CodeX/topic/Reference.20between.20tumor.20characteristics.20and.20cancer.20diagnosis
* extension contains RelatedCondition named relatedCondition 0..* MS
* extension[relatedCondition] ^short = "Condition associated with this test."
* extension[relatedCondition] ^definition = "Associates the tumor marker test with a condition, if one exists. Condition can be given by a reference or a code. In the case of a screening test such as prostate-specific antigen (PSA), there may be no existing condition to reference."
