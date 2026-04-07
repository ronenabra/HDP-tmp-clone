# ILHDP EpisodeOfCare
HDP wrapper for EpisodeOfCare with required security labeling.

## Canonical
[http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-episode-of-care](http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-episode-of-care)

## See also
- [ILHDP Encounter IG](./ILHDP-Encounter-IG.md), especially sections 3 and 4.
- [ILHDP EpisodeOfCare Recurring Daily Hospitalization](./StructureDefinition-il-hdp-episode-of-care-recurring-daily-hospitalization.doc.md)

## Guidance
- Add `meta.security[HDP]` with `system` [http://fhir.health.gov.il/cs/il-hdp-information-buckets](http://fhir.health.gov.il/cs/il-hdp-information-buckets).
- Use `meta.security[HDP].code` for the appropriate information bucket.
- `identifier` is required (1..*).
- Inherits IL Core `type` model (including optional category and `type[serviceType]` usage on child profiles).
- References allow ILCore + HDP targets (organization, service request, care team).
- `patient` references only the HDP Patient profile.
- `diagnosis.condition` references ILCore/HDP Condition profiles.
- Specialized HDP EpisodeOfCare profiles can further tighten type/diagnosis rules for specific workflows (for example recurring daily hospitalization).

## Related profiles and examples
- [ILHDP EpisodeOfCare Recurring Daily Hospitalization](./StructureDefinition-il-hdp-episode-of-care-recurring-daily-hospitalization.doc.md)
- [Recurring daily hospitalization program example](./EpisodeOfCare-hdp-recurring-daily-hospitalization-program1.doc.md)
