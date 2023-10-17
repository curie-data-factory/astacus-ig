This section outlines requirements and recommendations for Astacus participants. The conformance verbs - SHALL or MUST, SHOULD, and MAY - are defined in [FHIR Conformance Rules](http://hl7.org/fhir/R4/conformance-rules.html).

### Astacus Participant Roles

Two roles for **Astacus Participants** are defined:

* **Astacus Data Sender** - a participant in exchange of Astacus data who provides Astacus data in response to a data query or autonomously pushes Astacus data to an Astacus receiver. The Data Sender does not have to be the originator of the data it possesses. The Data Sender role is similar to a [US Core Responder](https://www.hl7.org/fhir/us/core/#us-core-actors), except the data sent is not assumed to be a response to a query.
* **Astacus Data Receiver** - a participant in exchange of Astacus data who accepts Astacus data from an Astacus Data Sender. The Data Receiver may receive data as part of a predetermined workflow, or initiate the exchange via a query or on a regular basis via subscription. The Receiver role is similar to a [US Core Requestor](https://www.hl7.org/fhir/us/core/#us-core-actors), except the data does not have to be explicitly requested.

This IG currently only provides CapabilityStatements and documentation for "pull" (query-response) architectures, however, regardless how exchanges occur, all participants MUST follow the conformance requirements in this IG, **except** those specifically identified as applying only to pull architectures.

### "MUST" Requirements for Conformance

Astacus participants MUST meet the following requirements for conformance:

1. [Identify in-scope patients](#identify-in-scope-patients)
2. [Follow conformance requirements for supported profiles](#follow-conformance-requirements-for-supported-profiles)
3. [Populate and meaningfully process Astacus resources](#populate-and-meaningfully-process-astacus-resources)
4. [Support querying Astacus-conforming resources](#support-querying-astacus-conforming-resources)
5. [Publish a CapabilityStatement identifying supported profiles and operations](#publish-a-capabilitystatement-identifying-supported-profiles-and-operations)
6. [Support Fr Core conformance requirements](#support-fr-core-conformance-requirements)

#### Identify In-Scope Patients

To facilitate conformance testing, testing software must be able to determine which patients are "in-scope" (meaning cancer patients whose data is presented or exchanged with the intention of conforming to Astacus). In general, all patients with confirmed cancer diagnoses SHOULD be covered by Astacus, but Astacus provides several ways to identify this group of in-scope patients. See the [Identifying In-Scope Patients](conformance-patients.html) page for details.

#### Follow Conformance Requirements for Supported Profiles

The information produced and consumed by Astacus participants is defined by a set of profiles. Both Senders and Receivers must conform to the expectations set by these profiles. See the [Profile Conformance](conformance-profiles.html) page for details.

#### Populate and Meaningfully Process Astacus Resources

Astacus Senders MUST be able to populate data elements Must-Support (MS) obligations, for all profiles they support (as declared in their CapabilityStatement). Receivers MUST be able to meaningfully process elements with MS obligations for each profile they support (as declared in their CapabilityStatement). "Able to Populate" and "Meaningfully Process" have particular meanings, as discussed on the [Profile Conformance](conformance-profiles.html) page.

#### Support Querying Astacus-Conforming Resources

Astacus defines operations that Senders and Receivers use to exchange Astacus information. In a "pull" (query-response) architecture, Senders MUST support the requests below for retrieving all resources conforming to a given Astacus Profile, UNLESS they do not support the profile at all (see ["Support All Astacus Profiles"](#support-all-astacus-profiles) below). For more details on the conformance requirements for Senders and Receivers, see [Profile Conformance](conformance-profiles.html).

Note that the requests below may return resources associated with patients who are not [in-scope patients]. These resources MAY not conform to Astacus profiles.

* Patient
  * [AstacusCancerPatient]\: see [Identifying In-Scope Patients](conformance-patients.html) for the options to retrieve all conforming resources
  * [AstacusHumanSpecimen]\: Depends on type, for example: `GET [base]/Specimen?type=http://terminology.hl7.org/CodeSystem/v2-0487|TUMOR` (note that `TUMOR` MUST be capitalized)
  * [AstacusPatientBundle]\: see [Support the Astacus Bundle](#support-the-astacus-patient-bundle)
  * [AstacusPatientGroup]\: n/a

* Disease
  * Diagnosis
    * [AstacusPrimaryCancerCondition]\: `GET [base]/Condition?category=http://snomed.info/sct|372087000` (preferred form)
    * [AstacusPrimaryCancerCondition]\: `GET [base]/Condition?code:in=http://hl7.org/fhir/us/mcode/ValueSet/mcode-primary-or-uncertain-behavior-cancer-disorder-vs` (alternate form)
    * [AstacusSecondaryCancerCondition]\: `GET [base]/Condition?category=http://snomed.info/sct|128462008` (preferred form)
    * [AstacusSecondaryCancerCondition]\: `GET [base]/Condition?code:in=http://hl7.org/fhir/us/mcode/ValueSet/CancerStagingTypeVS` (alternate form)
  * Staging
  * Characterization
    * [AstacusTumorMarkerTest]\: `GET [base]/Observation?category=http://snomed.info/sct|250724005` (preferred form)
    * [AstacusTumorMarkerTest]\: `GET [base]/Observation?code:in=http://hl7.org/fhir/us/mcode/ValueSet/mcode-tumor-marker-test-vs` (alternate form)

* Assessment
  * [FHIR Vital Signs](https://www.hl7.org/fhir/observation-vitalsigns.html) and [US Core Vital Signs](https://hl7.org/fhir/us/core/3.2.0/StructureDefinition-us-core-vital-signs.html): `GET [base]/Observation?category=vital-signs`
  * [US Core DiagnosticReport Profile for Laboratory Results Reporting](http://hl7.org/fhir/us/core/StructureDefinition-us-core-diagnosticreport-lab.html): `GET [base]/DiagnosticReport?category=LAB` (note that `LAB` MUST be capitalized)
  * [US Core Laboratory Result Profile](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab.html): `GET [base]/Observation?category=laboratory`

* Genomics

* Treatment
  * Medication
  * Surgery
  * Radiotherapy

* Outcome

#### Publish a CapabilityStatement Identifying Supported Profiles and Operations

Each Astacus participant MUST publish a FHIR CapabilityStatement listing their supported profiles, by declaring the profile in `CapabilityStatement.rest.resource.supportedProfile`. The CapabilityStatement SHALL be returned in response to a `GET [base]/metadata` request.

ALL Astacus participants MUST at minimum support the [AstacusCancerPatient] and [AstacusPrimaryCancerCondition] profiles.

#### Support FR Core Conformance Requirements

Additional [conformance requirements from FR Core](https://hl7.org/fhir/us/core/general-requirements.html) apply to RESTful interactions, searches, and resource formats in Astacus. Astacus "inherits" all FR Core conformance requirements. FR Core provides base profiles for many (but not all) Astacus profiles, outlines expectations for handling of missing or unknown data elements, and outlines how to associate provenance information associated with collection, transfer, and updating of clinical information.

### "SHOULD" Recommendations for Conformance

Astacus participants SHOULD meet the following requirements for conformance:

1. [Support all Astacus Profiles](#support-all-astacus-profiles)
2. [Support the Astacus Patient Bundle](#support-the-astacus-patient-bundle)

#### Support All Astacus Profiles

In addition to supporting the core profiles as described above, Astacus participants SHOULD support all profiles defined in Astacus UNLESS the participant does not anticipate supplying or consuming a certain type of data, usually by virtue of playing a limited or specialized role in clinical or information workflows. For example, a genomics laboratory may support [GenomicsReport], but not vital signs or staging.

Participants SHOULD also support the non-Astacus-specific profiles that are considered part of an [Astacus Patient Bundle][AstacusPatientBundle], such as [blood pressure](http://hl7.org/fhir/StructureDefinition/bp).

#### Support the Astacus Patient Bundle

The [Astacus Patient Bundle][AstacusPatientBundle] provides a mechanism to retrieve cancer-related resources for an in-scope Patient. Participants SHOULD support this CapabilityStatement ([sender][astacus-sender-patient-bundle]/[receiver][astacus-receiver-patient-bundle]) for the [astacus-patient-everything] operation, which retrieves an Astacus Patient Bundle for a given Patient ID.

    GET [base]/Patient/[id]/$astacus-everything

This endpoint SHALL support `start` and `end` parameters and MAY support the `_since`, `_type`, and `_count` parameters, which operate the same as in the [`Patient/[id]/$everything` operation](https://www.hl7.org/fhir/operation-patient-everything.html). The _since parameter is provided to support periodic queries to get additional information that has changed about the patient since the last query.

For some types of resources, such as vital signs, a large number of resources may exist. Senders may use their discretion to select the resources that are most relevant, e.g., a subset of the vital signs that were recorded. Alternatively, servers may refuse to serve the request and indicate that the client asked for too much data (see [OperationOutcome](https://www.hl7.org/fhir/operationoutcome.html)). To limit the number of included resources, callers MAY specify a `_count` parameter that pages through the results.

<!-- If the image below is not wrapped in a div tag, the publisher tries to wrap text around the image, which is not desired. -->
<div style="text-align: center;">{%include astacus-patient-bundle-pull.svg%}</div>

Astacus Patient Bundles SHALL be identified by an `id` value that matches the `id` in the contained CancerPatient-conforming resource.

#### Use `meta.profile` to Signal Conformance

Participants SHOULD populate `meta.profile` elements for all resources to indicate which profiles the resources claim to conform to. Servers SHOULD also implement [profile search](https://www.hl7.org/fhir/search.html#profile), which allows participants to query using the `_profile` parameter to return resources conforming to the profiles declared in `meta.profile`.

Profile search and population of `meta.profile` originate as "SHALL" requirements in the base FHIR specification; they are not an additional requirements imposed by mCODE. However, in practice, few implementations have followed these requirements. Refer to the [FHIR Documentation on supported profiles](https://www.hl7.org/fhir/profiling.html#CapabilityStatement.rest.resource.supportedProfile) for details.

### Capability Statements

* **Receiver**
    * [astacus-receiver-patient-bundle]
* **Sender**
    * [astacus-sender-patient-bundle]

### Operations

* [astacus-cql]
* [astacus-aggregator-cql]
* [astacus-patient-everything]

{% include markdown-link-references.md %}