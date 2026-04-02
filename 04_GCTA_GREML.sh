# 04_GCTA_GREML.sh
# Estimate SNP heritability using GCTA-GREML with rare variant GRM
# Includes rare variant PCs as covariates

gcta64 \
  --grm Aset \
  --pheno pheno.txt \
  --covar cov.txt \
  --qcovar Aset.rare.pca \
  --reml \
  --out Aset.GCTA
