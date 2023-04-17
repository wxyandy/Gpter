test_that("gpt_request returns an error when the API key is not set", {
  # Clear the API key from the config
  gpter_config$api_key <- NULL

  # Call the gpt_request function and expect an error
  prompt <- "Write a simple function in R to calculate the square of a number."
  expect_error(gpt_request(prompt), "API key not set. Use iniSet\\(\\) to set the API key.")
})
