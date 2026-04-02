# 07_mGRM_pipeline.sh
# Perform multi-GRM analysis including:
# (1) random sampling of 30,000 individuals (20 replicates)
# (2) PCA computation for rare and common variants
# (3) joint REML analysis using multiple GRMs

for i in {1..20}; do

  # 1. Random sampling (30,000 individuals)
  shuf full_sample.fam | head -n 30000 > subset_$i.fam

  # 2. Generate subset data
  plink2 --bfile rare --keep subset_$i.fam --make-bed --out rare_subset_$i
  plink2 --bfile common --keep subset_$i.fam --make-bed --out common_subset_$i

  # 3. Compute PCA (rare)
  plink2 --bfile rare_subset_$i --pca 30 approx --out rare_subset_$i.pca

  # 4. Compute PCA (common)
  plink2 --bfile common_subset_$i --pca 30 approx --out common_subset_$i.pca

  # 5. Construct GRMs
  gcta64 --bfile rare_subset_$i --make-grm --out rare_subset_$i
  gcta64 --bfile common_subset_$i --make-grm --out common_subset_$i

  # 6. Create mgrm list
  echo rare_subset_$i > mgrm_$i.txt
  echo common_subset_$i >> mgrm_$i.txt

  # 7. Run multi-GRM REML
  gcta64 \
    --mgrm mgrm_$i.txt \
    --pheno pheno.txt \
    --covar cov.txt \
    --qcovar combined_pca_$i.txt \
    --reml \
    --out mgrm_result_$i

done
