Invariant: fr-core-1
Description: "Datetime must be at least to day."
Severity: #error
Expression: "$this is DateTime implies $this.toString().length() >= 10"
XPath: "f:matches(effectiveDateTime,/\\d{4}-[01]\\d-[0-3]\\dT[0-2]\\d:[0-5]\\d([+-][0-2]\\d:[0-5]\\d|Z)/)"

Invariant: fr-core-2
Description: "If there is no component or hasMember element then either a value[x] or a data absent reason must be present"
Severity: #error
Expression: "(component.empty() and hasMember.empty()) implies (dataAbsentReason.exists() or value.exists())"
XPath: "exists(f:component) or exists(f:hasMember) or exists(f:*[starts-with(local-name(.), 'value')]) or exists(f:dataAbsentReason)"

Invariant: fr-core-3
Description: "SHALL use UCUM for coded quantity units."
Severity: #error
Expression: "valueQuantity.system.empty() or valueQuantity.system = 'http://unitsofmeasure.org'"
XPath: "not(exists(f:valueQuantity/f:system) ) or f:valueQuantity/f:system[@value='http://unitsofmeasure.org']"

Invariant: fr-core-4
Description: "SHOULD use Snomed CT for coded Results"
Severity: #warning
Expression: "valueCodeableConcept.coding.system.empty() or valueCodeableConcept.coding.system = 'http://snomed.info/sct'"
XPath: "not(exists(f:valueCodeableConcept/f:coding/f:system) ) or f:valueCodeableConcept/f:coding/f:system[@value='http://snomed.info/sct']"

Invariant: fr-core-7
Description: "Performed SHALL be present if the status is 'completed' or 'in-progress'"
Severity: #error
Expression: "(status='completed' or status='in-progress') implies performed.exists()"
