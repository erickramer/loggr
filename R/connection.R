#' Open a log file for loggr
#'
#' This opens a log file for \code{\link{loggr}}. The output for all
#' calls to \code{\link{loggr}} will be redirected to this file. The user can
#' either specify a file name or pass a connection to a file.
#'
#' @param description A character or a connection.
#' @param open The mode for opening the connect. See \code{\link{file}}
#' @param ... Additional parameters passed to \code{\link{file}}
#'
#' @examples
#'
#' open_log("mylog.txt")
#'
#' f = gzfile("mylog.gz", mode="wb")
#' open_log(f)
#'
#' @export
#'
#' @seealso \code{\link{close_log}}

open_log <- function(description = "", open="a", ...){
  # close previous connection
  if(is_log_open()) close_log()

  # open new connection
  connection = if(is.character(description)){
    file(description, open = open, ...)
  } else if(any(class(description) == "connection")){
    description
  } else stop("open_log must receive a character or a connection")

  conn(connection)
}

#' Close a log file for loggr
#'
#' This closes a log file for \code{\link{loggr}}.
#'
#' @examples
#'
#' open_log("mylog.txt")
#' close_log()
#'
#' @export
#'
#' @seealso \code{\link{open_log}}

close_log <- function(){

  if(is_log_open()){
    close(conn())
  } else warning("No log file open")

  options("loggr.connection"="")
}

conn <- function(connection=NULL){
  if(any(class(connection) == "connection")){
    options(loggr.connection=connection)
  } else getOption("loggr.connection")
}

is_log_open <- function(){
  any(class(conn()) == "connection")
}
