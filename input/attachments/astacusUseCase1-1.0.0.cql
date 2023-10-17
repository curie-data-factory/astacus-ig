library astacusUseCase1 version '1.0.0'

using FHIR version '4.0.1'

include "FHIRHelpers" version '4.0.1' called FHIRHelpers

codesystem "SCT": 'http://snomed.info/sct'
codesystem "LNC": 'http://loinc.org'
codesystem "SpecimenType": 'http://terminology.hl7.org/CodeSystem/v2-0487'
codesystem "DCM": 'http://dicom.nema.org/resources/ontology/DCM'
codesystem "ImagingStudyStatus": 'http://hl7.org/fhir/imagingstudy-status'

valueset "Malignant neoplasm of breast": 'malignant-neoplasm-breast-vs'
valueset "Breast structure (body structure)": 'breast-structure-vs'

code "Biopsy code": '129314006' from SCT
code "TISS code": 'TISS' from SpecimenType
code "Primary malignant neoplasm of female left breast (disorder) code": '353431000119107' from SCT
    display 'Primary malignant neoplasm of female left breast (disorder)'
code "Blue shade eosin stain code": '1346008' from SCT
code "Slide Microscopy code": 'SM' from DCM
code "ImagingStudyStatusAvailable code": 'available' from ImagingStudyStatus
code "HER2 code": '18474-7' from LNC display 'HER2 antigène [Présence/Seuil] Tissu ; Qualitatif ; Coloration immune'
code "HER2+FISH code": '85318-4' from LNC display 'HER2:Présence/Seuil:Ponctuel:Tissu mammaire cancereux:Qualitatif:FISH'

context Unfiltered

define "Breast cancer":
  [Condition: "Malignant neoplasm of breast"]

//define "Breast cancer exists":
//  exists("Breast cancer")

//define "Breast cancer count":
//  Count("Breast cancer")

define "Imaging with biopsy with eosin stain":
  [ImagingStudy: modality = "Slide Microscopy code"] Img
    with "Biopsy with eosin stain" Sp
      such that Sp.id = getId(Last(Img.series.specimen.reference))
    where Img.status ~ "ImagingStudyStatusAvailable code".code

define "Biopsy with eosin stain":
  [Specimen: type = "TISS code"] Sp
    with [Substance: "Blue shade eosin stain code"] S
      such that S.id = getId(Last(Sp.processing.additive.reference))
    where Sp.collection.bodySite in "Breast structure (body structure)"

//define "Biopsy exists":
//  exists("Biopsy")

//define "Biopsy count":
//  Count("Biopsy")

define "TumorMarkerTest HER2":
 [Observation: "HER2 code"] Obs

define "TumorMarkerTest HER2+FISH":
 [Observation: "HER2+FISH code"] Obs

define "TumorMarkerTest HER2 union HER2+FISH":
   "TumorMarkerTest HER2"
   union "TumorMarkerTest HER2+FISH"

//define "Meets Inclusion Criteria":
//  "Breast cancer exists"
//  and "Biopsy exists"

define "Num patient":
  Count([Patient] P
    with "Breast cancer" BC
       such that getId(BC.subject.reference) = P.id
    with "Imaging with biopsy with eosin stain" B
       such that getId(B.subject.reference) = P.id
    with "TumorMarkerTest HER2 union HER2+FISH" Obs
        such that getId(Obs.subject.reference) = P.id)


/*Returns the tail of the given uri (i.e. everything after the last slash in the URI).*/
define function getId(uri String):
  Last(Split(uri, '/'))

/*Returns the Location resource specified by the given reference*/
define function getSubstance(reference Reference):
  singleton from (
    [Substance] S where S.id = getId(reference.reference)
  )