# Write a function named 'pollutantmean' that calculates the 
# mean of a pollutant (sulfate or nitrate) across a specified 
# list of monitors. The function 'pollutantmean' takes three 
# arguments: 'directory', 'pollutant', and 'id'. Given a vector 
# monitor ID numbers, 'pollutantmean' reads that monitors' 
# particulate matter data from the directory specified in the 
# 'directory' argument and returns the mean of the pollutant 
# across all of the monitors, ignoring any missing values coded 
# as NA. A prototype of the function is as follows

pollutantmean <- function(directory, pollutant, id = 1:332) {
  all_p_levels <- vector("numeric")
  files <- list.files(directory)
  for(i in id){
    path <- file.path(directory, files[i])
    file <- read.csv(path)
    p_levels <- file[[pollutant]]
    all_p_levels <- c(all_p_levels, p_levels)
  }
  bad <- is.na(all_p_levels)
  mean(all_p_levels[!bad])
}

