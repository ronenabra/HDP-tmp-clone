# HDP Vital Signs - Admission Blood Pressure (Example)
This example captures an admission blood pressure observation recorded during the Ward A inpatient segment.

## See also
- [Ext: Resource Role Context](./StructureDefinition-ext-resource-role-context.doc.md)
- [ILHDP Encounter Supplemental](./StructureDefinition-il-hdp-encounter-supplemental.doc.md)
- [ILHDP Encounter IG](./ILHDP-Encounter-IG.md), especially sections 6 and 9.

## Key points
- **Profile**: `ILCoreBP`.
- **Category and code**: Vital signs category with LOINC `85354-9`.
- **Encounter context**: Linked to the Ward A segment via `encounter`.
- **Workflow context**: Uses `ext-resource-role-context` with role `AD` and a supplemental encounter reference to capture internal workflow staging.
- **Performer**: Recorded by a nurse.
- **Components**: Includes systolic and diastolic values in mmHg.

## References in this example
- **Patient**: `Patient/il-hdp-patient`
- **Encounter**: `Encounter/hdp-segment-ward-a`
- **Supplemental encounter**: `Encounter/hdp-supplemental-admission-ward-a`
- **Practitioner**: `Practitioner/practitioner-nurse`
