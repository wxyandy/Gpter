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
iniSet <- function(api_key) {
  gpter_config$api_key <<- api_key
  cat("API key set successfully.\n")
  invisible(NULL)
}
