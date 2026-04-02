# 02_make_ABC_GRM.sh
# Construct GRMs for A, B, and C variant sets using GCTA
# These GRMs are used for heritability estimation (GREML and mGRM)

gcta64 --bfile Aset --make-grm --out Aset
gcta64 --bfile Bset --make-grm --out Bset
gcta64 --bfile Cset --make-grm --out Cset
