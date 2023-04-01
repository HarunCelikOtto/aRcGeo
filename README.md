# aRcGeo

Harun Celik 2023-04-01

<!-- badges: start -->

[![R-CMD-check](https://github.com/HarunCelikOtto/aRcGeo/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/HarunCelikOtto/aRcGeo/actions/workflows/R-CMD-check.yaml)

<!-- badges: end -->

The goal of the aRcGeo package is to offer a streamline process for initializing an `arcpy` environment in an R session using `reticulate` and `arcgisbinding`. After initializing licensing with `init_arcpy()`, all licensed `arcpy` functionality is available for use in the R session.

## Requirements

The following have to be installed and configured on the device in order for `aRcGeo` to work successfully. Trying to import the `arcpy` module without initializing licensing or setting up the right python path or conda environment will terminate the RStudio session. Ensure that the following are installed and function properly before working through `aRcGeo`.

-   [ArcGIS Pro 1.1 or later](http://pro.arcgis.com/en/pro-app/)

-   [R Statistical Computing Software, 3.5 or later](http://cran.cnr.berkeley.edu/bin/windows/base/).

-   64-bit version required for ArcGIS Pro (Note: the installer installs both by default).

-   Installation of the `arcgisbinding` package for R.

-   Clone of the arcgispro-py3 python environment.

## Installation

You can install the development version of aRcGeo from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("HarunCelikOtto/aRcGeo")
```

## Initializing Licensing and Importing `arcpy` through `init_arcpy()`

The `init_arcpy()` function takes the name of your cloned conda environment or cloned python executable path for `arcpy`. It will activate a license using `arcgisbinding::arc.check_product()` and set executable paths for `reticulate` to run python functions.

``` r
library(aRcGeo)
```

``` r
# This is using a conda environment name.
init_arcpy(conda_env = "arcgispro-py3-DeepLearning")
## 
## ── Initializing Connection ─────────────────────────────────────────────────────
## → Initializing Connection to ArcGIS.
## 
## ── Checking Conda Environment ──────────────────────────────────────────────────
## Setting Conda Environments.                            ℹ All Local Conda Environments:
## Setting Conda Environments.
## [1] "arcgispro-py3-DeepLearning" "base"                      
## [3] "r-reticulate"               "anaconda3"
##                             ✔ Using conda environment: arcgispro-py3-DeepLearning
## Setting Conda Environments.Connecting to `arcpy`. ■■■■■■                            16% | ETA:  5sConnecting to `arcpy`. ■■■■■■                            17% | ETA:  5sConnecting to `arcpy`. ■■■■■■■                           19% | ETA:  6sConnecting to `arcpy`. ■■■■■■■■                          22% | ETA:  5sConnecting to `arcpy`. ■■■■■■■■■                         25% | ETA:  5sConnecting to `arcpy`. ■■■■■■■■■                         27% | ETA:  5sConnecting to `arcpy`. ■■■■■■■■■■                        30% | ETA:  5sConnecting to `arcpy`. ■■■■■■■■■■■                       33% | ETA:  5sConnecting to `arcpy`. ■■■■■■■■■■■■                      36% | ETA:  5sConnecting to `arcpy`. ■■■■■■■■■■■■                      38% | ETA:  4sConnecting to `arcpy`. ■■■■■■■■■■■■■                     41% | ETA:  4sConnecting to `arcpy`. ■■■■■■■■■■■■■■                    44% | ETA:  4sConnecting to `arcpy`. ■■■■■■■■■■■■■■■                   46% | ETA:  4sConnecting to `arcpy`. ■■■■■■■■■■■■■■■■                  49% | ETA:  4sConnecting to `arcpy`. ■■■■■■■■■■■■■■■■■                 52% | ETA:  3sConnecting to `arcpy`. ■■■■■■■■■■■■■■■■■                 54% | ETA:  3sConnecting to `arcpy`. ■■■■■■■■■■■■■■■■■■                57% | ETA:  3sConnecting to `arcpy`. ■■■■■■■■■■■■■■■■■■■               60% | ETA:  3sConnecting to `arcpy`. ■■■■■■■■■■■■■■■■■■■■              63% | ETA:  3sConnecting to `arcpy`. ■■■■■■■■■■■■■■■■■■■■■             65% | ETA:  3sConnecting to `arcpy`. ■■■■■■■■■■■■■■■■■■■■■             68% | ETA:  2sConnecting to `arcpy`. ■■■■■■■■■■■■■■■■■■■■■■            71% | ETA:  2sConnecting to `arcpy`. ■■■■■■■■■■■■■■■■■■■■■■■           73% | ETA:  2sConnecting to `arcpy`. ■■■■■■■■■■■■■■■■■■■■■■■■          76% | ETA:  2sConnecting to `arcpy`. ■■■■■■■■■■■■■■■■■■■■■■■■■         79% | ETA:  2sConnecting to `arcpy`. ■■■■■■■■■■■■■■■■■■■■■■■■■■        82% | ETA:  1sConnecting to `arcpy`. ■■■■■■■■■■■■■■■■■■■■■■■■■■        84% | ETA:  1sConnecting to `arcpy`. ■■■■■■■■■■■■■■■■■■■■■■■■■■■       87% | ETA:  1sConnecting to `arcpy`. ■■■■■■■■■■■■■■■■■■■■■■■■■■■■      90% | ETA:  1sConnecting to `arcpy`. ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■     92% | ETA:  1sConnecting to `arcpy`. ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■     95% | ETA:  0sConnecting to `arcpy`. ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■    98% | ETA:  0s                                                                        Setting Conda Environments.                            ✔ An `arcpy` module successfully imported.
## Setting Conda Environments.                            ℹ ArcGIS Product Details:
## Setting Conda Environments.                            
## product: ArcGIS Pro (13.1.0.41833)
## license: Advanced
## version: 1.0.1.300
```

``` r
#This is if using a python.exe path is preferred.
path = "C:\\Any_Correctly_Formatted_Python_Path\\python.exe"
init_arcpy(python_env_path = path)
```

## Examples Using R Syntax to Execute `arcpy` Code

### Load `reticulate`

``` r
library(reticulate)
```

### Setting Workspace to a Geodatabase

``` r
os <- import("os")

gdatabasename = "ARcGeo_Example.gdb"
currentdir = "C:\\temp\\ArcGeo_Example"
workingenv = os$path$join(currentdir, gdatabasename)

arcpy$env$workspace = workingenv
```

```         
## Current ArcGIS workspace environment is set to 'C:\temp\ArcGeo_Example\ARcGeo_Example.gdb'
```

### Listing `arcpy` Environments

``` r
setwd(currentdir)
arcpy$ListEnvironments()
```

```         
##  [1] "autoCommit"                      "XYResolution"                   
##  [3] "processingServerUser"            "gpuId"                          
##  [5] "XYDomain"                        "processingServerPassword"       
##  [7] "scratchWorkspace"                "recycleProcessingWorkers"       
##  [9] "cartographicPartitions"          "terrainMemoryUsage"             
## [11] "MTolerance"                      "compression"                    
## [13] "coincidentPoints"                "baUseDetailedAggregation"       
## [15] "timeZone"                        "randomGenerator"                
## [17] "outputCoordinateSystem"          "rasterStatistics"               
## [19] "transferGDBAttributeProperties"  "ZDomain"                        
## [21] "cellSizeProjectionMethod"        "maintainCurveSegments"          
## [23] "transferDomains"                 "S100FeatureCatalogueFile"       
## [25] "maintainAttachments"             "resamplingMethod"               
## [27] "snapRaster"                      "cartographicCoordinateSystem"   
## [29] "baNetworkSource"                 "configKeyword"                  
## [31] "matchMultidimensionalVariable"   "outputZFlag"                    
## [33] "qualifiedFieldNames"             "tileSize"                       
## [35] "annotationTextStringFieldLength" "parallelProcessingFactor"       
## [37] "pyramid"                         "referenceScale"                 
## [39] "processingServer"                "extent"                         
## [41] "unionDimension"                  "XYTolerance"                    
## [43] "daylightSaving"                  "tinSaveVersion"                 
## [45] "nodata"                          "MDomain"                        
## [47] "cellSize"                        "outputZValue"                   
## [49] "outputMFlag"                     "cellAlignment"                  
## [51] "geographicTransformations"       "ZResolution"                    
## [53] "mask"                            "processorType"                  
## [55] "maintainSpatialIndex"            "preserveGlobalIds"              
## [57] "workspace"                       "retryOnFailures"                
## [59] "MResolution"                     "baDataSource"                   
## [61] "ZTolerance"                      "scratchGDB"                     
## [63] "scratchFolder"                   "packageWorkspace"               
## [65] "scriptWorkspace"                 "addOutputsToMap"                
## [67] "buildStatsAndRATForTempRaster"   "autoCancelling"                 
## [69] "isCancelled"                     "overwriteOutput"
```

### Checking Out Extensions

``` r
sprintf("Spatial extension is: %s", arcpy$CheckOutExtension("Spatial"))
```

```         
## [1] "Spatial extension is: CheckedOut"
```

``` r
sprintf("Indoors extension is: %s", arcpy$CheckOutExtension("Indoors"))
```

```         
## [1] "Indoors extension is: NotLicensed"
```

### Checking out Help Documentation

``` r
py_help(arcpy$AcceptConnections)

## This will output a text file with documentation for Python Objects
```
