.onLoad <- function(...){
  options(loggr.connection = "",
          loggr.flags = NULL,
          loggr.level = 0)
}

.Last <- function(...){
  if(is_log_open()) close_log()
}
