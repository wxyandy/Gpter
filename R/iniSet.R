#' Set the ChatGPT API key for the package
#'
#' @param api_key Your ChatGPT API key
#' @return NULL
#' @export
#'
#' @examples
#' \dontrun{
#'   api_key <- "your_api_key"
#'   iniSet(api_key)
#' }
iniSet <- function(api_key, maxT = 150) {
  if (!is.character(api_key) || nchar(api_key) == 0) {
    stop("Invalid API key. Please provide a valid API key as a string.")
  }
  assign("api_key", api_key, envir = .GlobalEnv)
  assign("maxTok", maxT, envir = .GlobalEnv)
}
