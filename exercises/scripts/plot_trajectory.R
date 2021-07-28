#!/usr/bin/env Rscript

# load the helper script
source("../selection/path_utilities.r")

# load the MCMC output
paths <- read.path("exercises/horse-MC1R")

# load the sample data
samples <- read.delim("exercises/data/horse-MC1R.txt", header=FALSE, col.names = c('derived_count', 'sample_size', 'age_youngest', 'age_oldest'))

# convert the counts into frequencies
sam_freqs <- samples$derived_count / samples$sample_size

nref = 2500
gen_time = 5

# convert the mid-point age into diffusion units
sam_times <- rowMeans(samples[c('age_youngest', 'age_oldest')]) / (2*nref*gen_time)

# plot the trajectory to a PDF file
pdf(file = "horse-MC1R.pdf", width=8, height=5)
plot.posterior.paths(paths, sam_freqs, sam_times, burnin = 500, xlim=c(min(sam_times), 0))
dev.off()
