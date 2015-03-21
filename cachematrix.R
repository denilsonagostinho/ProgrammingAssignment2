## Put comments here that give an overall description of what your
## functions do

## (EN-US) This function creates a special "matrix" object that can cache its inverse.
## (PT-BR): Esta funcao cria um objeto matriz especial que pode armazenar em cache seu inverso.

makeCacheMatrix <- function(matriz = matrix()) {
	#creating new matrix to cache the inverse
	inverso <- NULL

	#creating function to set the matrix
	definir <- function(outraMatriz) {
		matriz <<- outraMatriz
		indice <<- NULL
	}

	# creating function to get the matrix
	obter <- function() matriz

	#creating function to set the inverse
	definirInvertido <- function(invertido) inverso <<- invertido

	#creating function to get the inverse
	obterInvertido <- function() inverso

	#returing a list of functions to set and get the matrix and set and get the inverse
	list(definir = definir, obter = obter, definirInvertido = definirInvertido, obterInvertido = obterInvertido)

}



## (EN-US) This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## (PT-BR) Esta funcao calcula o inverso da matriz especial retornada pela funcao makeCacheMatrix acima.

cacheSolve <- function(par1, ...) {
	#getting the inverse
	inverso <- par1$obterInvertido()

	#checking if inverse is already calculated, returning it if so
	if (!is.null(inverso)) {
		return(inverso)
	}

	#calculating the inverse, and returing it after that
	dado <- par1$obter()
	inverso <- solve(dado)
	par1$definirInvertido(inverso)
	inverso
}
