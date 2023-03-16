#'@title: Your analysis
#'@author: Your Name
#'@description: This script generates very cools analysis

#-- Setting working directory
setwd("git/folder/")

#-- loading libraries
library(tidyverse)
library(purrr)

#-- loading data
df <- read.csv("data/data.csv", sep = "\t", header = F)
dim(df)
metadata <- read.csv("data/metadata.txt")
metadata

#-- parsing files
fromto <- df %>%
         select(column1, column2, columen3)
         
         
#-- creating network
g <- graph_from_to(fromto, directed = false)

#-- ploting network
pdf("/figures")
plot(g)
dev.off()


save.csv(fromto, "from_to_table.csv")
