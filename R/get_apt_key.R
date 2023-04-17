get_api_key <- function() {
  if (!exists("api_key", envir = gpter_config)) {
    stop("API key not set. Use iniSet() to set the API key.")
  }
  return(gpter_config$api_key)
}
