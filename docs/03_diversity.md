# Diversity analysis

The diversity analysis included the calculation of the alpha and beta diversity. For the alpha diversity, there metrics were computed: Shannon, Simpson and observed richness (OTUs). For beta diversity, distance matrices were computed and tested with PERMANOVA, followed by PCoA for visualisation.

## Alpha diversity

Alpha diversity measures how diverse a single sample is internally. It uses the filtered raw relative abundance data, since these metrics are mathematically defined on proportions (not on the CLR-transformed data). The Shannon index combines how many species are present and how evenly they are distributed. The Simpson index is similar but weighted more heavily toward the dominant species. Observed richness simply counts how many species are present, ignoring their abundance.

Results were saved to 'data/processed/alpha*diversity.csv' and plotted as boxplots ('figures/alpha_diversity_boxplot*\*.png') for all three metrics across the three groups (control, CRC, adenoma).

A Kruskal-Wallis test was performed for each metric, to check for significant differences across all three groups simultaneously:

shannon: H=1.31, p=0.5199
simpson: H=2.80, p=0.2472
observed: H=0.38, p=0.8266

None of the three metrics showed a stadistically significant difference across groups (all p > 0.05). Since the omnibus test was non-significant, pairwise Mann-Whitney test were not strictly required, but were run on Shannon diversity as a confirmatory check:

Mann-Whitney U (CRC vs control): stat=1493.00, p=0.4847
Mann-Whitney U (CRC vs adenoma): stat=1166.00, p=0.6940
Mann-Whitney U (control vs adenoma): stat=1450.00, p=0.2581

A Bonferroni-corrected threshold of 0.017 (0.050/3 pairwise comparisons) would apply if any results needed to be judged significant; none of the p-values approach even the uncorrected 0.05 threshold, consistent with the Kruskal-Wallis result above. Overall, gut microbiome diversity within a sample does not differ significantly between CRC, adenoma, and control patients.

## Beta diversity

Beta diversity measures how different samples are from each other, rather than how diverse each sample is internally. Two distance matrices were computed: Bray-Curtis (on filtered relative abundance, the conventional ecological choice) and Aitchison distance (Euclidean distance on CLR data). Both were computed and tested to check whether the conclusion depends on which distance definition is used - agreement between two methods built on different assumptions is stronger evidence than either alone.

PERMANOVA tests whether groups occupy significantly different regions of this distance space, by comparing between-group distances to within-group distances, using permutation (999 shuffles of the group labels) to compute a p-value rather than assuming a known distribution.

Bray-Curtis: pseudo-F=2.72, p=0.001
Aitchison: pseudo-F= 1.96, p=0.001

Both distance metrics agree: group differences in overall community composition are highly significant (p=0.001, the smallest value obtainable with 999 permutations). This holds despite alpha diversity showing no group differences - indicating the three groups have similarly diverse communities overall, but are composed of systematically different taxa. This is consistent with the original Zeller et al. (2014) findings, where specific taxa (rather than overall diversity) carried the disease signal.

It is important to notice that a PERMANOVA does not distinguish differences in group centroids from differences in group dispersion (variability); a formal PERMDISP test would strengthen this conclusion and is a natural extension for future work.

A principal coordinates analysis (PCoA) was performed on the Bray-Curtis distance matrix and plotted by disease status ('figures/pcoa_braycurtis.png'). Despite the significant PERMANOVA result, the three groups appear heavily intermixed in the 2D plot, with no visually obvious clustering. This is not a contradiction: PCo1 and PCo2 together capture only 17.5%of total variance (9.3% + 8.2%), while PERMANOVA tests the full multivariate distance structure across all dimensions. A real, statistically robust difference can exist mostly along dimensions not shown in a 2D projection, consistent with a diffuse, multi-taxon signal rather than one dominated by a single axis of variation.

A PCoA was also run on the Aitchison distance matrix. Since Aitchison distance is mathematically equivalent to Euclidean distance on CLR data, PcOA on this matrix is expected to closely resemble the CLR-PCA plot, this was performed as a consistency check rather than as new analysis.
