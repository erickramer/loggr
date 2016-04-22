#' Set verbosity level of \code{loggr}
#'
#' Sets the global verbosity level of \code{\link{loggr}}. Zero is the most
#' verbose with increasing numbers indicated less verbosity
#'
#' @param level An integer. The verbosity level
#'
#' @seealso \code{\link{loggr}}
#'

loggr_level <- function(level=NULL){
  if(!is.null(level)){
    level = as.integer(level)
    options("loggr.level"=level)
  } else getOption("loggr.level")
}
