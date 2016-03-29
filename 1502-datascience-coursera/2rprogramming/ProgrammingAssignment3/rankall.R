rankall <- function(outcome, num = "best") {
    ## Read outcome data
    outcomes <- read.csv("outcome-of-care-measures.csv", colClasses="character")
    conditions <- c( "heart attack", "heart failure","pneumonia")
    
    ## Check that outcome is valid
    if(! is.element(outcome, conditions)) stop("invalid outcome")
    
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    if(outcome == "heart attack") col <- 11
    else if(outcome == "heart failure") col <- 17
    else col <- 23
    ## coerce column to numeric
    outcomes[,col] <- as.numeric(outcomes[, col])
    ## filter table columns to make easier to read
    outcomes <- outcomes[, c(2, 7, col)]
    
    ## filter out NAs
    outcomes <- outcomes[! is.na(outcomes[,3]),]  

    ## Split into states
    outcomes <- split(outcomes, outcomes[,2])
    
    ## set up results data frame
    results <- data.frame(hospital=character(0), state=character(0))
    
    ## For each state, print ranking 
    for(state_outcome in outcomes){ 
        # sort outcomes
        state_outcome <- state_outcome[order(state_outcome[,3], state_outcome[,1]),]
        # rank each hospital
        state_outcome$rank <- c(1:nrow(state_outcome))
        # get result
        if(num == "best") result <- state_outcome[1,1:2]
        else if(num == "worst") result <- state_outcome[nrow(state_outcome),1:2]
        else if(num > nrow(state_outcome)) result <- data.frame(Hospital.Name = NA, State = state_outcome[1,2])
        else result <- state_outcome[num,1:2]
#         print(result)
        results <- rbind (results, result)
    }
    names(results) <- c("hospital", "state")
    results
}