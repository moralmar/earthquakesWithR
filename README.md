
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

Data
----

The Significant Earthquake Database contains information on destructive earthquakes from 2150 B.C. to the present that meet at least one of the following criteria: Moderate damage (approximately $1 million or more), 10 or more deaths, Magnitude 7.5 or greater, Modified Mercalli Intensity X or greater, or the earthquake generated a tsunami.
Feel free to browse through the code as follows:

``` r
# To load the earth quake data and have a look:
data("NOAAearthquakes")

# the following is a spatial polygon data frame, which merely gives a nice touch to the leaflet map
data("world")
```
