rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    outcomes <- read.csv("outcome-of-care-measures.csv", colClasses="character")
    states <- outcomes[, 7]
    conditions <- c( "heart attack", "heart failure","pneumonia")
    
    ## Check that state and outcome are valid
    if(! is.element(state, states)) stop("invalid state")
    if(! is.element(outcome, conditions)) stop("invalid outcome")
    
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    if(outcome == "heart attack") col <- 11
    else if(outcome == "heart failure") col <- 17
    else col <- 23
    ## coerce column to numeric
    outcomes[,col] <- as.numeric(outcomes[, col])
    ## filter table columns to make easier to read
    outcomes <- outcomes[outcomes[, 7] == state, c(2, 7, col)]
    ## filter out NAs
    outcomes <- outcomes[! is.na(outcomes[,3]),]  
    ## sort outcomes
    outcomes <- outcomes[order(outcomes[,3], outcomes[,1]),]
    
    outcomes$rank <- c(1:nrow(outcomes))
    if(num == "best") result <- outcomes[1,1]
    else if(num == "worst") result <- outcomes[nrow(outcomes),1]
    else if(num > nrow(outcomes)) result <- NA
    else result <- outcomes[num,1]
    result
}