# Reproduction Order

This file defines the intended reproduction sequence for the frozen OMOSSP EMSE replication package.

## Boundary

The workflow is designed to reproduce the frozen R3-R6 evidence chain. It must not be used to redefine the sample, indicators, missing/zero rules, model specifications, or inferential target after seeing results.

The formal interpretation is associational and measurement-validity oriented. No causal claim is authorized.

## 1. Environment

Use Python 3.12.14 and the frozen packages documented in:

- `results/r5_python_formal/r5_python_formal_environment.json`
- `results/r5_python_formal/r5_python_formal_pip_freeze.txt`

Stata 17 is optional for the primary reproduction and is used for independent cross-software verification.

## 2. Reconstruct the 24-month source and corrected panel

From the repository root:

```bash
python code/r4_formal_panel_construction.py
python code/r4_corrected_panel_rebuild_from_snapshot.py
```

The first script:
- starts from the frozen 882-project frame;
- retrieves documented OpenDigger public metric paths;
- writes the local raw snapshot and retrieval ledger;
- constructs the initial 24-month panel.

The second script:
- rebuilds the corrected panel from the locally reconstructed raw snapshot;
- applies the frozen R4 source-semantic and missing/zero rules.

Verify against:
`manifests/DATA_CHECKSUMS.csv`.

Do not proceed if the expected formal checksum is not reproduced without first diagnosing the discrepancy.

## 3. Reproduce the R5 Python baseline

```bash
python code/r5_python_formal_r1.py
```

Compare the regenerated coefficients and summary against:
- `results/r5_python_formal/r5_python_formal_coefficients.csv`
- `results/r5_python_formal/r5_python_formal_summary.json`

## 4. Optional Stata 17 baseline verification

Run:

```text
do code/r5_stata_baseline_r1.do
do code/r5_stata_high_precision_extract_r1.do
```

The baseline do-file creates the `.ster` files consumed by the high-precision extraction do-file.

Compare with:
- `verification/r5_stata_baseline_summary.csv`
- `verification/r5_stata_baseline_high_precision.csv`
- `verification/r5_python_stata17_cross_software_comparison_r1.csv`

Frozen R5 verification result:
- all slope coefficients pass the prospectively frozen 1e-8 absolute-or-relative criterion;
- coefficient direction matches;
- reconciled standard errors match after diagnosing the deterministic covariance scaling convention.

## 5. Reconstruct the frozen 36-month robustness panel

```bash
python code/r6a_robustness_feasibility_r1.py
```

This script uses:
- `governance/r6_full36_structural_frame_r1.csv`
- `governance/omossp_r6_robustness_design_lock_r1.json`
- the reconstructed R4 raw snapshot;
- the corrected 24-month Stata input.

Verify the 36-month CSV and DTA checksums against:
`manifests/DATA_CHECKSUMS.csv`.

## 6. Reproduce the frozen R6 Python robustness analysis

```bash
python code/r6b_python_formal_robustness_r1.py
```

Compare with:
- `results/r6b_python_formal/r6b_python_formal_coefficients.csv`
- `results/r6b_python_formal/r6b_python_formal_summary.json`
- `results/r6b_python_formal/r6b_python_comparison_to_r5.csv`

Frozen R6 verification authority:
- 22 specifications;
- 59 coefficient rows;
- 0 coefficient failures;
- 0 direction mismatches.

## 7. Optional Stata 17 R6 verification

Run:

```text
do code/r6c_stata_robustness_r1.do
```

Compare with:
- `verification/r6c_stata_robustness_high_precision.csv`
- `verification/r6c_stata_robustness.log`

## 8. Interpretation

A successful computational reproduction verifies the frozen analysis.

It does not expand the supported construct beyond the paper's evidence boundary. In particular, the package does not establish overall OSS performance, software-team performance, developer productivity, technical quality, project success, or causal effects.
