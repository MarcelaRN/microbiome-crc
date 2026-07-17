# Upstream data pipeline

The data comes from the Zeller, et al. (2014), Molecular Systems Biology, DOI: 10.15252/msb.20145645 publication. Fecal samples from colorectar cancer (CRC) patients were compared to tumor-free patients to test whether a metagenomic profiling could serve as a non-invasive screening method alongised the standard fecal occult blood (FOBT) test.

Pre-processing of the samples included DNA extraction from the fecal material, followed by shotgun metagenomic sequencing. The data used in this project comes from a standardised re-processing of the raw sequencing reads: MetaPhLAn3 for taxonomic profiling and HUMAnN3 for functional profiling, applied unifomly by the curatedMetagenomicData maintainers across every study in the collection, so that they are comparable across studies. Therefore, this is not identical to the pipeline used in the original 2014 paper.

# What I did

I queried and pulled the relative_abundance table and sample metadata for ZellerG_2014 study via the curatedMetagenomicData R package, exported both to CSV, and move into a pyhthon workflow for downstream analysis.
