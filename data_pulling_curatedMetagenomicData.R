# This is the pipeline to install the curatedMetagenomicData package and download the ZellerG_2014 dataset.

# Install curatedMetagenomicData package and download ZellerG_2014 dataset

if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("curatedMetagenomicData")

'
# if problems arise, try:
# ==============================
# 1. Instalar BiocManager
# ==============================

if (!requireNamespace("BiocManager", quietly = TRUE)) {
    install.packages("BiocManager")
}


# ==============================
# 2. Configurar Bioconductor
# ==============================

BiocManager::install(version = "3.20")

options(repos = BiocManager::repositories())


# ==============================
# 3. Actualizar paquetes básicos
# ==============================

BiocManager::install(update = TRUE, ask = FALSE)


# ==============================
# 4. Instalar paquetes microbioma
# ==============================

BiocManager::install(
    c(
        "rbiom",
        "mia",
        "curatedMetagenomicData"
    ),
    ask = FALSE
)


# ==============================
# 5. Verificar instalación
# ==============================

library(rbiom)
library(mia)
library(curatedMetagenomicData)

sessionInfo()
'

# Load the required library and download the ZellerG_2014 dataset
library(curatedMetagenomicData)

zeller_list <- curatedMetagenomicData(
  "ZellerG_2014.relative_abundance",
  dryrun = FALSE,
  rownames = "short"
)

zeller_se <- zeller_list[[1]]
zeller_se   # inspect: should show a TreeSummarizedExperiment, ~199 samples

# export abundance and metadata to CSV files
abundance <- as.data.frame(SummarizedExperiment::assay(zeller_se))
metadata  <- as.data.frame(SummarizedExperiment::colData(zeller_se))

write.csv(abundance, "data/raw/zeller2014_abundance.csv", row.names = TRUE)
write.csv(metadata,  "data/raw/zeller2014_metadata.csv",  row.names = TRUE)
