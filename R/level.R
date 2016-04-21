set_loggr_level <- function(level){
  level = as.integer(level)
  level(level)
}

get_loggr_level <- function() level()

level <- function(level=NULL){
  if(!is.null(level)){
    options("loggr.level"=level)
  } else getOption("loggr.level")
}
