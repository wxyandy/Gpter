extract_code <- function(response) {
  # This is just an example, you may need a more sophisticated approach to extract code from the response
  pattern <- "```R\\n(.*?)\\n```"
  code <- regmatches(response, regexec(pattern, response))[[1]][2]
  return(code)
}
