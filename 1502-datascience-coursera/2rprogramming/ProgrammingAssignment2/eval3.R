# makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
# cacheSolve: This function computes the inverse of the special "matrix" returned by
# ....makeCacheMatrix above. If the inverse has already been calculated (and the matrix
# ...has not changed), then the cachesolve should retrieve the inverse from the cache.

# makeCacheMatrix does the following:
# 1: sets the value of the vector
# 2: gets the value of the vector
# 3: sets the value of the mean
# 4: gets the value of the mean
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) m <<- solve
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


# cacheSolve returns a matrix that is the inverse of 'x' from the cache
cacheSolve <- function(x, ...) {
    
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
}

## TEST CASES BELOW
## HIGHLIGHT FROM HERE TILL THE BOTTOM
## THEN PRESS: ctrl shift c
## or just uncomment those with only one #
## "main code" starts here
## create new object
pink <- makeCacheMatrix()

## set new object's matrix
pink$set(matrix(runif(16),4))

## test get() function if it's working
## get's the matrix of the new object
#pink$get()

## on first instance of calling cacheSolve() on the new object
## it will save the inverse (via solve()) onto the cache
## it will also return the inverse of the matrix (of the new object)
cacheSolve(pink)

## on the succeeding instances of calling cacheSolve() on the new object
## before returning the inverese of the matrix
## it will yield a message of "getting inversed matrix"
#cacheSolve(pink)

## test new matrix
#green <- makeCacheMatrix()
#green$set(matrix(runif(16),4))
#cacheSolve(green)
#cacheSolve(green)