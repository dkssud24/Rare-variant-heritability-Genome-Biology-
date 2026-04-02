# Rare variant heritability analysis using UK Biobank WGS data

This repository contains scripts used to estimate rare-variant heritability and perform multi-component GREML (multi-GRM) analyses in the UK Biobank whole-genome sequencing dataset.

---

## Analysis workflow

### 1. Rare variant heritability estimation

- LD-independent rare variants were defined in set A using LD score calculation
- Principal components (PCA) were computed from rare variants
- Genetic relationship matrices (GRMs) were constructed using rare variants
- Heritability was estimated using:
  - GCTA (GREML)
  - BOLT-REML

---

### 2. PGS-adjusted sensitivity analysis

- Polygenic risk scores (PGS) derived from common variants were included as covariates
- The attenuation of rare-variant heritability was evaluated

---

### 3. Multi-GRM analysis (rare + common variants)

To assess potential confounding due to LD between rare and common variants:

- 30,000 individuals were randomly sampled (20 replicates)
- For each replicate:
  - Rare and common PLINK datasets were generated
  - GRMs were constructed separately for rare and common variants
  - PCA was computed separately for rare and common variants
  - Multi-component REML analysis was performed using GCTA

Covariates:
- Age
- Sex
- First 10 PCs from rare variants
- First 10 PCs from common variants

---

## Scripts

### Main heritability analysis

- GCTA REML analysis using rare variant GRM
- BOLT-REML analysis using merged genotype data

---

### Multi-GRM pipeline

- `step1.makebed.sh`
  - Generate PLINK bed files for rare and common variants in each subset

- `step2.make_grm.sh`
  - Construct GRMs for rare and common variants

- `step3.pca.rare.common.sh`
  - Perform LD pruning and PCA for common variants

- `estimate_pca_rare.sh`
  - Perform PCA for rare variants

- `step4.run.rare.common.sh`
  - Run multi-component REML (multi-GRM) for each phenotype

## Software

- PLINK2
- GCTA v1.94
- BOLT-LMM v2.4.1

---

## Notes

- UK Biobank data are not publicly available
- Scripts assume preprocessed genotype and phenotype files
- File paths should be modified according to local environment

---

## Reproducibility

This repository provides the command lines and scripts used in the study.  
Due to UK Biobank data access restrictions, raw genotype data are not included.
