##                  Coursera Data Science:  R Programming
##                       Assignment 2

##                  Weston Carloss           Due 2-5-2017



## The first function generates a list of functions which will be used on a 
## user-defined matrix.  The second function will calculate the inverse of this 
## matrix.  Before calculating, it will check for the answer in a cache.  If the 
## answer is found in cache, it will be returned which avoids an unecessary
## calculation.  If the answer isn't cached, it will calculated, and then 
## returned.


## The first function takes in a matrix and returns functions to do the following:
## set a matrix
## get the matrix
## set the inverse of the matrix
## get the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
     inverseM <- NULL
     set <- function(y) {
          x <<- y
          inverseM <<- NULL
     }
     get <- function() x
     setInverse <- function(inverseTemp) inverseM <<- inverseTemp
     getInverse <- function() inverseM
     list(set = set, get = get,
          setInverse = setInverse,
          getInverse = getInverse)
}

## The second function takes in a list generated by makeCacheMatrix
## It checks to see the if the cache contains the answer which is indicated by
## a value for cache 'inverseM' other than NULL.  If this is true, a message 
## will be displayed telling the user that the answer was retrieved from cache,
## and the answer will be displayed.

## If the answer isn't found in cache, it will be calculated, and the answer 
## will be displayed.

cacheSolve <- function(x, ...) {
     inverseM <- x$getInverse()
     if(!is.null(inverseM)) {
          message("getting cached calculation")
          return(inverseM)
     }
     the_matrix <- x$get()
     inverseM <- solve(the_matrix, ...)
     x$setInverse(inverseM)
     inverseM
}