Profile: ILHDPRelatedPerson
Parent: ILCoreRelatedPerson
Id: il-hdp-related-person
Title: "ILHDP RelatedPerson Profile"
Description: "RelatedPerson profile for HDP"
* insert ConformanceMetadata
* . obeys one-strong-identifier
* meta only ILHDPMeta
* meta 1..1

* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code = #patientDemographics (exactly)
* meta.security[HDP].display = "דמוגרפיה" (exactly)
* identifier 1..*