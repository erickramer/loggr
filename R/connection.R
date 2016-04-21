open_log <- function(description = "", open="a", ...){
  # close previous connection
  if(is_log_open()) close_log()

  # open new connection
  conn = if(is.character(description)){
    file(description, open = open, ...)
  } else if(any(class(description) == "connection")){
    # add a line to make sure description is open
    description
  } else stop("open_log must receive a character or a connection to a file")

  conn_(conn)
}

close_log <- function(){

  if(is_log_open()){
    close(conn_())
  } else{
    warning("No log file open")
  }

  options("loggr.connection"="")
}

conn_ <- function(conn=NULL){
  if(any(class(conn) == "connection")){
    options(loggr.connection=conn)
  } else getOption("loggr.connection")
}

is_log_open <- function(){
  any(class(conn_()) == "connection")
}
