# OMOSSP-EMSE-Replication

**Pre-release replication package** for the manuscript:

> **What Does Closed-Issue Resolution Time Measure? Evidence from Open-Source Software Projects**

Target journal: *Empirical Software Engineering (EMSE)*.

This repository is a reader-facing replication package for the frozen empirical analysis. It is **not** a claim that repository activity, issue counts, or closed-issue resolution duration are general measures of software-team performance. The paper evaluates the measurement properties and inferential boundaries of a closed-issue resolution-duration indicator for issue-response timeliness in open-source software projects.

## Frozen empirical scope

- Formal project frame: **882 public GitHub repositories**
- Main structural window: **2024-01 through 2025-12**
- Main structural panel: **21,168 project-months**
- R5 baseline: frozen Python estimation with independent Stata 17 verification
- R6 robustness: **22 frozen specifications / 59 coefficient rows / 0 coefficient failures / 0 direction mismatches**
- 36-month robustness reconstruction: **2023-01 through 2025-12**, 844-project structural frame, 30,384 project-month rows

All R3-R6 samples, indicators, missing/zero rules, models, statistical results, tables, and figures are frozen.

## Repository structure

- `code/` — frozen first-party curation, construction, Python, and Stata code
- `governance/` — frozen runtime governance inputs required by the scripts
- `provenance/` — public project-frame/provenance material and the OpenDigger retrieval ledger
- `results/` — frozen machine-readable Python outputs and environments
- `verification/` — frozen Stata and Python-Stata cross-software verification artifacts
- `manifests/` — frozen source refs, checksums, file provenance, and reproduction order
- `THIRD_PARTY_DATA_NOTICE.md` — data ownership, redistribution, and reconstruction boundary
- `CITATION.cff` — citation metadata

## Data route: reconstruction first

The study uses publicly accessible GitHub project identifiers and OpenDigger/X-lab metric data.

**OpenDigger raw metric data and the complete 24-month / 36-month analytic panels are not redistributed in this initial public package.** Instead, the repository provides the frozen project frame, exact source paths, source-version locks, retrieval ledger, reconstruction code, and formal checksums.

The authors do not relicense OpenDigger metric data. See `THIRD_PARTY_DATA_NOTICE.md`.

## Reproduction prerequisites

Primary engine:
- Python 3.12.14
- `linearmodels 6.1`
- `pandas 2.2.3`
- `numpy 2.5.3`
- `scipy 1.18.1`
- `statsmodels 0.15.0`

The frozen Python environment is recorded in:
- `results/r5_python_formal/r5_python_formal_environment.json`
- `results/r5_python_formal/r5_python_formal_pip_freeze.txt`
- `results/r6b_python_formal/r6b_python_formal_environment.json`

Independent verification:
- Stata 17, using the frozen do-files

Stata is optional for reproducing the primary Python results but is required to reproduce the independent cross-software verification.

## Reproduction route

### A. Source-to-panel reconstruction

From the repository root:

```bash
python code/r4_formal_panel_construction.py
python code/r4_corrected_panel_rebuild_from_snapshot.py
```

These steps use the frozen 882-project frame in `governance/r3_formal_github_project_frame_r1.csv`, retrieve the documented OpenDigger public metric paths, create the local raw snapshot, and rebuild the corrected 24-month panel.

Verify the resulting files against `manifests/DATA_CHECKSUMS.csv`.

Expected key checksums:

- Raw OpenDigger snapshot SHA-256: `ea2ffd5f86cfdd3d1681838521f74697754bce01854c0b78d4408c3fcbb8cf98`
- Corrected 24-month CSV SHA-256: `5cc29d08daf720a94a6eb9e3d59be4a6a499e2c5396811286ba1c3fc2b7a104c`
- Corrected 24-month DTA SHA-256: `814eef9868630ac94c0d59f15733b894c39dff78785a81f535cbcbf0f00c8346`

### B. R5 baseline

```bash
python code/r5_python_formal_r1.py
```

Compare the regenerated outputs with:
- `results/r5_python_formal/r5_python_formal_coefficients.csv`
- `results/r5_python_formal/r5_python_formal_summary.json`

Optional Stata 17 verification:

```text
do code/r5_stata_baseline_r1.do
do code/r5_stata_high_precision_extract_r1.do
```

The baseline do-file regenerates the `.ster` files required by the high-precision extraction do-file; therefore the binary `.ster` files are not redistributed.

Compare against:
- `verification/r5_stata_baseline_summary.csv`
- `verification/r5_stata_baseline_high_precision.csv`
- `verification/r5_python_stata17_cross_software_comparison_r1.csv`

### C. R6 36-month feasibility and robustness

```bash
python code/r6a_robustness_feasibility_r1.py
```

Expected 36-month checksums:

- CSV SHA-256: `73c0d25cc34e0b166c16113c0fa03f3708ccb7d953164101d82ae95f1ba4a03c`
- DTA SHA-256: `8fe2f2cbeffc2e94bbfdb0df70861607ec6947b27c231c247fc5ff1557cd975b`

Then run:

```bash
python code/r6b_python_formal_robustness_r1.py
```

Optional independent Stata 17 verification:

```text
do code/r6c_stata_robustness_r1.do
```

Compare against:
- `results/r6b_python_formal/`
- `verification/r6c_stata_robustness_high_precision.csv`
- `verification/r6c_stata_robustness.log`

See `manifests/REPRODUCTION_ORDER.md` for the complete sequence and boundaries.

## Source and provenance locks

OpenDigger source semantics were frozen against:
- repository: `X-lab2017/open-digger`
- frozen source commit: `63e4b89ecd525221be95fe2a48a714ebb3c722ec`
- `src/metrics/chaoss.ts` blob: `b7a9293434a081d713406eac5f7fc889d35de97f`
- `src/metrics/basic.ts` blob: `741591d9916ae068c0c5b46d6fe7e24b025a43bc`

The exact OpenDigger retrieval paths and per-request provenance are recorded in `provenance/r4_retrieval_ledger.csv`.

## Interpretation boundary

The package supports reproducible evidence about the **measurement properties and inferential limits** of closed-issue resolution duration.

It does **not** support claims about:
- overall open-source software performance,
- software-team performance,
- developer productivity,
- technical quality,
- project success,
- or causal effects.

## License boundary

R5-C selected the **MIT License for verified first-party author-written code only**.

The MIT license does **not** apply to OpenDigger data, other third-party data/code, public repository identifiers as third-party facts, or materials whose rights are not owned by the authors.

The formal `LICENSE` file is pending only the verified copyright-holder line. This does not change the frozen MIT policy or the third-party-data boundary.

## Acknowledgements

The authors acknowledge **OpenDigger / X-lab** for providing the public data infrastructure used in this research. OpenDigger/X-lab is not responsible for the authors' data processing, analyses, interpretations, or conclusions.

## Citation

Citation metadata are provided in `CITATION.cff`.

Current manuscript authors:
1. Gu Xiaopeng
2. Ma Meizi
3. Gao Yang
4. Alfiya Yuryevna Abinova

Gu Xiaopeng ORCID: https://orcid.org/0009-0004-5735-0535

## Pre-release status

This repository is under controlled release construction. A release tag and permanent identifier will be frozen only after the exact-tree privacy/secret/license audit and R5-I release freeze.
