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

## ----models-------------------------------------------------------------------
# # Check available models
# list_models()

## ----query, eval=FALSE--------------------------------------------------------
# # Create a query for the bulk model
# bulk_query <- get_example_query(model_id = "gem-1-bulk")
# bulk <- predict_query(bulk_query, model_id = "gem-1-bulk")
# 
# # Create a query for the single-cell model
# sc_query <- get_example_query(model_id = "gem-1-sc")
# sc <- predict_query(sc_query, model_id = "gem-1-sc")

## ----query-example------------------------------------------------------------
# # Get the example query structure for a specific model
# example_query <- get_example_query(model_id = "gem-1-bulk")
# 
# # Inspect the query structure
# str(example_query)

## ----predict, eval=FALSE------------------------------------------------------
# result <- predict_query(query, model_id = "gem-1-bulk")

## ----async-options, eval=FALSE------------------------------------------------
# # Increase timeout for large queries (default: 900 seconds = 15 minutes)
# result <- predict_query(
#   query,
#   model_id = "gem-1-bulk",
#   poll_timeout_seconds = 1800, # 30 minutes
#   poll_interval_seconds = 5 # Check every 5 seconds instead of 2
# )

## ----mode-examples, eval=FALSE------------------------------------------------
# # Bulk query with sample generation (default for bulk)
# bulk_query <- get_example_query(model_id = "gem-1-bulk")
# bulk_query$mode <- "sample generation"
# 
# # Bulk query with mean estimation
# bulk_query_mean <- get_example_query(model_id = "gem-1-bulk")
# bulk_query_mean$mode <- "mean estimation"
# 
# # Single-cell query (must use mean estimation)
# sc_query <- get_example_query(model_id = "gem-1-sc")
# sc_query$mode <- "mean estimation" # Required for single-cell

## ----total-count-example, eval=FALSE------------------------------------------
# # Create a query and add custom total_count
# query <- get_example_query(model_id = "gem-1-bulk")
# query$total_count <- 5000000

## ----deterministic-example, eval=FALSE----------------------------------------
# # Create a query and enable deterministic latents
# query <- get_example_query(model_id = "gem-1-bulk")
# query$deterministic_latents <- TRUE

## ----seed-example, eval=FALSE-------------------------------------------------
# # Create a query with a specific seed
# query <- get_example_query(model_id = "gem-1-bulk")
# query$seed <- 42

## ----combined-params, eval=FALSE----------------------------------------------
# # Create a query and add multiple parameters
# query <- get_example_query(model_id = "gem-1-bulk")
# query$total_count <- 8000000
# query$deterministic_latents <- TRUE
# query$mode <- "mean estimation"
# 
# results <- predict_query(query, model_id = "gem-1-bulk")

## ----modify-query, eval=FALSE-------------------------------------------------
# # Get a base query
# query <- get_example_query(model_id = "gem-1-bulk")
# 
# # Adjust number of samples for the first input
# query$inputs[[1]]$num_samples <- 10
# 
# # Add a new condition
# query$inputs[[3]] <- list(
#   metadata = list(
#     sex = "male",
#     sample_type = "primary tissue",
#     tissue_ontology_id = "UBERON:0002371"
#   ),
#   num_samples = 5
# )

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

## ----session-info-------------------------------------------------------------
# sessionInfo()

