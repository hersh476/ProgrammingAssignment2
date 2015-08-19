##Caching inverse of matrix:
##The 2 functions below will create an object 
##that can store a matrix and cache its inverse.

##The function below will create a special "matrix"
##object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
m <- NULL
  set <- function(y){
  x <<- y
  m <<- NULL
}
get <- function() x
setmatrix <- function(solve) m <<- solve
getmatrix <- function() m
list(set = set, get = get,
   setmatrix = setmatrix,
   getmatrix = getmatrix)
}

##The function below will compute the inverse of the 
##special "matrix" created bythe function above. 
##If the inverse has already been calculated,
##it will retrieve the inverse from the cache.
cacheSolve <- function(x=matrix(), ...) {
    m <- x$getmatrix()
    if(!is.null(m)){
      message("getting cached data")
      ## Return a matrix that is the inverse of 'x'
      return(m)
   }
   matrix <- x$get()
    m <-solve(matrix, ...)
    x$setmatrix(m)
    m
}
