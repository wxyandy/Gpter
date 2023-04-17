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
