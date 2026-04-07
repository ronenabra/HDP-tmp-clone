# ILHDP Patient Reported Chief Complaint
HDP wrapper for the patient-reported chief complaint observation.

## Canonical
[http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-patient-reported-chief-complaint](http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-patient-reported-chief-complaint)

## See also
- [ILHDP Encounter IG](./ILHDP-Encounter-IG.md), especially section 7.2 on reason modeling and section 9 on examples.

## Guidance
- Adds required HDP security labeling.
- Inherits the fixed LOINC code `8661-1` from the ILCore profile.
- Use for `Encounter.reasonReference[patient-reported-chief-complaint]`.
- `subject` references only the HDP Patient profile; other references allow ILCore + HDP targets where available.

## Related examples
- [Chief complaint in hospitalization context](./Observation-hdp-chief-complaint-hospitalization.doc.md)
- [Chief complaint in community/HMO context](./Observation-hdp-chief-complaint-gp-visit.doc.md)
