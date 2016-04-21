add_loggr_flags <- function(...){
  flags(flags(), ...)
}

loggr_flags <- function(...){
  flags(...)
}

remove_loggr_flags = function(){
  options(loggr.flags=NULL)
}

flags <- function(...){
  args = list(...)

  if(length(args) != 0){
    args = as.character(unlist(args))
    options(loggr.flags=args)
  } else getOption("loggr.flags")
}
