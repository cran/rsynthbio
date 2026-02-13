## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE # Set to FALSE since API calls require credentials
)

## ----installation, eval=FALSE-------------------------------------------------
# install.packages("rsynthbio")

## ----github-installation, eval=FALSE------------------------------------------
# if (!("remotes" %in% installed.packages())) {
#   install.packages("remotes")
# }
# remotes::install_github("synthesizebio/rsynthbio")

## -----------------------------------------------------------------------------
# library(rsynthbio)

## ----auth-secure, eval=FALSE--------------------------------------------------
# # Securely prompt for and store your API token
# # The token will not be visible in the console
# set_synthesize_token()
# 
# # You can also store the token in your system keyring for persistence
# # across R sessions (requires the 'keyring' package)
# set_synthesize_token(use_keyring = TRUE)

## ----eval=FALSE---------------------------------------------------------------
# # In future sessions, load the stored token
# load_synthesize_token_from_keyring()
# 
# # Check if a token is already set
# has_synthesize_token()

## ----eval=FALSE---------------------------------------------------------------
# set_synthesize_token(token = "your-token-here")

## ----models-------------------------------------------------------------------
# # Check available models
# list_models()

## ----query, eval=FALSE--------------------------------------------------------
# # Get an example query structure
# query <- get_example_query(model_id = "gem-1-bulk")$example_query
# 
# # Submit the query and get results
# result <- predict_query(query, model_id = "gem-1-bulk")
# 
# # Access the results
# metadata <- result$metadata
# expression <- result$expression

## ----session-info-------------------------------------------------------------
# sessionInfo()

