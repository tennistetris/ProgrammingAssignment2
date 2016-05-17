## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  inv = NULL
  get <- function()x
  set <- function(y){
    x<<-y
    inv <<-  NULL
  }
  getinv <- function()inv
  setinv <- function(solve) inv<<- solve
  list(get = get , set = set , getinv = getinv , setinv = setinv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        ##The previous comment is a bit confusing , insn't x a list and not a matrix ??
  inv <- x$getinv()
  if(!is.null(inv)){
    message("returning cached inverse")
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat)
  x$setinv(inv)
  inv
}
