################ ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################
##                                                                            ##
##                      MSDR - Capstone Project NOAA                          ##
##                         Loading/Cleaning the Data                          ##
##                                                                            ##
##                              Marco R. Morales                              ##
##                                                                            ##
##                                                                            ##
## created: 09.07.2017                                last update: 16.07.2017 ##
################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################



## function: handle_negative_dates ---------------------------------------------
##     
##   
# function handle_negative_dates
handle_negative_dates <- function(y, m, d) {
        
        origin_date <- as.numeric(as.Date("0 1 1", "%Y %m %d", origin = "1970-01-01"))    
        # > origin_date
        # [1] -719528
        mirror_date <- as.Date(paste(-y-1, 13-m, abs(27-d)+1, sep = '-'), '%Y-%m-%d', origin = '1970-01-01') # -y -1 (?)  # abs(27-d)+1
        # example with year: y = -2000
        # > mirror_date
        # [1] "2000-01-01"
        mirror_date_num <- as.numeric(mirror_date)
        # > mirror_date_num
        # [1] 10957
        delta <- origin_date - mirror_date_num
        # > delta
        # [1] -730485
        # delta: how many days between year 0 and mirror_date
        # what's left: add days from: year 0 to 1970-01-01
        days_gone_by <- delta + origin_date 
        # remember: delta is negative  //  origin_date is negative
        date_new <- base::as.Date(days_gone_by, origin = "1970-01-01")
        # > date_new
        # [1] "-2000-01-01"
        # > class(date_new)
        # [1] "Date"
        base::return(date_new)
        
} # END function handle_negative_dates



## function: handle_positive_dates ---------------------------------------------
##     
##   
# function handle_positive_dates
handle_positive_dates <- function(y, m, d) {
        date_paste <- base::paste0(y, "-", m, "-", d)
        date_new <- base::as.Date(date_paste, format = "%Y-%m-%d")
        
        base::return(date_new)
} # END function handle_positive_dates




## function: eq_location_clean() ---------------------------------------------
##     
##   
# function eq_location_clean()
eq_location_clean <- function(data){
        # how does it look like?
                # > head(data$LOCATION_NAME)
                # [1] "JORDAN:  BAB-A-DARAA,AL-KARAK"     "TURKMENISTAN:  W"                 
                # [3] "SYRIA:  UGARIT"                    "GREECE:  THERA ISLAND (SANTORINI)"
                # [5] "ISRAEL:  ARIHA (JERICHO)"          "ITALY:  LACUS CIMINI" 
        data <- data %>%
                dplyr::mutate(
                LOCATION_NAME = purrr::map2_chr(COUNTRY, LOCATION_NAME, 
                                                # and now: what to do with these two variables?
                                                # let's define a function:
                                                function(COUNTRY, LOCATION_NAME) {
                                                        base::gsub(paste0(COUNTRY, ":"), 
                                                             "", 
                                                             LOCATION_NAME)
                                                }), 
                # we still have some white spaces left:
                LOCATION_NAME = stringr::str_trim(LOCATION_NAME), 
                
                # and as required by the assignment: 
                LOCATION_NAME = stringr::str_to_title(LOCATION_NAME)
                )
  
} # END eq_location_clean()





## function: eq_clean_data() ---------------------------------------------
##     
##   
# function eq_clean_data()
# eq_clean_data()
# After downloading and reading in the dataset, the overall task for this module is 
# to write a function named eq_clean_data()that takes raw NOAA data frame and returns 
# a clean data frame. The clean data frame should have the following:

# The clean data frame should have the following:
        
# 1.  A date column created by uniting the year, month, day and converting it to the Date class
# 2.  LATITUDE and LONGITUDE columns converted to numeric class
# 3.  In addition, write a function eq_location_clean() that cleans the LOCATION_NAME column by 
#     stripping out the country name (including the colon) and converts names to title case (as opposed 
#     to all caps). This will be needed later for annotating visualizations. This function should be applied 
#     to the raw data to produce a cleaned up version of the LOCATION_NAME column. 

eq_clean_data <- function() {

        data <- read_tsv("./010_data/results") %>%
                
                # replacing NA's in MONTH
                #     This is not that good
                #     I am chaing the characteristic of "when" it happend
                #     Might need to be changed later (?)
                #     before:
                #         > summary(data$MONTH)
                #       Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
                #       1.000   4.000   7.000   6.503   9.000  12.000     405 
                dplyr::mutate(MONTH = base::replace(MONTH, base::which(base::is.na(MONTH)), 1)) %>%
                
                # replacing NA's in DAY
                #     before:
                #         > summary(data$DAY)
                #       Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
                #       1.00    8.00   16.00   15.75   23.00   31.00     556 
                dplyr::mutate(DAY = base::replace(DAY, base::which(base::is.na(DAY)), 1)) %>%
                dplyr::mutate(date = base::ifelse(YEAR < 0, 
                                                  handle_negative_dates(YEAR, MONTH, DAY), 
                                                  handle_positive_dates(YEAR, MONTH, DAY)  
                )) %>%
                dplyr::mutate(date = base::as.Date(date, origin = "1970-01-01")) %>%
                dplyr::mutate(LATITUDE  = base::as.numeric(LATITUDE)) %>%
                dplyr::mutate(LONGITUDE = base::as.numeric(LONGITUDE))
        
        
        # clean location via eq_location_clean
        data <- eq_location_clean(data)
        
} # END function eq_clean_data()





