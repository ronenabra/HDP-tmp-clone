# ILHDP Encounter Supplemental
Supplemental encounter profile used to capture additional encounter context in HDP flows.

## Canonical
[http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-encounter-supplemental](http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-encounter-supplemental)

## See also
- [ILHDP Encounter IG](./ILHDP-Encounter-IG.md), especially section 5 on optional rich encounter hierarchy.

## Guidance
- Add `meta.security[HDP]` with `system` [http://fhir.health.gov.il/cs/il-hdp-information-buckets](http://fhir.health.gov.il/cs/il-hdp-information-buckets).
- `type[supplemental-encounter]` is required with code `il-core-encounter-type#supplemental-encounter-hdp`.
- `type[hospitalization]`, `type[inpatient-care-segment]`, and `type[community-hmo-ambulatory]` are disallowed.
- Supplemental encounters are optional for both data sources and data consumers. Consumers may ignore them without losing the mandatory clinical picture represented by the regular HDP encounter model.

## Related examples
- [Supplemental admission example](./Encounter-hdp-supplemental-admission-ward-a.doc.md)
- [Admission BP observation example](./Observation-hdp-bp-admission-ward-a.doc.md)
