# 05_BOLT_REML.sh
# Estimate heritability using BOLT-REML
# Uses merged genotype data (rare + common)
./bolt \
    --bfile Aset \
    --phenoFile Aset.pheno.txt \
    --phenoCol pheno \
    --covarFile Aset.cov.txt \
    --covarCol sex \
    --qCovarCol age \
    --qCovarCol PC{1:10} \
    --reml \
    --numThreads 40 \
    --maxModelSnps 6000000 \
    >> result/Aset.result
