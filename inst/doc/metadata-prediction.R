## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE # Set to FALSE since API calls require credentials
)

## -----------------------------------------------------------------------------
# library(rsynthbio)

## ----query-example, eval=FALSE------------------------------------------------
# # Get the example query structure
# example_query <- get_example_query(model_id = "gem-1-bulk_predict-metadata")$example_query
# 
# # Inspect the query structure
# str(example_query)

## ----predict-metadata, eval=FALSE---------------------------------------------
# # Start with example query structure
# query <- get_example_query(model_id = "gem-1-bulk_predict-metadata")$example_query
# 
# # Replace with your actual expression counts
# # Each input should be a list with a counts vector
# query$inputs <- list(
#   list(counts = sample1_counts),
#   list(counts = sample2_counts),
#   list(counts = sample3_counts)
# )
# 
# # Optional: set seed for reproducibility
# query$seed <- 42
# 
# # Submit the query
# result <- predict_query(query, model_id = "gem-1-bulk_predict-metadata")

## ----single-sample, eval=FALSE------------------------------------------------
# query <- get_example_query(model_id = "gem-1-bulk_predict-metadata")$example_query
# 
# # Single sample
# query$inputs <- list(
#   list(counts = my_sample_counts)
# )
# 
# result <- predict_query(query, model_id = "gem-1-bulk_predict-metadata")
# 
# # Access the predictions
# print(result$outputs$metadata)

## ----inputs-example, eval=FALSE-----------------------------------------------
# query$inputs <- list(
#   list(counts = c(0, 12, 5, 0, 33, 7, ...)), # Sample 1
#   list(counts = c(3, 0, 0, 7, 1, 0, ...)) # Sample 2
# )

## ----seed-example, eval=FALSE-------------------------------------------------
# query$seed <- 123

## ----metadata-results, eval=FALSE---------------------------------------------
# # View predicted metadata
# head(result$outputs$metadata)
# 
# # Access specific predictions
# result$outputs$metadata$cell_type_ontology_id
# result$outputs$metadata$tissue_ontology_id
# result$outputs$metadata$disease_ontology_id

## ----classifier-probs, eval=FALSE---------------------------------------------
# # If probabilities are included in the output
# # Access cell type probabilities for first sample
# # The exact structure depends on the API response format
# 
# # Example: viewing top predicted cell types
# cell_type_probs <- result$outputs$classifier_probs$cell_type[[1]]
# head(sort(cell_type_probs, decreasing = TRUE))

## ----latents, eval=FALSE------------------------------------------------------
# # Access latent representations (if returned)
# biological_latents <- result$outputs$latents$biological
# technical_latents <- result$outputs$latents$technical

## ----annotation, eval=FALSE---------------------------------------------------
# # Load your unlabeled samples
# unlabeled_counts <- read.csv("unlabeled_samples.csv", row.names = 1)
# 
# # Create query
# query <- get_example_query(model_id = "gem-1-bulk_predict-metadata")$example_query
# query$inputs <- lapply(1:ncol(unlabeled_counts), function(i) {
#   list(counts = unlabeled_counts[, i])
# })
# 
# # Predict metadata
# result <- predict_query(query, model_id = "gem-1-bulk_predict-metadata")
# 
# # Combine with sample IDs
# annotations <- result$outputs$metadata
# annotations$sample_id <- colnames(unlabeled_counts)

## ----qc, eval=FALSE-----------------------------------------------------------
# # Compare predicted vs. provided labels
# provided_labels <- c("UBERON:0002107", "UBERON:0002107", "UBERON:0000955", "UBERON:0000955")
# predicted_labels <- result$outputs$metadata$tissue_ontology_id
# 
# # Identify potential mismatches
# mismatches <- which(provided_labels != predicted_labels)
# if (length(mismatches) > 0) {
#   message("Potential mislabeled samples: ", paste(mismatches, collapse = ", "))
# }

