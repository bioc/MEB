# MEB
R package for the SFMEB and scMEB methods.

This package provides a method to identify differential expression genes in the
same or different species. Given that non-DE genes have some similarities in 
features, a scaling-free minimum enclosing ball (SFMEB) model is built to cover 
those non-DE genes in feature space, then those DE genes, which are enormously
different from non-DE genes, being regarded as outliers and rejected
outside the ball. The method on this package is described in the article 
'A minimum enclosing ball method to detect differential expression genes for 
RNA-seq data' [1]. The SFMEB method is extended to the scMEB [2] method that 
considering two or more potential types of cells or unknown labels scRNA-seq 
dataset DEGs identification. 

# Installation
This package can be installed as follows:
```{r}
install.packages("BiocManager")
BiocManager::install("MEB")
```

# User's Guide
Please refer to the [vignetee](https://github.com/FocusPaka/MEB/blob/master/vignettes/NIMEB.Rmd) 
for detailed function instructions.

# Reference
1. Zhou, Y., Yang, B., Wang, J. et al. A scaling-free minimum enclosing ball 
method to detect differentially expressed genes for RNA-seq data. BMC Genomics 
22, 479 (2021). https://doi.org/10.1186/s12864-021-07790-0 
2. Zhu, J.D, Yang, Y.L. scMEB: A fast and clustering-independent method for 
detecting differentially expressed genes in single-cell RNA-seq data. 
(2023, pending publication)



