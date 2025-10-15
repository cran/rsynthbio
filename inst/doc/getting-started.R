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

## ----clear-token, eval = FALSE------------------------------------------------
# # Clear token from current session
# clear_synthesize_token()
# 
# # Clear token from both session and keyring
# clear_synthesize_token(remove_from_keyring = TRUE)

## ----modalities---------------------------------------------------------------
# # Check available modalities
# get_valid_modalities()

## ----query--------------------------------------------------------------------
# # Get a sample query for bulk RNA-seq
# query <- get_valid_query(modality = "bulk")
# 
# # Get a sample query for single-cell RNA-seq
# query_sc <- get_valid_query(modality = "single-cell")
# 
# # Inspect the query structure
# str(query)

## ----predict, eval=FALSE------------------------------------------------------
# result <- predict_query(query, as_counts = TRUE)

## ----async-options, eval=FALSE------------------------------------------------
# # Increase timeout for large queries (default: 900 seconds = 15 minutes)
# result <- predict_query(
#   query,
#   poll_timeout_seconds = 1800, # 30 minutes
#   poll_interval_seconds = 5 # Check every 5 seconds instead of 2
# )

## ----modify-query-------------------------------------------------------------
# # Adjust number of samples
# query$inputs[[1]]$num_samples <- 10
# 
# # Add a new condition
# query$inputs[[3]] <- list(
#   metadata = list(
#     sex = "male",
#     sample_type = "primary tissue"
#   ),
#   num_samples = 3
# )

## ----predict-2, eval=FALSE----------------------------------------------------
# # Request log-transformed CPM instead of raw counts
# result_log <- predict_query(query, as_counts = FALSE)

## ----analyze, eval=FALSE------------------------------------------------------
# # Access metadata and expression matrices
# metadata <- result$metadata
# expression <- result$expression
# 
# # Check dimensions
# dim(expression)
# 
# # View metadata sample
# head(metadata)

## ----large-data, eval=FALSE---------------------------------------------------
# # Save results to RDS file
# saveRDS(result, "synthesize_results.rds")
# 
# # Load previously saved results
# result <- readRDS("synthesize_results.rds")
# 
# # Export as CSV
# write.csv(result$expression, "expression_matrix.csv")
# write.csv(result$metadata, "sample_metadata.csv")

## ----validation---------------------------------------------------------------
# # Validate structure
# validate_query(query)
# 
# # Validate modality
# validate_modality(query)

## ----session-info-------------------------------------------------------------
# sessionInfo()

