# MEB
This package provides a method to identify differential expression genes in the
same or different species. Given that non-DE genes have some similarities in 
features, we build a Minimum Enclosing Ball (MEB) to cover those non-DE
genes in feature space, then those DE genes, which are enormously
different from non-DE genes, being regarded as outliers and rejected
outside the ball. The method on this package are described in the article 
'A minimum enclosing ball method to detect differential expression genes for 
RNA-seq data' [1]. 

# Introduction
Next-generation sequencing provides the ability to study the underlying
complexities of gene expression [2]. It has been applied to a wide range 
of biological studies because of affordable and effective. RNA sequencing, 
which involves mapping sequenced fragments of cDNA to a reference genome or 
transcriptome, has been emerging as an attractive alternative for genotyping
[3], analysing methylation patterns [4], and identifying transcription factor 
binding sites [5]. The number of sequenced fragments mapped to a gene is
used to quantify gene expression [6]. Interest lies in comparing the expression 
of an organism under different biological condition or completely different 
species.

In this paper, we try to find a method to detect differential expression
genes and it is no need to normalize data in advance. The
Minimum Enclosing Ball (MEB) problem, which was proposed by
[7], is to find the smallest sphere to enclose all of
the given points in n-dimensional space. In this way, those points
with some similarities have been covered in a sphere. This property
has been used to outlier detection. The expression of MEB problem
is similar to the Support Vector Data Description (SVDD) [8], which also 
can be used to detect novelties or outliers. Specifically, MEB constructs a 
spherically shaped decision boundary to cover objects, a new point will be 
discriminated as outlier if it lies outside of the ball. Just as the Support 
Vector Machine (SVM) [9], which efficiently performs a non-linear
transformation for the data, any points are implicitly mapped into
high-dimensional feature spaces, thus we can always find the ball
that satisfies the condition.

# User's Guide
Please refer to the "MEB.pdf" vignetee for detailed function instructions.

# Reference
1. A minimum enclosing ball method to detect differential expression genes for RNA-seq 
data. Jiadi Zhu, Yan Zhou, Junhui Wang, Youlong Yang (2019, pending publication).
2. Applications of new sequencing technologies for transcriptome analysis. Morozova, O., 
Hirst, M. and Marra, M.A. (2009). Annu Rev Genomics Hum Genet , 10, 135-151.
3. Analysis of high-throughput biological data: some statistical problems in RNA-seq 
and mouse genotyping. Taub, M.A. (2009). PhD thesis Department of Statistics , UC Berkeley.
4. Principles and challenges of genome-wide DNA methylation analysis. Laird, P.W. (2010). 
Nature Reviews Genetics, 11, 191-203.
5. Unbiased mapping of transcription factor binding sites along human chromosomes 21 
and 22 points to widespread regulation of noncoding RNAs. Cawley, S. et al. (2004). 
Cell, 116, 499-509.
6. From RNA-seq reads to differential expression results. Oshlack, A., Robinson, M.D. 
and Young, M.D. (2010). Genome Biol , 11(12), 110.
7. The minimum covering sphere problem. Elzinga, J. and Hearn, D. W. (1972). Management 
Science, 19, 96104.
8. Support vector data description. David, M. J. T., and Robert, P. W. D. (2004). 
Machine Learning, 54(1), 4566.
9. Support-vector networks. Cortes, Corinna; Vapnik, Vladimir N. (1995). Machine 
Learning, 20 (3), 273297.

[![Travis-CI Build Status](https://travis-ci.org/FocusPaka/MEB.svg?branch=master)](https://travis-ci.org/FocusPaka/MEB)
