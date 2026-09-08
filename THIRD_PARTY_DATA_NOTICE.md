# Third-Party Data Notice

## Scope

This replication package uses third-party public data infrastructure provided by **OpenDigger / X-lab** and public repository identifiers from GitHub.

The authors distinguish public accessibility from ownership and relicensing rights.

## OpenDigger / X-lab

OpenDigger is the metric-data provider used for the project-level digital traces in this study.

Official upstream repository:
https://github.com/X-lab2017/open-digger

Frozen source-semantic lock used by this study:
- OpenDigger commit: `63e4b89ecd525221be95fe2a48a714ebb3c722ec`
- `src/metrics/chaoss.ts` blob: `b7a9293434a081d713406eac5f7fc889d35de97f`
- `src/metrics/basic.ts` blob: `741591d9916ae068c0c5b46d6fe7e24b025a43bc`

The exact public metric URLs/paths retrieved for the frozen study frame are recorded in:
`provenance/r4_retrieval_ledger.csv`.

## Rights boundary

The authors do **not** claim ownership of OpenDigger metric data and do **not** relicense those data.

The upstream OpenDigger repository explicitly identifies Apache-2.0 for its **code part**. This replication package does not treat that code license as an author-side license for exported OpenDigger metric datasets.

Readers should comply with the current upstream provider terms applicable at the time of retrieval.

## What is not redistributed

The initial public release does not redistribute:

1. Frozen raw OpenDigger metric snapshot  
   SHA-256: `ea2ffd5f86cfdd3d1681838521f74697754bce01854c0b78d4408c3fcbb8cf98`

2. Full corrected 24-month analytic panel  
   CSV SHA-256: `5cc29d08daf720a94a6eb9e3d59be4a6a499e2c5396811286ba1c3fc2b7a104c`  
   DTA SHA-256: `814eef9868630ac94c0d59f15733b894c39dff78785a81f535cbcbf0f00c8346`

3. Full corrected 36-month robustness panel  
   CSV SHA-256: `73c0d25cc34e0b166c16113c0fa03f3708ccb7d953164101d82ae95f1ba4a03c`  
   DTA SHA-256: `8fe2f2cbeffc2e94bbfdb0df70861607ec6947b27c231c247fc5ff1557cd975b`

## Reconstruction-first route

Readers can reconstruct the data inputs by using:
- the frozen study frames in `governance/`,
- the public project/provenance information in `provenance/`,
- exact source paths in `provenance/r4_retrieval_ledger.csv`,
- the frozen OpenDigger semantic locks above,
- the reconstruction scripts in `code/`,
- and the checksums in `manifests/DATA_CHECKSUMS.csv`.

This design permits independent verification without asserting redistribution rights that the authors have not established.

## GitHub repository identifiers

The project frame contains public GitHub repository identifiers. These are public identifiers and are not described as anonymous data.

No developer email table, employee record, private repository, survey/interview response, or developer-level performance outcome is included in the formal replication package.

## Author code license boundary

The authors' selected MIT code license applies only to verified first-party software code included in `code/`.

It does not apply to:
- OpenDigger metric data,
- upstream OpenDigger source code,
- other third-party datasets or software,
- public third-party repository facts,
- or materials whose ownership is not verified.

## Acknowledgement

The authors acknowledge OpenDigger / X-lab for providing the public data infrastructure used in this research. OpenDigger/X-lab is not responsible for the authors' analyses, interpretations, or conclusions.
