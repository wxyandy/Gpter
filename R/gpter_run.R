gpter_run <- function(query, api_key) {
  response <- gpt_request(query, api_key)
  code <- extract_code(response)

  if (nchar(code) > 0) {
    cat("Running the following code:\n")
    cat(code, "\n")
    result <- run_code(code)
    return(result)
  } else {
    cat("No code found in the response.\n")
    return(NULL)
  }
}
