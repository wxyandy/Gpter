#' Send a prompt to the ChatGPT API and get a response
#'
#' @param prompt The text prompt to send to the ChatGPT API
#' @param stop_sequence null value(No use)
#' @return the result of the code
#' @export
#'
#' @examples
#' \dontrun{
#'   iniSet("your_api_key")
#'   prompt <- "What is the capital of France?"
#'   gpter_run(prompt)
#' }
#'
gpter_run <- function(prompt, stop_sequence = NULL) {
  # Get the R code using the gpt_request() function
  code <- gpt_request(prompt, stop_sequence)

  # Remove leading and trailing whitespace and periods
  code <- gsub("^\\s*\\.\\s*|\\s*\\.\\s*$", "", code)

  # Print the generated code
  cat("Generated code:\n", code, "\n\n")

  # Execute the generated code
  result <- eval(parse(text = code))

  # Return the result of the executed code
  return(result)
}
