# 01_ldscore_Aset.sh
# Calculate LD scores in the A set using GCTA
# Used to define LD-independent rare variants

gcta64 \
  --bfile GRM.N110000.wgs \
  --ld-score \
  --ld-wind 100 \
  --ld-rsq-cutoff 0.05 \
  --out GRM.N110000.wgs.LDscore \
  --thread-num 64
