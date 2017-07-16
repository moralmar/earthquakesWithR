################ ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ ##################
##                                                                            ##
##                      MSDR - Capstone Project NOAA                          ##
##                           geom_timeline_label()                            ##
##                                                                            ##
##                              Marco R. Morales                              ##
##                                                                            ##
##                                                                            ##
## created: 15.07.2017                                last update: 15.07.2017 ##
################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################



# To start with a geom, we start with defining the following functions:
#     1) geom_xxxxx                     function defining the layer
#     2) geom_xxxxx_proto_class         creates proto class, corresponding to the geom
#                                       the "working horse" function is inside here
#     3) draw_panel_function            this is the "working horse
#                                       either keep it in the geom_xxxxx_proto_class, or
#                                       outsource it (like I do, here)





## function: geom_timeline_label (building the layer)  --------------------------------
##     quite generic
##     builds the layer based on the geom specifications
##     geom specification is defined in the next function
##     next function is: 

#' Function which builts the layer for the ggplot
#' 
#' @importFrom ggplot2 layer
#' @param mapping 
#' @param data
#' @param stat
#' @param position
#' @param na.rm
#' @param show.legend
#' @param inherit.aes
#' 
#' @export
geom_timeline_label <- function(mapping = NULL, data = NULL, stat = "identity",
                                position = "identity", na.rm = FALSE, 
                                show.legend = NA, inherit.aes = TRUE, ...) {
        ggplot2::layer(
                geom = geom_timeline_label_proto_class, # this here is important
                mapping = mapping,  
                data = data, stat = stat, position = position, 
                show.legend = show.legend, inherit.aes = inherit.aes,
                params = list(na.rm = na.rm, ...)
        ) # END layer
} # END geom_timeline_label function







## function: draw_panel_function  ------------------------------------------------
##     function within ggproto
##     I outsourced due to its length & it looks nicer

#' Outsourced function which builts the plot
#' 
#' @importFrom ggplot2 ggproto
#' @importFrom grid pointsGrob gpar
#' @param data 
#' @param panel_scales
#' @param coord
#' 
#' @export
draw_panel_function_label <- function(data, panel_scales, coord) {
        
        ## Transform the data first
        ##     see book chapter 4.7.2
        ##     (this is rather generic)
        coords <- coord$transform(data, panel_scales)
        #     is coords needed? not sure. 
        #     I have to use "data", or else, the coordinates are not correct
        
        
        # simplicity:
        n_max <- coords$n_max[1]

        # n_max:
        #     print(n_max)
        #     in every entry, we have a "n_max"
        #     so n_max is a p x 1 vector (data: p observations)
        #     just take the first element
        
        # data
        #     we have in data the full data frame
        #     let's go down to n_max data points
        data <- data %>%
                dplyr::group_by(group) %>% # group corresponds to the COUNTRY-groups
                dplyr::top_n(n_max, magnitude)
        # not needed
        # coords <- coords %>%
        #         dplyr::group_by(group) %>%
        #         dplyr::top_n(n_max, magnitude)
        
        # the data frame "data" has the data/coords/points I can work with:
        cat("==================================== data (DF) =================================\n")
        cat("=================================== head & tail ================================\n")
        cat("================================================================================ \n\n")
        print(head(data))
        cat("...\n")
        cat("...\n")
        cat("...\n")
        print(tail(data))
        cat("=================================================================================== \n\n")

        
        # vertical line
        data$xend <- data$x
        data$yend <- data$y + 0.08
        gg_vertical <- ggplot2::GeomSegment$draw_panel(data, panel_scales, coord)
        
        data$fill <- "black"
        data$stroke <- 1.6 # point size
        gg_point <- ggplot2::GeomPoint$draw_panel(data, panel_scales, coord)
        
        # text
        data$y <- data$yend + 0.01
        data$angle <- 30
        data$fontface <- 11 # fonts
        data$lineheight <- 1
        data$hjust <- "left"
        data$vjust <- "bottom"
        data$family <- "sans"
        data$size <- 4.5
        # data$color <- "red"
        gg_text <- ggplot2::GeomText$draw_panel(data, panel_scales, coord)
        
        ggplot2:::ggname("geom_timeline_label", grid::grobTree(gg_vertical, gg_text, gg_point))
        
} # END draw_panel_function_label







## function: geom_timeline_label_proto_class ---------------------------------------------
##     ggproto() creates new class corresponding to new geom (geom_timeline_label)
##     Chapter 4.7.1 in the book: building a geoms
##   

#' Function creates the new geom (geom_timeline_label)
#' draw_panel_function is outsourced...looks nicer
#' 
#' @param required_aes necessary aes inputs for the geom
#' @param default_aes default values
#' @param draw_key function to draw the legend with the associated geom
#' @param draw_panel where the magic is happening
#' 
#' @export
geom_timeline_label_proto_class <- ggplot2::ggproto("geom_timeline_label_proto_class", ggplot2::Geom, 
                                              
                                              # required_aes = <a character vector of required aesthetics>,
                                              # default_aes = aes(<default values for certain aesthetics>),
                                              # draw_key = <a function used to draw the key in the legend>,
                                              # draw_panel = function(data, panel_scales, coord) {
                                              #         ## Function that returns a grid grob that will 
                                              #         ## be plotted (this is where the real work occurs)
                                              # }
                                              
                                              required_aes = c("x", "label", "magnitude"),
                                              default_aes = ggplot2::aes(y = 0,
                                                                         n_max = 3,
                                                                         colour = "grey3", 
                                                                         alpha = NA, 
                                                                         shape = 19,
                                                                         linetype = 1, 
                                                                         size = 0.3
                                              ),
                                              draw_key = ggplot2::draw_key_point, 
                                              
                                              ## function: draw_panel_function
                                              ##     is outsourced
                                              ##     due to its length & looks nicer
                                              ##     (!!) draw_panel only takes one colour
                                              ##     (!!) draw_group takes all colours (same shape)
                                              ##          (I used draw_group in the geom_hurricane)
                                              draw_panel = draw_panel_function_label
) # END geom_timeline_label_class ggproto

