library(httr)
library(jsonlite)

gpt_request <- function(prompt, api_key) {
  url <- "https://api.openai.com/v1/engines/davinci-codex/completions"
  headers <- add_headers(
    "Content-Type" = "application/json",
    "Authorization" = paste("Bearer", api_key)
  )
  body <- list(prompt = prompt, max_tokens = 50, n = 1, stop = NULL)
  response <- POST(url, headers, body = toJSON(body, auto_unbox = TRUE))
  content <- content(response, as = "text", encoding = "UTF-8")
  parsed <- fromJSON(content, flatten = TRUE)

  if (http_status(response)$category == "Success") {
    return(parsed$choices[[1]]$text)
  } else {
    stop(parsed$error$message)
  }
}
