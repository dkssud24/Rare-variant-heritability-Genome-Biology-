# 03_rare_PCA_each_set.sh
# Compute principal components (PCA) using rare variants
# Used as covariates to control population structure from rare variants

plink2 --bfile Aset --pca 30 approx --out Aset.rare.pca
plink2 --bfile Bset --pca 30 approx --out Bset.rare.pca
plink2 --bfile Cset --pca 30 approx --out Cset.rare.pca
