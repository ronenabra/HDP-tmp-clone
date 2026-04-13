# HDP Patient Reported Chief Complaint - GP Visit (Example)
This example captures the patient-reported chief complaint for a community/HMO GP visit.

## See also
- [ILHDP Patient Reported Chief Complaint](./StructureDefinition-il-hdp-patient-reported-chief-complaint.doc.md)
- [ILHDP Encounter Community/HMO Ambulatory](./StructureDefinition-il-hdp-encounter-community-hmo-ambulatory.doc.md)
- [ILHDP Encounter IG](./ILHDP-Encounter-IG.md), especially sections 1, 7.2, and 9.

## Key points
- **Profile**: `ILHDPPatientReportedChiefComplaint`.
- **Code**: LOINC `8661-1` (Chief complaint - Reported).
- **Encounter context**: Linked to the community/HMO ambulatory encounter.
- **Value**: `valueString` captures the reported symptoms and concerns.
- **Performer**: Recorded by the GP.

## References in this example
- **Patient**: `Patient/il-hdp-patient`
- **Encounter**: `Encounter/hdp-community-hmo-ambulatory-gp-visit`
- **Practitioner**: `Practitioner/practitioner-md`
