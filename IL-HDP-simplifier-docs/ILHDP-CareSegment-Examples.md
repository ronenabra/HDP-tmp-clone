# Illustrative Examples: When to Create a New Care Segment and When Not To

The following examples are **illustrative, not exhaustive**.  
The guiding principle is:

- **Create a new care segment** when there is a **change in clinical responsibility**, or when a **significant clinical event** needs its own timing, participants, lifecycle, and associated artifacts.
- **Do not create a new care segment** for **physical movement alone**, **routine ward activities**, **short, focused ambulatory procedural flow**, or **administrative workflow stages** that can be represented within the same Encounter or through other clinical resources.

An important implementation point is that the same clinical activity may be modeled differently in different care settings. For example, surgery, anesthesia, and recovery during an **inpatient hospitalization** will often justify one or more separate care segments, because they occur within a broader hospitalization context and may represent distinct bounded events within it. By contrast, in an **ambulatory or day-procedure setting**, where the entire visit is short and focused on that procedure, those phases will usually remain part of a **single encounter** or, where a hierarchical model is used, a **single segment**, rather than being split into multiple Encounter segments.

These examples do not replace the core policy described in the main IG. In particular, the mandatory hospitalization hierarchy is intentionally shallow and SHOULD NOT exceed three levels: top-level hospitalization, child care segment, and optional child event segment beneath a segment.

Another key implementation point is the distinction between **clinical responsibility** and **physical or nursing-unit location**. A change in `serviceProvider` ordinarily creates a new care segment. A change in nursing unit, room, or bed, by itself, ordinarily does not; it should usually be represented through `Encounter.location` and the associated location history.

## Quick Example Guide

> A routine discussion, ward round, handoff, internal supervisory consult, or ordinary case review that is part of the usual workflow of the responsible ward or team SHOULD NOT by itself create a new care segment. Likewise, routine diagnostic activities such as common ward imaging or ordinary emergency-department ultrasound SHOULD NOT by themselves create separate care segments when they can be represented through ImagingStudy, Observation, Procedure, and related resources within the same segment. However, a cross-specialty consultation, formally convened consilium, committee evaluation, or another distinct clinical event MAY be represented as a separate event segment when it has its own participants, timing, purpose, and associated outputs. In the same way, a more substantial imaging episode during hospitalization, such as MRI, MAY be represented as a separate event segment when it constitutes a distinct, clinically meaningful phase of care rather than merely a routine diagnostic step.

## Specific Examples and Rationale

### Create a New Care Segment

| Scenario | Create new segment? | Why |
| --- | --- | --- |
| Transfer from Emergency Department to Internal Medicine / Cardiology / Orthopedics | Yes | The responsible clinical unit changes, so the patient enters a new clinically coherent segment of care. |
| Transfer from Internal Medicine ward to ICU / CCU / NICU | Yes | Clinical responsibility changes substantially, usually with a different care team, setting, and care context. |
| Transfer between two wards or departments under different responsible teams | Yes | Even if the patient remains in the same hospital, a change in the accountable clinical unit should be reflected as a new segment. |
| Transfer between two internal medicine wards **when responsibility truly changes** from one team/unit to another | Yes | The key factor is not the ward label, but the change in clinical responsibility. |
| Surgery / operation episode during hospitalization | Usually yes | In an inpatient context, surgery often has distinct participants, exact timing, and separately queryable associated procedures, observations, anesthesia data, and complications. |
| Recovery room / PACU episode during hospitalization | Usually yes | When recovery is managed by a distinct team and has its own bounded clinical phase within the hospitalization, it is useful to model as a separate segment. |
| Consultation by an invited specialty team from another ward or specialty, such as Cardiology consulted for a patient hospitalized in Internal Medicine | Usually yes | This is often a distinct clinical event with its own participants, timing, specialty context, and recommendations, and is commonly meaningful to query separately. |
| Dedicated consilium or multidisciplinary case conference convened for a complex case, treatment decision, or formal assessment | Often yes | When the event has a defined time, specific participants, a clear clinical purpose, and a meaningful decision outcome, it may justify a separate event segment. |
| Formal committee evaluation, such as assessing fitness for a complex treatment protocol or evaluating decision-making capacity before involuntary hospitalization | Often yes | This is typically a bounded clinical event with a specific purpose, identifiable participants, and separately relevant conclusions or associated artifacts. |
| Hemodialysis performed during a general medical hospitalization when it is a distinct, non-routine event | Yes | It is a significant event with distinct timing, participants, and associated artifacts, and is often clinically meaningful to query separately. |
| Resuscitation during hospitalization | Yes | This is a clearly bounded, high-significance event with its own participants, timing, and associated observations/procedures. |
| PICC line placement or similarly significant invasive procedure during admission | Often yes | When the event is clinically important and implementers need to associate specific participants, timing, and artifacts, a separate segment may be justified. |
| MRI/CT during hospitalization, when treated as a major time-bounded event with dedicated coordination, transport, preparation, and separately important outputs | Often yes | Compared with routine bedside or ward imaging, MRI/CT during admission is often a more substantial event and may justify its own segment when implementers need to capture it as a distinct clinical episode. |
| Ambulatory / day-procedure visit that unexpectedly escalates to inpatient admission | Yes | Once the patient transitions from a short focused ambulatory visit into a broader hospitalization context, a new segment should be created to reflect the new care setting and responsibility structure. |
| Ambulatory / day-procedure visit with unplanned transfer to ICU or another inpatient team | Yes | This is no longer a single focused ambulatory episode; it becomes a new care segment because the clinical responsibility and context change materially. |

### Do Not Create a New Care Segment

| Scenario | Create new segment? | Why not |
| --- | --- | --- |
| Bed change within the same ward | No | This is physical movement only and should be represented in `Encounter.location` with location history. |
| Move from one room to another while the same clinical unit remains responsible | No | No change in clinical responsibility; location history is sufficient. |
| Transfer to another nursing unit for operational reasons while the same clinical service remains responsible | No | Nursing-unit may change without a change in the accountable clinical unit. Represent this through `Encounter.location` and location history rather than by creating a new segment. |
| Admission, stay, and discharge stages in the local workflow | No | The IG intentionally does not require separate Encounter layers for these source-system business-process stages, because the mandatory model does not mirror local administrative workflow structure. |
| Shift change between physicians or nurses within the same responsible unit | No | The care team may change, but the clinical responsibility of the segment remains the same. |
| Daily ward round | No | This is a routine activity within the segment, not a distinct clinically coherent episode. |
| Routine internal team meeting or standard case discussion within the ward | No | This is part of the normal care process within the existing segment and usually does not require its own lifecycle or separate queryable context. |
| Internal routine consult within the same care context, such as a medical student presenting a case to a senior attending or an ordinary supervisory discussion within the same department | No | This is part of ordinary care delivery, teaching, or supervision within the same responsible unit, not a distinct event segment. |
| Routine handoff or ordinary internal review within the same ward/team | No | Although clinically relevant, it remains part of ongoing care under the same responsible unit and is usually better represented in documentation rather than as a separate Encounter segment. |
| Ultrasound during an Emergency Department visit, when performed as part of the routine ED workup | No | This is usually part of the ordinary diagnostic process of the same encounter and is better represented through ImagingStudy / Observation and related resources. |
| Routine X-ray during hospitalization, such as chest X-ray or other common ward imaging | No | This is usually a routine diagnostic activity within the existing segment and does not by itself justify a separate Encounter segment. |
| Routine blood pressure measurement, bloodwork, ECG, portable ultrasound, routine imaging, medication administration | No | These are better represented as Observation, Procedure, MedicationAdministration, ImagingStudy, etc., linked to the existing segment. |
| Routine wound dressing or other expected ward-level care | No | These are standard care activities within the current segment and usually do not require their own Encounter lifecycle. |
| Discharge paperwork or administrative completion steps | No | These are administrative workflow actions, not separate clinical segments. |
| Ambulatory surgical visit where the whole purpose of the visit is the procedure, including anesthesia and short recovery | No | In this setting, the procedure, anesthesia, and recovery are usually all part of one short, focused encounter and do not need to be split into separate care segments. |
| Day surgery flow with pre-op area, procedure room / OR, and recovery area, all within the same ambulatory visit | No | These are operational phases of one focused ambulatory encounter, not separate clinically independent care segments. |
| Ambulatory endoscopy / colonoscopy / bronchoscopy visit with sedation and routine recovery | Usually no | The whole visit is typically a single bounded procedural episode, so separate sub-segments or event segments usually add complexity without clear benefit. |
| Ambulatory interventional radiology or catheter-based day procedure with routine preparation and recovery | Usually no | When the visit is short and organized around one planned procedure, the different operational phases are usually best treated as one encounter or, where a hierarchical model is used, one segment. |
| Same-day infusion / treatment visit with expected preparation, administration, and short observation, under one team | Usually no | These are often just phases of one focused ambulatory treatment encounter rather than separate care segments. |

### Borderline Cases: Apply Judgment

Some scenarios depend on how the organization models care and whether the event needs to stand on its own clinically.

| Scenario | Create new segment? | Use judgment based on… |
| --- | --- | --- |
| Specialist consult requested during hospitalization | Sometimes | Create a segment when the consult is a distinct cross-specialty event with its own timing, participants, and recommendations. Do not create one for ordinary internal supervision or routine discussion within the same team. |
| Endoscopy / cath lab / interventional radiology during admission | Sometimes | A separate segment is appropriate when the event is treated as a distinct episode of care rather than just a procedure performed during the existing segment. |
| Imaging during hospitalization | Sometimes | Routine ward imaging usually stays within the current segment. More substantial imaging episodes, such as MRI with dedicated coordination, transport, preparation, or special clinical significance, may justify a separate segment. |
| Temporary observation in another unit without transfer of responsibility | Usually no | If the original clinical team remains accountable, location plus related Procedure/Observation resources will usually be sufficient. |
| Procedure that is routine for that ward type | Usually no | If it is a normal part of the ward’s ongoing care and does not need its own lifecycle, participants, or associations, keep it within the segment. |
| Procedure that is unusual for that ward and clinically significant | Often yes | If it is exceptional and important to query as a distinct event, a separate event segment may be useful. |
| Multidisciplinary discussion about a complex case | Sometimes | If it is merely part of ordinary ongoing management, do not create a segment. If it is a formally convened consilium with distinct participants, timing, and a concrete decision outcome, a separate event segment may be appropriate. |
| Ambulatory procedure visit with prolonged recovery, unexpected complication, or materially distinct second phase of care | Sometimes | If the visit remains one focused ambulatory episode, keep it as one encounter or, where a hierarchical model is used, one segment. If a clearly separate clinically meaningful phase emerges with different responsibility or distinct artifacts, a separate segment may be justified. |
| Observation after ambulatory procedure | Usually no | Short routine post-procedure monitoring is usually part of the same ambulatory segment. If observation becomes prolonged or evolves into a different care context, reassessment is appropriate. |

### Practical Rule of Thumb for Implementers

Before creating a new care segment, ask:

1. **Did the accountable clinical unit or team change?**  
   If yes, create a new segment.

2. **Is this a distinct cross-specialty consultation, committee evaluation, or other bounded event with its own participants and purpose?**  
   If yes, a separate event segment may be appropriate.

3. **Does this event need its own timing, participants, and associated artifacts?**  
   If yes, a separate event segment may be appropriate.

4. **Is this merely a physical move, routine workflow phase, ordinary internal supervision, or routine diagnostic activity within the same clinically coherent episode?**  
   If yes, usually **do not** create a new segment.

5. **Is this a short, focused ambulatory procedural visit whose phases are all part of the same planned episode?**  
   If yes, usually keep it as **one encounter** or, where a hierarchical model is used, **one segment**, even if it includes preparation, anesthesia, procedure, and recovery.
