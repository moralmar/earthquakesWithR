
<!-- README.md is generated from README.Rmd. Please edit that file -->
earthquakesWithR
================

The goal of `earthquakesWithR` is to give a few handy visualization tools for the NOAA data set. It provides to the user of this package the following functions:
- **geom\_timeline()** - which is a specific geom for the `ggplot2` package
- **geom\_timeline\_label()** - which is an extension for the above geom
- **eq\_location\_clean()** - which is a helper function, cleaning the NOAA dataset
- **eq\_clean\_data()** - a function which loads and applies a few cleaning function to it
- **eq\_map()** - a function creating a `leaflet` map and visualizing the earth quakes
- **eq\_create\_label()** - is a helper function, creating a nice pop-ups in the leaflet map

Installation
------------

You can install `earthquakesWithR` from github with:

``` r
# install.packages("devtools")
devtools::install_github("moralmar/earthquakesWithR")
```

Example
-------

This is a basic example which shows you how to solve a common problem:

``` r
## basic example code
```
