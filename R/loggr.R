loggr <- function(.,
                  ...,
                  flags = NULL,
                  level = 0,
                  timestamp = TRUE){

  if(level >= level()){

    opt = ""
    if(timestamp){
      opt = paste0("[", date(), "]")
    }

    # if no flags provided, use defaults
    if(is.null(flags)){
      flags = flags()
    }

    if(!is.null(flags)){
      paste_bracket = function(...) paste(..., sep="] [")

      flag_string = do.call(paste_bracket, as.list(flags))
      flag_string = paste0("[", flag_string, "]")

      opt = if(opt != ""){
        paste(opt, flag_string)
      } else flag_string
    }

    message = list(...)
    if(length(message) > 0){
      message = do.call(paste, message)
      opt = if(opt != ""){
        paste(opt, message)
      } else message
    }

    if(opt != ""){
      opt = paste0(opt, "\n")
      cat(opt, file=conn_())
    } else warn("No message to log")
  }

  .
}
