# ILHDP Location Nursing Unit
HDP wrapper for nursing unit locations with security labeling.

## Canonical
[http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-location-nursing-unit](http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-location-nursing-unit)

## See also
- [ILHDP Encounter IG](./ILHDP-Encounter-IG.md), especially sections 2.3 and 8.3.
- [ILCore Location Nursing Unit](./StructureDefinition-il-core-location-nursing-unit.doc.md)

## Guidance
- Add `meta.security[HDP]` with `system` [http://fhir.health.gov.il/cs/il-hdp-information-buckets](http://fhir.health.gov.il/cs/il-hdp-information-buckets).
- Use this profile for nursing-unit locations referenced by inpatient care segments.
- `managingOrganization` and `partOf` accept ILCore and ILHDP references.
- Inherits the ILCore `Location.type` slices and required codings:
  - `type[nursing-unit] = il-core-location-physical-type#hospital-nursing-unit`
  - `type[hospital-unit] = v3-RoleCode#HU`
- This classifies the Location resource itself. The Encounter-level nursing-unit slice is identified separately by `Encounter.location.physicalType`.

## Related profiles and examples
- [ILHDP Encounter Inpatient Care Segment](./StructureDefinition-il-hdp-encounter-inpatient-care-segment.doc.md)
- [ER segment example](./Encounter-hdp-segment-er.doc.md)
- [Ward A segment example](./Encounter-hdp-segment-ward-a.doc.md)
