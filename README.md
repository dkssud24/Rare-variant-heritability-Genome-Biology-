# Rare variant heritability analysis using UK Biobank WGS data

This repository contains scripts used to estimate rare-variant heritability and perform multi-component GREML (multi-GRM) analyses in the UK Biobank whole-genome sequencing dataset.

---

## Analysis workflow

### 1. Rare variant heritability estimation

- LD-independent rare variants were defined in set A using LD score calculation  
- Genetic relationship matrices (GRMs) were constructed for A, B, and C variant sets  
- Principal components (PCA) were computed from rare variants  
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

- `01_ldscore_Aset.sh`  
  - LD score calculation and definition of LD-independent rare variants  

- `02_make_ABC_GRM.sh`  
  - Construction of GRMs for A, B, and C sets  

- `03_rare_PCA_each_set.sh`  
  - PCA computation using rare variants  

- `04_GCTA_GREML.sh`  
  - Heritability estimation using GCTA  

- `05_BOLT_REML.sh`  
  - Heritability estimation using BOLT-REML  

- `06_PGS_adjusted_models.sh`  
  - GCTA and BOLT-REML analyses with PGS adjustment  

- `07_random30k_20rep.sh`  
  - Random sampling of 30,000 individuals (20 replicates)  

- `08_common_rare_PCA.sh`  
  - PCA computation for both rare and common variants  

- `09_mGRM_analysis.sh`  
  - Multi-GRM (joint rare + common) REML analysis  

---

## Software

- PLINK2  
- GCTA v1.94  
- BOLT-LMM v2.4.1  

---

## Notes

- UK Biobank data are not publicly available  
- Scripts assume preprocessed genotype and phenotype files  
- File paths should be modified according to the local environment  

---

## Reproducibility

This repository provides the command lines and scripts used in the study.  
Due to UK Biobank data access restrictions, raw genotype data are not included.
