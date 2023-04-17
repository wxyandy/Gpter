get_api_key <- function() {
  if (!exists("api_key", envir = .GlobalEnv) || is.null(.GlobalEnv$api_key)) {
    stop("API key not set. Use iniSet() to set the API key.")
  }
  return(.GlobalEnv$api_key)
}
