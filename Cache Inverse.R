makeCacheMatrix <- function(x = numeric()) {
  if (ncol(x)==nrow(x) && det(x)!=0) {
    t <- NULL
    set <- function(y) {
      x <<- y
      t <<- NULL
    }
    get <- function(){
      x
    } 
    setinverse <- function(inverse){
      t <<- inverse
    } 
    getinverse <- function(){
      t
    } 
    list(set = set,get = get,setinverse = setinverse,getinverse = getinverse)
  }  
}
cacheSolve <- function(x, ...) {
  t <- x$getinverse()
  if (!is.null(t)) { 
    message("getting cached data")
    return(t)
  }
  data <- x$get()
  t <- solve(data, ...)
  x$setinverse(t)
  t
}