## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## makeCacheMatrix returns a list which basically contains the original matrix , it's inverse(if computed earlier,NULL otherwise) and functions to retrieve/set the
## original data(matrix) and it's inverse

makeCacheMatrix <- function(x = matrix()) {
  inv = NULL                  ##Inverse
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
## This function calculates the inverse of the special "matrix"(i.e. a list) created by the abovementioned function , but it first checks if the inverse has already been 
## calculated and proceeds with calculating the inverse only  if it hasn't else it return the cached value

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        ##The previous comment is a bit confusing , insn't x a list and not a matrix ??
  inv <- x$getinv()
  if(!is.null(inv)){
    message("returning cached inverse")
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat , ...)
  x$setinv(inv)
  inv
}
