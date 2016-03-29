## makeCacheMatrix makes a special "matrix" object that's
## a list that gets/sets the value of the matrix,
## and gets/sets the value of the inverse.
makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    set <- function(y) {
        x <<- y
        inverse <<- NULL
    }
    get <- function() x
    setinv <- function(inv) inverse <<- inv
    getinv <- function() inverse
    list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}

## cacheSolve calculates the inverse of a 
## matrix created with makeCacheMatrix
## (if it hasn't been created already)
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inverse <- x$getinv()
    if(!is.null(inverse)) {
        message("getting cached data")
        return(inverse)
    }
    matrix <- x$get()
    inverse <- solve(matrix, ...)
    x$setinv(inverse)
    inverse
}