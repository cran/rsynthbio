## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE # Set to FALSE since API calls require credentials
)

## -----------------------------------------------------------------------------
# library(rsynthbio)

## ----query-example------------------------------------------------------------
# # Get the example query structure for a specific model
# example_query <- get_example_query(model_id = "gem-1-bulk")$example_query
# 
# # Inspect the query structure
# str(example_query)

## ----predict, eval=FALSE------------------------------------------------------
# # Create a query for the bulk model
# query <- get_example_query(model_id = "gem-1-bulk")$example_query
# 
# # Submit and get results
# result <- predict_query(query, model_id = "gem-1-bulk")

## ----sc-example, eval=FALSE---------------------------------------------------
# # Create a query for the single-cell model
# sc_query <- get_example_query(model_id = "gem-1-sc")$example_query
# 
# # Submit and get results
# sc_result <- predict_query(sc_query, model_id = "gem-1-sc")

## ----mode-examples, eval=FALSE------------------------------------------------
# # Bulk query with sample generation
# bulk_query <- get_example_query(model_id = "gem-1-bulk")$example_query
# bulk_query$sampling_strategy <- "sample generation"
# 
# # Bulk query with mean estimation
# bulk_query_mean <- get_example_query(model_id = "gem-1-bulk")$example_query
# bulk_query_mean$sampling_strategy <- "mean estimation"
# 
# # Single-cell query (must use mean estimation)
# sc_query <- get_example_query(model_id = "gem-1-sc")$example_query
# sc_query$sampling_strategy <- "mean estimation" # Required for single-cell

## ----total-count-example, eval=FALSE------------------------------------------
# # Create a query and add custom total_count
# query <- get_example_query(model_id = "gem-1-bulk")$example_query
# query$total_count <- 5000000

## ----deterministic-example, eval=FALSE----------------------------------------
# # Create a query and enable deterministic latents
# query <- get_example_query(model_id = "gem-1-bulk")$example_query
# query$deterministic_latents <- TRUE

## ----seed-example, eval=FALSE-------------------------------------------------
# # Create a query with a specific seed
# query <- get_example_query(model_id = "gem-1-bulk")$example_query
# query$seed <- 42

## ----combined-params, eval=FALSE----------------------------------------------
# # Create a query and add multiple parameters
# query <- get_example_query(model_id = "gem-1-bulk")$example_query
# query$total_count <- 8000000
# query$deterministic_latents <- TRUE
# query$sampling_strategy <- "mean estimation"
# 
# results <- predict_query(query, model_id = "gem-1-bulk")

## ----modify-query, eval=FALSE-------------------------------------------------
# # Get a base query
# query <- get_example_query(model_id = "gem-1-bulk")$example_query
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

