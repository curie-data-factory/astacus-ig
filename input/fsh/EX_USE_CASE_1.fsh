ValueSet: MalignantNeoplasmBreastVS
Id: malignant-neoplasm-breast-vs
Title: "Malignant Neoplasm Breast Value Set"
Description: "Value Set for Malignant Neoplasm Breast."
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* ^status = #active
* ^experimental = false
* ^date = "2023-02-16"
* ^publisher = "APHP"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://aphp.fr"
* ^jurisdiction = http://unstats.un.org/unsd/methods/m49/m49.htm#001
* ^immutable = false
* ^compose.inactive = false
* include codes from system SCT where concept is-a #254837009 "Malignant neoplasm of breast (disorder)"

ValueSet: BreastStructureVS
Id: breast-structure-vs
Title: "Breast structure (body structure)"
Description: "Value Set for Breast structure (body structure)."
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* ^status = #active
* ^experimental = false
* ^date = "2023-03-20"
* ^publisher = "APHP"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://aphp.fr"
* ^jurisdiction = http://unstats.un.org/unsd/methods/m49/m49.htm#001
* ^immutable = false
* ^compose.inactive = false
* include codes from system SCT where concept is-a #76752008 "Breast structure (body structure)"

Instance: astacus-1288992
InstanceOf: AstacusCancerPatient
Usage: #example
* extension[$FrCoreIdentityReliability].extension[identityStatus].valueCoding = $fr-v2-0445#VALI "Identité validée"
* extension[$FrCoreIdentityReliability].extension[validationDate].valueDate = "2023-02-16"
* extension[$FrCoreIdentityReliability].extension[validationMode].valueCoding = $fr-mode-validation-identite#CN "Carte nationale d'identité"
* identifier[0].use = #usual
* identifier[=].type = $v2-0203#PI "Patient internal identifier"
* identifier[=].system = "http://aphp.fr"
* identifier[=].value = "123456"
* active = true
* name[0].use = #official
* name[=].family = "Adams"
* name[=].given[0] = "Danielle"
* telecom.system = #email
* telecom.value = "danielle.adams@example.com"
* gender = #female
* birthDate = "1971-12-23"
* address[0].use = #home
* address[0].line = "1 Hill Ave"
* address[0].city = "Tulsa"
* address[0].state = "OK"
* address[0].postalCode = "74117"
* address[0].country = "USA"

Instance: astacus-179-malignant-neoplasm-breast
InstanceOf: AstacusPrimaryCancerCondition
Usage: #example
* extension[HistologyMorphologyBehavior].valueCodeableConcept.coding = SCT#413448000 "Adenocarcinoma, no subtype, intermediate grade (morphologic abnormality)"
* clinicalStatus = ClinStatus#active
* verificationStatus = VerStatus#confirmed
* code = SCT#353431000119107 "Primary malignant neoplasm of female left breast (disorder)"
* code.text = "Primary malignant neoplasm of female left breast (disorder)"
* subject = Reference(Patient/astacus-1288992)
* onsetDateTime = "2023-02-16"

Instance: astacus-197-biopsy
InstanceOf: AstacusHumanSpecimen
Usage: #example
* status = #available
* type = SPTY#TISS
* subject = Reference(Patient/astacus-1288992)
* collection.bodySite.coding = SCT#80248007 "Left breast structure (body structure)"
* processing.additive = Reference(Substance/astacus-180-stain)
* processing.timeDateTime = "2023-02-16"

Instance: astacus-180-stain
InstanceOf: Substance
Usage: #example
* status = #active
* code = SCT#1346008 "Blue shade eosin stain"
* code.text = "Blue shade eosin stain"

Instance: astacus-181-antigen-ihc
InstanceOf: AstacusTumorMarkerTest
Usage: #example
* status = #final
* code = LNC#18474-7 "HER2 Ag [Presence] in Tissue by Immune stain"
* code.text = "HER2 Ag [Presence] in Tissue by Immune stain"
* subject = Reference(Patient/astacus-1288992)
* effectiveDateTime = "2023-02-16"
* valueString = "2+"
* specimen = Reference(Specimen/astacus-197-biopsy)

Instance: astacus-182-antigen-fish
InstanceOf: AstacusTumorMarkerTest
Usage: #example
* status = #final
* code = LNC#85318-4 "ERBB2 gene duplication [Presence] in Breast cancer specimen by FISH"
* code.text = "ERBB2 gene duplication [Presence] in Breast cancer specimen by FISH"
* subject = Reference(Patient/astacus-1288992)
* effectiveDateTime = "2023-02-16"
* valueCodeableConcept = SCT#10828004 "Positive"
* valueCodeableConcept.text = "Positive"
* specimen = Reference(Specimen/astacus-197-biopsy)

Instance: astacus-182-imaging
InstanceOf: ImagingStudy
Usage: #example
* status = #available
* modality[+] = DCM#SM "Slide Microscopy"
* subject = Reference(Patient/astacus-1288992)
* reasonReference = Reference(Condition/astacus-179-malignant-neoplasm-breast)
* series.uid = "2.16.124.113543.6003.2588828330.45298.17418.2723805630"
* series.modality = DCM#SM "Slide Microscopy"
* series.endpoint = Reference(Endpoint/astacus-1-endpoint)
* series.specimen = Reference(Specimen/astacus-197-biopsy)

Instance: astacus-1-endpoint
InstanceOf: Endpoint
Usage: #example
* status = #active
* connectionType = EndpointConnType#dicom-wado-uri "DICOM WADO-URI"
* payloadType[+] = EndpointPLType#any "Any"
* address = "http://dicom.aphp.fr/slides"

Instance: astacus-1-procedure-biopsy
InstanceOf: AstacusProcedureProfile
Usage: #example
* status = #completed
* code.coding = http://snomed.info/sct#723990008 "Biopsy of breast using ultrasonographic guidance (procedure)"
* subject = Reference(Patient/astacus-1288992)
* performedDateTime = "2023-02-16"
* reasonReference = Reference(Condition/astacus-179-malignant-neoplasm-breast)
* bodySite.coding = http://snomed.info/sct#80248007 "Left breast structure (body structure)"