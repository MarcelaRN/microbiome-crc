# Pre-processing: deeper EDA, filtering, CLR transformation and PCA

The deeper EDA involved checking the depth (if the total abundance really sum to 1 for every sample), the sparsity (percetage of zeros), and the prevalence per taxons (percentage of samples in which each taxon is present).

The dataset was filtered to remove low-prevalence and low-abundance taxa, reducing the noise created by hundreds of species appearing in only 1-2 samples. Taxa present in at least 10% of the smaples and with a mean abundance of at least 0.01% were kept.

Relative abundance data has a built-in a negative correlation that has nothing to do with biology. To fix this, the zeros were replaced with a small pseudocount and then rescaled it so its total abundance matched the original, folowed by a centered log-ratio (CLR) transformation.

Once the CLR tranformation is applied, the data is out of the contrained compositional space into an ordinary real-number space where standard statistics are valid. To observe the distorsion that compositional data causes, PCA was run on the raw and CLR-transformed data.

The sparsity of the sample was 81.8% and 261 of 645 taxa survived filtering. The PCA plots looked very different when comparing the raw and the CLR-transformed data. In the raw PCA, no obvious separation by disease status in the raw PCA was observed. The CLR-transformed data show a more even spread, but confirming whether the groups actually differ statistically requires a formal test.
