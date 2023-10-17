ValueSet: AstacusProcedureCodes
Id: astacus-procedure-code
Title: "Astacus Procedure Codes"
Description: "Concepts from CPT, SNOMED CT, HCPCS Level II Alphanumeric Codes, ICD-10-PCS,CDT and LOINC code systems that can be used to indicate the type of procedure performed."
* ^version = "0.0.1"
* ^experimental = false
* ^status = #active
* ^date = "2019-05-21"
* ^jurisdiction = urn:iso:std:iso:3166#FR "France"
* ^copyright = "1. Current Procedural Terminology (CPT) is copyright 2020 American Medical Association. All rights reserved\n2. This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology  Standards Development Organisation (IHTSDO), and distributed by agreement  between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this  agreement.\n3. HCPCS Level II Alphanumeric Codes codes are maintained by the US Center  for Medicare and Medicaid Services (CMS) available for public use.\n4. The International Classification of Diseases, Tenth Revision, Procedure  Coding System (ICD-10-PCS) was developed for the Centers for Medicare and  Medicaid Services (CMS) available for public use.  CMS is the U.S.  governmental agency responsible for overseeing all changes and modifications  to the ICD-10-PCS.\n5. The ADA is the exclusive copyright owner of CDT, the Code on Dental  Procedures and Nomenclature (the Code), and the ADA Dental Claim Form. Except  as permitted by law, all use, copying or distribution of CDT, or any portion  thereof (including the Code on Dental Procedures and Nomenclature) in any  product or services (including works prepared for clients by consultants and  other professionals), whether in printed, electronic or other format, requires  a valid commercial user license from the ADA. CDT ® is a registered trademark  of the American Dental Association. All Rights Reserved.\n6. This material contains content from LOINC (http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC ® is a registered United States trademark of Regenstrief Institute, Inc"
* include codes from system CPT
* include codes from system SCT where concept is-a #71388002
* include codes from system HCPCSReleaseCodeSets
* include codes from system ICD10PCS
* include codes from system CDT
* include codes from system LNC