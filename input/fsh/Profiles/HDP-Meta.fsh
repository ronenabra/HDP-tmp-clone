Profile: ILHDPMeta
Parent: Meta
Id: il-hdp-meta
Title: "ILHDP Meta Profile"
Description: "Profile on Meta datatype for HDP with slicing on security"
* security 1..*
* security.system 1..1
* security.code 1..1
* security ^slicing.discriminator.type = #value
* security ^slicing.discriminator.path = "system"
* security ^slicing.rules = #open
* security ^slicing.description = "ILHDP codes only"
* security contains HDP 1..1
* security[HDP] ^short = "HDP information bucket"
* security[HDP] ^definition = "Security label identifying the HDP information bucket for this resource."
* security[HDP].system 1..1
* security[HDP].system = $info-buckets (exactly)
* security[HDP].code 1..1
* security[HDP] from $vs-info-buckets (required)
* insert ConformanceMetadata
