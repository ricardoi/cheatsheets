#!/bin/bash

## This is a wrapper example
## Running sequential scripts

# Preprocessing
cmd="sh preprocessing.sh" 
echo $cmd
eval $cmd
date

# Analysis 
cmd="Rscript --vanilla Ranalysis.R"
echo $cmd
eval $cmd
date

# Postprocessing
cmd="sh post-analysis.sh"
echo $cmd
eval $cmd
date

echo "wrapper completed"
date
