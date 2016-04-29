#' Returns structure of an R object
#'
#' This is a version of str that returns the structure of the R object as a character
#' rather than printing the structure to the terminal
#'
#' @param x An R object
#' @param ... Additional arguments passed to \code{\link{utils::str}}
#' @export

str <- function(x, ...){
  capture.output(utils::str(x, ...))
}
