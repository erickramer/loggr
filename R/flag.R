#' Remove \code{loggr} flags
#'
#' Remove any currently existing flags for \code{\link{loggr}}
#'
#' @examples
#'
#' loggr_flags("flag1", "flag2")
#' loggr_flags()
#'
#' remove_loggr_flags()
#' loggr_flags()
#'
#' @seealso \code{\link{loggr_flags}}

remove_loggr_flags <- function(){
  options(loggr.flags=NULL)
}

#' Get and set global flags for \code{loggr}
#'
#' Get or set a vector of flags used for all \code{\link{logger}} calls.
#' Call with arguments to set flags. Call without arguments to retrive current flags
#'
#' @params ... Flags to set for \code{\link{loggr}}
#'
#' @seealso \code{\link{loggr}}, \code{\link{remove_loggr_flags}}
#'
#' @examples
#'
#' loggr_flags("flag1", "flag2")
#'
#' rnorm(10) %>%
#'  loggr("Message with flags")
#'
#' loggr_flags()
#'
#'@export

loggr_flags <- function(...){
  args = list(...)

  if(length(args) != 0){
    args = as.character(unlist(args))
    options(loggr.flags=args)
  } else getOption("loggr.flags")
}
