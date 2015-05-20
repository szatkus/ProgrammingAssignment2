## Put comments here that give an overall description of what your
## functions do

## Simple matrix cache.
## set.matrix/get.matrix - read and write cache index.
## set.cache/get.cache - read and write cache value.

makeCacheMatrix <- function(x = matrix()) {
        cache <- NULL
        set.matrix <- function(y) {
                x <<- y
                cache <<- NULL
        }
        get.matrix <- function() {
                x
        }
        set.cache <- function(c) {
                cache <<- c
        }
        get.cache <- function() {
                cache
        }
        list(set.matrix = set.matrix, get.matrix = get.matrix,
             set.cache = set.cache, get.cache = get.cache)
}


## Takes excactly same arguments as solve, except the first arguments which should be a matrix cache.

cacheSolve <- function(x, ...) {
        m <- x$get.cache()
        if(!is.null(m)) {
                return(m)
        }
        data <- x$get.matrix()
        m <- solve(data, ...)
        x$set.cache(m)
        m
}
