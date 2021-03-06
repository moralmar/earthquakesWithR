% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/eq_map.R
\name{eq_map}
\alias{eq_map}
\title{Visualization of Earth Quakes}
\usage{
eq_map(data_filtered, annot_col = "date")
}
\arguments{
\item{data_filtered}{A dataframe}

\item{annot_col}{Which column shall be displayed in the pop-up}
}
\value{
this function gives back a leaflet map. It includes various features.
}
\description{
\code{eq_map} creates a Leaflet map, adds a polygon according to the chosen
country and adds the earthquakes as points (size according to magnitude)
}
\examples{
require(magrittr)
data("NOAAearthquakes")

map_ex <- NOAAearthquakes \%>\%
dplyr::filter(COUNTRY == "MEXICO" & lubridate::year(date) >= 2000) \%>\%
eq_map(annot_col = "date")
map_ex

}
