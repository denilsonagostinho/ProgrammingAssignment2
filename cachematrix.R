## Put comments here that give an overall description of what your
## functions do

## (EN-US) This function creates a special "matrix" object that can cache its inverse.
## (PT-BR): Esta funcao cria um objeto matriz especial que pode armazenar em cache seu inverso.

makeCacheMatrix <- function(matriz = matrix()) {
	inverso <- NULL
	definir <- function(outraMatriz){
		matriz <<- outraMatriz
		indice <<- NULL
	}
	obter <- function() matriz
	definirInvertido <- function(invertido) inverso <<- invertido
	obterInvertido <- function() inverso
	list(
		definir=definir, 
		obter=obter, 
		definirInvertido=definirInvertido,
		obterInvertido=obterInvertido
		)
	
}


## (EN-US) This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## (PT-BR) Esta funcao calcula o inverso da matriz especial retornada pela funcao makeCacheMatrix acima.

cacheSolve <- function(par1, ...) {
        inverso <- par1$obterInvertido()
        if(!is.null(inverso)){
        		return(inverso)
        }
        dado <- par1$obter()
        inverso <- solve(dado)
        par1$definirInvertido(inverso)
        inverso
}
