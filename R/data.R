#' NOAA Significant Earthquakes - RAW data
#'
#' "The Significant Earthquake Database contains information on destructive
#' earthquakes from 2150 B.C. to the present that meet at least one of the
#' following criteria: Moderate damage (approximately $1 million or more), 10 or
#' more deaths, Magnitude 7.5 or greater, Modified Mercalli Intensity X or
#' greater, or the earthquake generated a tsunami."
#'
#' @format A data frame of 5952 observations of 47 variables.  For variable
#'   definitions please see the "Event Variable Definitions" link at the url
#'   below.
#'
#' @source National Geophysical Data Center / World Data Service (NGDC/WDS):
#'   Significant Earthquake Database. National Geophysical Data Center, NOAA.
#'   doi:10.7289/V5TD9V7K
#'   \url{https://www.ngdc.noaa.gov/nndc/struts/form?t=101650&s=1&d=1}
"NOAAearthquakesRAW"


#' NOAA Significant Earthquakes - CLEANED version
#'
#' This is the cleaned version of the earth quakes data.
#'
#' @format A data frame of 5952 observations of 48 variables.  For variable
#'   definitions please see the "Event Variable Definitions" link at the url
#'   below.
#'
#' @source National Geophysical Data Center / World Data Service (NGDC/WDS):
#'   Significant Earthquake Database. National Geophysical Data Center, NOAA.
#'   doi:10.7289/V5TD9V7K
#'   \url{https://www.ngdc.noaa.gov/nndc/struts/form?t=101650&s=1&d=1}
"NOAAearthquakes"


#' World Shapefile
#'
#' Free vector and raster map data
#'
#' @format A spatial polygon data frame with 241 elements. Each element represents a
#'   polygon of a country.
#'
#' @source From the Natural Earth Data Homepage: zip file with the name:
#'     'ne_50m_admin_0_countries.zip'.
#'     \url{www.naturalearthdata.com/download/50m/cultural}
"world"
