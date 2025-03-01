cwlVersion: v1.0
steps:
  read-potential-cases-fhir:
    run: read-potential-cases-fhir.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  palliative-and-end-of-life-care-physician---primary:
    run: palliative-and-end-of-life-care-physician---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-fhir/output
  palliative-and-end-of-life-care---primary:
    run: palliative-and-end-of-life-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: palliative-and-end-of-life-care-physician---primary/output
  palliative-and-end-of-life-care-service---primary:
    run: palliative-and-end-of-life-care-service---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: palliative-and-end-of-life-care---primary/output
  palliative-and-end-of-life-care-admission---primary:
    run: palliative-and-end-of-life-care-admission---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: palliative-and-end-of-life-care-service---primary/output
  life---primary:
    run: life---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: palliative-and-end-of-life-care-admission---primary/output
  palliative-and-end-of-life-care-community---primary:
    run: palliative-and-end-of-life-care-community---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: life---primary/output
  palliative-and-end-of-life-care-hospice---primary:
    run: palliative-and-end-of-life-care-hospice---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: palliative-and-end-of-life-care-community---primary/output
  palliative-and-end-of-life-care-discharge---primary:
    run: palliative-and-end-of-life-care-discharge---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: palliative-and-end-of-life-care-hospice---primary/output
  palliative-and-end-of-life-care-anticipatory---primary:
    run: palliative-and-end-of-life-care-anticipatory---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: palliative-and-end-of-life-care-discharge---primary/output
  under-palliative-and-end-of-life-care---primary:
    run: under-palliative-and-end-of-life-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: palliative-and-end-of-life-care-anticipatory---primary/output
  palliative-and-end-of-life-care-oncology---primary:
    run: palliative-and-end-of-life-care-oncology---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: under-palliative-and-end-of-life-care---primary/output
  palliative-and-end-of-life-care-medication---primary:
    run: palliative-and-end-of-life-care-medication---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: palliative-and-end-of-life-care-oncology---primary/output
  referral-palliative-and-end-of-life-care---primary:
    run: referral-palliative-and-end-of-life-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: palliative-and-end-of-life-care-medication---primary/output
  palliative-and-end-of-life-care-pathway---primary:
    run: palliative-and-end-of-life-care-pathway---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: referral-palliative-and-end-of-life-care---primary/output
  care---primary:
    run: care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: palliative-and-end-of-life-care-pathway---primary/output
  palliative-and-end-of-life-care-treatment---primary:
    run: palliative-and-end-of-life-care-treatment---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: care---primary/output
  patient-palliative-and-end-of-life-care---primary:
    run: patient-palliative-and-end-of-life-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule18
      potentialCases:
        id: potentialCases
        source: palliative-and-end-of-life-care-treatment---primary/output
  specialist-palliative-and-end-of-life-care---primary:
    run: specialist-palliative-and-end-of-life-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule19
      potentialCases:
        id: potentialCases
        source: patient-palliative-and-end-of-life-care---primary/output
  palliative-and-end-of-life-care-issue---primary:
    run: palliative-and-end-of-life-care-issue---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule20
      potentialCases:
        id: potentialCases
        source: specialist-palliative-and-end-of-life-care---primary/output
  palliative-and-end-of-life-care-lodge---primary:
    run: palliative-and-end-of-life-care-lodge---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule21
      potentialCases:
        id: potentialCases
        source: palliative-and-end-of-life-care-issue---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule22
      potentialCases:
        id: potentialCases
        source: palliative-and-end-of-life-care-lodge---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
  inputModule18:
    id: inputModule18
    doc: Python implementation unit
    type: File
  inputModule19:
    id: inputModule19
    doc: Python implementation unit
    type: File
  inputModule20:
    id: inputModule20
    doc: Python implementation unit
    type: File
  inputModule21:
    id: inputModule21
    doc: Python implementation unit
    type: File
  inputModule22:
    id: inputModule22
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
