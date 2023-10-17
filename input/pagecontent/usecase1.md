### Patient Description

| **Donnée/cas**                | **valeur pour tri** | **donnée souhaitée en sortie** | **commentaire**                                                                                                                                                                                                                                                                                           |
|-------------------------------|---------------------|--------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| organe                        | sein                |                                |                                                                                                                                                                                                                                                                                                           |
| cancer                        | oui                 |                                |                                                                                                                                                                                                                                                                                                           |
| sous type de cancer           | cancer invasif      |                                | il faut cancer invasif seulement                                                                                                                                                                                                                                                                          |
| prélèvement                   | biopsie             |                                |                                                                                                                                                                                                                                                                                                           |
| lame HE                       | oui                 | x                              | Hématoxyline & Eosine (coloration standard en pathologie aidant à distinguer le noyau et le cytoplasme)                                                                                                                                                                                                   |
| lame IHC-HER2                 | oui                 | x                              | IHC est l’acronyme de Immuno-Histo-Chimie, c’est une technique de « coloration » par marqueurs (des anticorps qui se fixent sur des antigènes) et qui permet de caractériser la présence de certaines protéines. Ici, c’est la protéine HER2 qui est visée (responsable de la prolifération des cellules) |
| score biomarqueur HER2 - IHC  | 0/1+/2+/3+          | x                              | Répartition équitable entre les 4 valeurs                                                                                                                                                                                                                                                                 |
| score biomarqueur HER2 - FISH | 1+/2+               | x                              | optionnel, si FISH disponible                                                                                                                                                                                                                                                                             |

### FHIR instances

| **Instance Description**                                                       | **Profile**                     |
|--------------------------------------------------------------------------------|---------------------------------|
| [`Cancer Diagnosis`](Condition-astacus-179-malignant-neoplasm-breast.html)     | [AstacusPrimaryCancerCondition] |
| [`Cancer Patient`](Patient-astacus-1288992.html)                               | [AstacusCancerPatient]          |
| [`Human Specimen: Left Breast`](Specimen-astacus-197-biopsy.html)              | [AstacusHumanSpecimen]          |
| [`Tumor Marker Her2 Positive`](Observation-astacus-181-antigen-ihc.html)       | [AstacusTumorMarkerTest]        |
| [`Tumor Marker Her2+Fish Positive`](Observation-astacus-182-antigen-fish.html) | [AstacusTumorMarkerTest]        |
| [`Breast Biopsy Procedure`](Procedure-astacus-1-procedure-biopsy.html)         | [AstacusProcedure]              |
| [`Blue shade eosin stain`](Substance-astacus-180-stain.html)                   | [R4Substance]                   |
| [`Slide Microscopy`](ImagingStudy-astacus-182-imaging.html)                    | [R4ImagingStudy]                |
| [`DICOM WADO-URI`](Endpoint-astacus-1-endpoint.html)                           | [R4Endpoint]                    |

* [MalignantNeoplasmBreastVS]

{% include markdown-link-references.md %}