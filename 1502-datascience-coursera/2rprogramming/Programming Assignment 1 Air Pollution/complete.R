# Write a function that reads a directory full of files and 
# reports the number of completely observed cases in each data 
# file. The function should return a data frame where the first 
# column is the name of the file and the second column is the 
# number of complete cases. A prototype of this function follows

complete <- function(directory, id = 1:332) {
  nobs <- vector("numeric")
  files <- list.files(directory)
  for(i in id){
    path <- file.path(directory, files[i])
    file <- read.csv(path)
    nobs <- c(nobs, sum(complete.cases(file)))
  }
  df <- data.frame(id, nobs)
  df
}
complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)
