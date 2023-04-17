library(httr)
library(jsonlite)

#' Send a prompt to the ChatGPT API and get a response
#'
#' @param prompt The text prompt to send to the ChatGPT API
#' @return A character string containing the generated response
#' @export
#'
#' @examples
#' \dontrun{
#'   iniSet("your_api_key")
#'   prompt <- "What is the capital of France?"
#'   response <- gpt_request(prompt)
#'   cat(response)
#' }
gpt_request <- function(prompt) {
  # Get the API key from the config
  api_key <- get_api_key()

  # Define the API endpoint and parameters
  url <- "https://api.openai.com/v1/engines/davinci-codex/completions"
  headers <- add_headers(
    "Content-Type" = "application/json",
    "Authorization" = paste("Bearer", api_key)
  )

  # Build the JSON payload
  payload <- toJSON(
    list(
      prompt = prompt,
      max_tokens = 100,
      n = 1,
      stop = NULL,
      temperature = 0.7
    ),
    auto_unbox = TRUE
  )

  # Send the request to the ChatGPT API
  response <- POST(url, headers, body = payload)

  # Check for errors in the response
  if (http_error(response)) {
    stop("An error occurred while communicating with the ChatGPT API:\n",
         content(response, as = "text", encoding = "UTF-8"))
  }

  # Parse the response JSON and extract the generated text
  response_content <- content(response, as = "parsed", encoding = "UTF-8")
  generated_text <- response_content$choices[[1]]$text

  return(generated_text)
}
