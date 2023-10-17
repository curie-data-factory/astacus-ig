Profile: AstacusPatientGroup
Parent: Group
Id: astacus-patient-group
Title: "Astacus Patient Group Profile"
Description: "A group of patients included in the scope of Astacus, whose cancer-related resources conform to identified
profiles into this IG."
* ^extension[FMM].valueInteger = 1
* code = NCI#C19700  // Cancer Patient
* member.entity only Reference(AstacusCancerPatient)
* member.entity ^definition = "A cancer patient considered `in-scope` for Astacus."
