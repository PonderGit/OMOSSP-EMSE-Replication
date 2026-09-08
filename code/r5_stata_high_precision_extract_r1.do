version 16.0
clear all
set more off

* OMOSSP R5 — High-Precision Extraction from already-saved Stata estimates.
* IMPORTANT: This file DOES NOT rerun any regression.
* It only reads the frozen .ster files produced by the completed R5 Stata run.

local OUT "results/r5"

tempname fh
file open `fh' using "`OUT'/r5_stata_baseline_high_precision.csv", write text replace
file write `fh' "model,N,projects,r2_within,term,b,se" _n

estimates use "`OUT'/r5_A.ster"
file write `fh' "A," %12.0f (e(N)) "," %12.0f (e(N_g)) "," %24.17g (e(r2_w)) ",ln_resolution," %24.17g (_b[ln_resolution]) "," %24.17g (_se[ln_resolution]) _n
file write `fh' "A," %12.0f (e(N)) "," %12.0f (e(N_g)) "," %24.17g (e(r2_w)) ",ln_issues_new," %24.17g (_b[ln_issues_new]) "," %24.17g (_se[ln_issues_new]) _n
file write `fh' "A," %12.0f (e(N)) "," %12.0f (e(N_g)) "," %24.17g (e(r2_w)) ",ln_contributors," %24.17g (_b[ln_contributors]) "," %24.17g (_se[ln_contributors]) _n

estimates use "`OUT'/r5_B.ster"
file write `fh' "B," %12.0f (e(N)) "," %12.0f (e(N_g)) "," %24.17g (e(r2_w)) ",ln_resolution," %24.17g (_b[ln_resolution]) "," %24.17g (_se[ln_resolution]) _n
file write `fh' "B," %12.0f (e(N)) "," %12.0f (e(N_g)) "," %24.17g (e(r2_w)) ",ln_issues_new," %24.17g (_b[ln_issues_new]) "," %24.17g (_se[ln_issues_new]) _n
file write `fh' "B," %12.0f (e(N)) "," %12.0f (e(N_g)) "," %24.17g (e(r2_w)) ",ln_contributors," %24.17g (_b[ln_contributors]) "," %24.17g (_se[ln_contributors]) _n

estimates use "`OUT'/r5_C.ster"
file write `fh' "C," %12.0f (e(N)) "," %12.0f (e(N_g)) "," %24.17g (e(r2_w)) ",ln_issues_new," %24.17g (_b[ln_issues_new]) "," %24.17g (_se[ln_issues_new]) _n
file write `fh' "C," %12.0f (e(N)) "," %12.0f (e(N_g)) "," %24.17g (e(r2_w)) ",ln_contributors," %24.17g (_b[ln_contributors]) "," %24.17g (_se[ln_contributors]) _n

estimates use "`OUT'/r5_D.ster"
file write `fh' "D," %12.0f (e(N)) "," %12.0f (e(N_g)) "," %24.17g (e(r2_w)) ",ln_issues_new," %24.17g (_b[ln_issues_new]) "," %24.17g (_se[ln_issues_new]) _n
file write `fh' "D," %12.0f (e(N)) "," %12.0f (e(N_g)) "," %24.17g (e(r2_w)) ",ln_contributors," %24.17g (_b[ln_contributors]) "," %24.17g (_se[ln_contributors]) _n

file close `fh'
display "OMOSSP_R5_STATA_HIGH_PRECISION_EXTRACT_COMPLETE"
