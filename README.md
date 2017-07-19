
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

#### Ike Storm 2008-09-13 12:00:00

This plot is one of the results coming from the assignment ![alt text](https://raw.githubusercontent.com/moralmar/geom_hurricane/master/020_figures/hurricane_ike.png)

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
# hence, there is not much to see here
data("world")
```

Example - Timeline
------------------

Here are three simple examples, showing
- a single country without labels
- a single country with labels
- and showing multiple countries, also with lables

``` r
require(earthquakesWithR)
require(magrittr) # for piping operator
require(dplyr) # for filter/subsetting functions
require(ggplot2) # should be obvious :)
require(ggthemes) # for the theme_classic()

# Load the data and filter it accordingly to your needs
quakes <- eq_clean_data()
quakes_filtered <- quakes %>%
        filter(COUNTRY %in% c("USA") & YEAR >= 1000)

# single country without labels
ggplot() +
        geom_timeline(data = quakes_filtered, aes(x = date, y = COUNTRY, color = TOTAL_DEATHS, size = EQ_PRIMARY)) +
        theme_classic()
```

![](README-unnamed-chunk-2-1.png)

``` r
# Load the data and filter it accordingly to your needs
quakes <- eq_clean_data()
quakes_filtered <- quakes %>%
        filter(COUNTRY %in% c("PERU") & YEAR >= 1960)

# single country without labels
ggplot() +
        geom_timeline(data = quakes_filtered, aes(x = date, y = COUNTRY, color = TOTAL_DEATHS, size = EQ_PRIMARY)) +
        geom_timeline_label(data = quakes_filtered, aes(x = date,
                                                 y = COUNTRY,
                                                 magnitude = EQ_PRIMARY,
                                                 label = LOCATION_NAME,
                                                 n_max = 6)) +
        theme_classic()
```

![](README-unnamed-chunk-3-1.png)

``` r
# Load the data and filter it accordingly to your needs
quakes <- eq_clean_data()
quakes_filtered <- quakes %>%
        filter(COUNTRY %in% c("ECUADOR", "PERU", "CHILE") & YEAR >= 1000)

# single country without labels
ggplot() +
        geom_timeline(data = quakes_filtered, aes(x = date, y = COUNTRY, color = TOTAL_DEATHS, size = EQ_PRIMARY)) +
        geom_timeline_label(data = quakes_filtered, aes(x = date,
                                                 y = COUNTRY,
                                                 magnitude = EQ_PRIMARY,
                                                 label = LOCATION_NAME,
                                                 n_max = 4)) +
        theme_classic()
```

![](README-unnamed-chunk-4-1.png)

Example - Leaflet Map
---------------------

Besides the added timeline geom-functions, the package provides a few function which helps to easily create a `leaflet map`. What these functions do is shown below. Keep in mind that these are static maps, respectively print screens of the leaflet map (because the README.rm is a static file format).

``` r
# in addition to the earthquakesWithR package, we need:
require(leaflet)
#> Loading required package: leaflet
#> Warning: package 'leaflet' was built under R version 3.3.3
```
