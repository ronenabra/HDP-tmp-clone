# HDP EpisodeOfCare - Recurring Daily Hospitalization Program (Example)
Example episode representing a day-hospitalization program that spans multiple treatment days.

## See also
- [ILHDP EpisodeOfCare Recurring Daily Hospitalization](./StructureDefinition-il-hdp-episode-of-care-recurring-daily-hospitalization.doc.md)
- [ILHDP Encounter IG](./ILHDP-Encounter-IG.md), especially section 3.

## Key points
- **Profile**: `ILHDPEpisodeOfCareRecurringDailyHospitalization`.
- **Security**: `meta.security[HDP]` uses information bucket `encounterInformation`.
- **Type**: Uses required `type[recurring-daily-hospitalization]`.
- **Service context**: Uses `type[serviceType]` with SNOMED CT `310129007` (Rehabilitation service).
- **Period and organization**: Program period and managing organization are populated.
- **Diagnosis roles**: Includes admission, comorbidity, and discharge diagnosis slices.
- **Operational use**: Daily treatment encounters should reference this episode via `Encounter.episodeOfCare`.

## References in this example
- **Patient**: `Patient/il-hdp-patient`
- **Managing organization**: `Organization/hospital1-ward-a`
- **Care manager**: `Practitioner/practitioner-md-ward-a`
- **Diagnoses**: `Condition/hdp-pneumonia`, `Condition/hdp-type-2-diabetes`
