###############################################################################################################
#
# This script loads a dataset pulled from the GCC website that contains a list of groundwater research projects
# funded 
#
###############################################################################################################

##### packages #####

library(dplyr)
library(bibliometrix)
library(ggplot2)
library(ggpubr)
library(scholar)
library(tidyverse)

###

##### load GCC list data #####

# pull file from directory:
gcclist <- read.csv("/Users/Amber/Documents/GitHub/GW_IA/originaldata/DNR_GW_AllProjects19852018.csv", header=TRUE, na.strings="")

###

##### load bib files #####

# pull files from directory:
bradburys <- readFiles("/Users/Amber/Documents/GitHub/GW_IA/authorsc/bradbury.bib")
# didn't work bc there aren't any bib files for Bradbury in authorsc folder (from scopus search)
bradburyg <- readFiles("/Users/Amber/Documents/GitHub/GW_IA/authorsgs/bradbury.bib")
bradburyw <- readFiles("/Users/Amber/Documents/GitHub/GW_IA/authorswos/bradbury.bib")
# the other two loaded fine

###

##### Converting bradburyg and bradburyw to a dataframe #####

bradburyg <- convert2df(bradburyg, dbsource = "isi", format = "bibtex")
bradburyw <- convert2df(bradburyw, dbsource = "isi", format = "bibtex")

# now to merge the two dataframes

# compare column names
colnames(bradburyg)
colnames(bradburyw)
# they are mismatched so we will have to select specific columns before merging:
#bradburyg:
bradburygm <- select(bradburyg, c("AU", "TI", "SO", "DT", "PU", "PY", "DB", "TC", "CR", "C1", "AU_UN", "SR_FULL", "SR"))
#bradburyw:
bradburywm <- select(bradburyw, c("AU", "TI", "SO", "DT", "PU", "PY", "DB", "TC", "CR", "C1", "AU_UN", "SR_FULL", "SR"))

# merging:

bradbury <- rbind(bradburygm, bradburywm)
View(bradbury)
#success!

###

##### analysis of bradbury articles #####

results <- biblioAnalysis(bradbury, sep = ";")
options(width=100)
S <- summary(object = results, k = 10, pause = FALSE)

###



##### sources & citations #####

# tutorial: http://htmlpreview.github.io/?https://github.com/massimoaria/bibliometrix/master/vignettes/bibliometrix-vignette.html 

###

## Bibliometrix package:
# https://cran.r-project.org/web/packages/bibliometrix/vignettes/bibliometrix-vignette.html
# http://www.bibliometrix.org/

# Aria, M. & Cuccurullo, C. (2017) bibliometrix: An R-tool for comprehensive 
#  science mapping analysis, Journal of Informetrics, 11(4), pp 959-975, Elsevier.

###

## Publish or Perish (acquiring publications from web sources)
# Harzing, A.W. (2007) Publish or Perish, available from https://harzing.com/resources/publish-or-perish
