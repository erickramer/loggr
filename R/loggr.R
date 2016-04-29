#' Write a log message
#'
#' A pipeable function for logging. The first argument is passed
#' through the function unchanged, allowing loggr to be used
#'
#' @param x An object.
#' @param ... Expressions to be logged.
#' @param .flags A character vector. These flags are added to the logging statement.
#' loggr_flags can be used to set this variable globally
#' @param .level A integer. Specifies the importance of log. loggr_level
#' sets the global importance level.Only statements with a level above the global level are
#' logged
#' @param .file A character string or a file connection. If NULL, statements are
#' printed to standard output connection
#' @param .timestamp A boolean. Whether to include a timestamp in the logging statement.
#'
#' @examples
#'
#' iris_filtered = iris %>%
#'  loggr("I see you have, nrow(.), "rows") %>%
#'  filter(Species == "setosa") %>%
#'  loggr("And now you have, nrow(.), "rows")
#'
#' x = rnorm(100) %>%
#'  loggr(length(.), "samples drawn", .flags=c("flag1", "flag2")) %>%
#'
#' loggr_level(5)
#'
#' y = x %>%
#'  loggr("This log isn't so important", .level = 1) %>%
#'  max %>%
#'  loggr("But maybe this one is", .level = 10)
#'
#' @export

loggr <- function(x,
                  ...,
                  .flags = NULL,
                  .level = 0,
                  .file = NULL,
                  .timestamp = TRUE){

  if(.level >= loggr_level()){

    opt = ""
    if(.timestamp){
      opt = paste0("[", Sys.time(), "]")
    }

    # add global flags
    .flags = c(loggr_flags(), .flags)

    if(!is.null(.flags)){
      paste_bracket = function(...) paste(..., sep="] [")

      flag_string = do.call(paste_bracket, as.list(.flags))
      flag_string = paste0("[", flag_string, "]")

      opt = if(opt != ""){
        paste(opt, flag_string)
      } else flag_string
    }

    # trying to deal with lists-of-list
    # not a good solution
    message = c(...) %>%
      unlist

    if(length(message) > 0){
      message = do.call(paste, as.list(message))
      opt = if(opt != ""){
        paste(opt, message)
      } else message
    }

    if(opt != ""){
      opt = paste0(opt, "\n")
      cat(opt, file=conn())
    } else warning("No message to log")
  }

  x
}

#' Write a log message
#'
#' This writes a log message without an input variable
#' @param ... Arguments passed to \code{\link{loggr}}
#' @examples
#'
#' loggr0("This is a log statement")
#'
#' @export

loggr0 <- function(...) loggr(x = NULL, ...)


#' Log the structure of an object
#'
#' @param x An R object
#' @param ... Additional arguments passed to \code{\link{loggr}}
#' @export
#'

log_str <- function(x, ...){
  x %>%
    loggr(str(.), ...)
}
