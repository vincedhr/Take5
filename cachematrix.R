## Put comments here that give an overall description of what your
## functions do

##The code below will cache the inverse of a matrix

## Write a short comment describing this function:

##this first function creates an R object that can store a
##matrix and its inverse.  
##when the function is put in an object (see comments at end) 
##the object has a copy of this function's environment.
##This copy is retained even after the function runs.
##The <<- superoperator in line 26 assigns the inverse value on
##the right side of the operator to an object in the parent
##environment named on the left side.
##The get function grabs x from the parent environment, and
##getinv also identifies the symbol from the parent environ.

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) { 
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setinv <- function(solve) i <<- solve
    getinv <- function() i
    list(set = set, get = get,
         setinv = setinv, 
         getinv = getinv)
}


## Write a short comment describing this function
 
##the second function is necessary to compute the inverse of the
##matrix generated by the first function
##Line 42 retrieves the inverse from the object passed in as an 
##argument. Nex line checks if null or not; if not, then uses cached value.

cacheSolve <- function(x, ...) {
    i <- x$getinv()
    if(!is.null(i)) { 
        message("getting cached data")
        return(i)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$setinv(i)
    i
        ## Return a matrix that is the inverse of 'x'
}
##this works when you create an object such as 
## mymatrixobject <- makeCacheMatrix (m1) (I used
## the m1 example from he forum post).  Then do 
## cacheSolve(mymatrixobject)