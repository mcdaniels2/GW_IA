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
gcclist <- read.csv("/Users/Amber/Documents/GitHub/GW_IA/originaldata/DNR_GW_AllProjects19852018.csv", 
                    header=TRUE, na.strings="")
investigatorstatus <- read.csv("/Users/Amber/Documents/GitHub/GW_IA/originaldata/investigators_complete_122019.csv", 
                               header=TRUE, na.strings="") # investigators_complete_122019 is the non-duplicate list ofinvestigators with their search statuses
View(investigatorstatus)

###

##### load bib files (12/20/19) #####

lapply(files, readFiles)

bibs <- readFiles("/Users/Amber/Documents/GitHub/GW_IA/authorsgs/babiarzc.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/bannermanr.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/barmanm.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/bartschl.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/bowmang.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/bowserc.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/boyle.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/bradburyk_prelim.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/bravoh.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/bryek.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/cardiffm.bib",  
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/clancyk.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/clarya.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/diebelm.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/dodsons.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/dunningc.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/eggerts.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/evangelistaf.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/evansc.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/gaffields.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/geissingerp.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/gindervogelm.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/gotkowitzm.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/grotek.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/gulecs.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/hedmanc.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/hemmingj.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/hooyert.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/huntr.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/johnsont.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/karthikeyank.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/kleinheinzg.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/kluenders.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/knobelochl.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/kucharikc.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/kussoww.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/lacossec.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/larsonr.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/lathropr.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/lepaind.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/leporeb.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/lij.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/lil.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/liz.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/loheides.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/luczajj.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/macwilliamsm.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/maleckik.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/markhaml.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/masarikk.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/mcdonaldc.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/mcginleyp.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/mcintirem.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/mcintyrep.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/mcmahonk.bib",
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/nitkaa.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/normanj.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/oconnork.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/olstadtj.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/pageg.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/parentl.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/parsenm.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/pedersenj.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/rabinowitzh.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/remucalc.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/roott.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/ruarkm.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/schauerj.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/schreiberm.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/scottj.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/shaferm.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/shethn.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/skalbeckj.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/sorsak.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/stelzerr.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/steuerj.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/stoorr.bib",
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/swansons.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/tangc.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/underwoodc.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/wuc.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/xus.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/zhangh.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/zornm.bib", 
                  "/Users/Amber/Documents/GitHub/GW_IA/authorsgs/zwolinskim.bib")
View(bibs)

bibsd <- convert2df(bibs, dbsource = "isi", format = "bibtex")
head(bibsd)
colnames(bibsd)

#AU		Authors
#TI		Document Title
#SO		Publication Name (or Source)
#JI		ISO Source Abbreviation
#DT		Document Type
#DE		Authors' Keywords
#ID		Keywords associated by SCOPUS or WoS database
#AB		Abstract
#C1		Author Address
#RP		Reprint Address
#CR		Cited References
#TC		Times Cited
#PY		Year
#SC		Subject Category
#UT		Unique Article Identifier
#DB		Database

summary(bibsd)

###

##### analysis of "bibs" articles #####

results <- biblioAnalysis(bibsd, sep = ";")
options(width=100)
S <- summary(object = results, k = 10, pause = FALSE)

plot(x = results, k = 10, pause = FALSE)


###

##### OLD - load bib files #####

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
