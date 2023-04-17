gpt_request <- function(prompt, stop_sequence = NULL) {
  # Get the API key
  api_key <- get_api_key()

  # Set the API endpoint and model
  api_url <- "https://api.openai.com/v1/engines/text-davinci-002/completions"

  # Set the request headers
  headers <- httr::add_headers(
    "Content-Type" = "application/json",
    "Authorization" = paste("Bearer", api_key)
  )

  # Add a prefix to the prompt
  code_prompt <- paste("Write R code to ", prompt)

  # Set the request body
  request_body <- list(
    prompt = code_prompt,
    max_tokens = 50,
    n = 1,
    temperature = 1
  )

  # Add the 'stop' parameter only if it's not NULL
  if (!is.null(stop_sequence)) {
    request_body$stop <- stop_sequence
  }

  body <- jsonlite::toJSON(request_body, auto_unbox = TRUE)

  # Make the API request
  response <- httr::POST(api_url, headers, body = body)

  # Check if the request was successful
  if (httr::http_status(response)$category != "Success") {
    stop(
      "An error occurred while communicating with the ChatGPT API:\n",
      httr::content(response, "text", encoding = "UTF-8")
    )
  }

  # Extract and return the generated text
  content <- httr::content(response, "parsed")
  return(content$choices[[1]]$text)
}
