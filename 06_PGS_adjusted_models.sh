# 06_PGS_adjusted_models.sh
# Run GCTA and BOLT-REML with PGS adjustment
# Used to evaluate whether rare variant heritability is independent of common variant effects

gcta64 \
  --grm Aset \
  --pheno pheno.txt \
  --covar cov.txt \
  --qcovar Aset.rare.pca_with_PGS \
  --reml \
  --out Aset.PGS.adjusted
