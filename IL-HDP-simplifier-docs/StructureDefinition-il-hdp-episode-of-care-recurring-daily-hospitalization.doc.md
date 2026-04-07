# ILHDP EpisodeOfCare Recurring Daily Hospitalization
HDP profile for recurring day-hospitalization programs, represented as one EpisodeOfCare with repeated daily treatment encounters.

## Canonical
[http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-episode-of-care-recurring-daily-hospitalization](http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-episode-of-care-recurring-daily-hospitalization)

## See also
- [ILHDP Encounter IG](./ILHDP-Encounter-IG.md), especially section 3 on recurring daily hospitalization.

## Guidance
- Parent profile: `ILHDPEpisodeOfCare`.
- `type` is required and `type[recurring-daily-hospitalization]` is mandatory (`1..1`).
- `type[serviceType]` is mandatory (`1..1`) to carry service/specialty context (equivalent concept to `Encounter.serviceType`).
- `period` and `managingOrganization` are required.
- `diagnosis` is required and includes role-based slices:
  - `diagnosis[admission]` uses `diagnosis-role#AD`
  - `diagnosis[comorbidity]` uses `diagnosis-role#CM`
  - `diagnosis[discharge]` uses `diagnosis-role#DD`
- `diagnosis.role` is bound to [IL Core Diagnosis Role](http://fhir.health.gov.il/ValueSet/il-core-diagnosis-role) (extensible).
- Keep one EpisodeOfCare for the whole recurring program; individual treatment sessions are represented as encounters linked by `Encounter.episodeOfCare`.

## Related example
- [Recurring daily hospitalization program example](./EpisodeOfCare-hdp-recurring-daily-hospitalization-program1.doc.md)
