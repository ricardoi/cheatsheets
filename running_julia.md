## Julia

Installing 
PhyloNetworks PhyloPlots


```julia
using Pkg # to use functions that manage packages
Pkg.add("PhyloNetworks") # to download & install package PhyloNetworks
Pkg.add("PhyloPlots")
Pkg.add("RCall")      # packaage to call R from within julia
Pkg.add("CSV")        # to read from / write to text files, e.g. csv files
Pkg.add("DataFrames") # to create & manipulate data frames
Pkg.add("StatsModels")# for regression formulas
using PhyloNetworks   # may take some time: pre-compiles functions in that package
using PhyloPlots      # may take some time: there is a proble with "RCall"				      
```
 I have to change **R_HOME** tuve que cambiar el siguiente archivo a **R**
```julia
build.jl
```
This was part of the script was modified:
```julia
...
if !haskey(ENV,"R") && isdir(DepFile.Rhome) && validate_libR(DepFile.libR, false)
Rhome, libR = DepFile.Rhome, DepFile.libR
@info "Using previously configured R at $Rhome with libR in $libR."
else
Rhome =  get(ENV, "R", "")
if Rhome == "*"
# install with Conda
@info "Installing R via Conda.  To use a different R installation,"*
" set the \"R_HOME\" environment variable and re-run "*
"Pkg.build(\"RCall\")."
Conda.add_channel("r")
Conda.add("r-base")
Rhome = joinpath(Conda.LIBDIR, "R")
...
```

Voy a intentar reinstallar RCall
