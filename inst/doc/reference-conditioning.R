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
# example_query <- get_example_query(model_id = "gem-1-bulk_reference-conditioning")$example_query
# 
# # Inspect the query structure
# str(example_query)

## ----drug-treatment, eval=FALSE-----------------------------------------------
# # Start with example query structure
# query <- get_example_query(model_id = "gem-1-bulk_reference-conditioning")$example_query
# 
# # Replace with your actual reference counts
# # The counts vector must match the model's expected gene order and length
# query$inputs[[1]]$counts <- list(counts = your_reference_counts)
# 
# # Specify the perturbation
# query$inputs[[1]]$metadata <- list(
#   perturbation_ontology_id = "CHEMBL25", # Aspirin (ChEMBL ID)
#   perturbation_type = "compound",
#   perturbation_time = "24h",
#   perturbation_dose = "10uM"
# )
# 
# query$inputs[[1]]$num_samples <- 3
# 
# # Set the sampling strategy
# query$sampling_strategy <- "mean estimation"
# 
# # Submit the query
# result <- predict_query(query, model_id = "gem-1-bulk_reference-conditioning")

## ----crispr-example, eval=FALSE-----------------------------------------------
# query <- get_example_query(model_id = "gem-1-bulk_reference-conditioning")$example_query
# 
# # Your reference sample counts
# query$inputs[[1]]$counts <- list(counts = control_sample_counts)
# 
# # CRISPR knockout of TP53
# query$inputs[[1]]$metadata <- list(
#   perturbation_ontology_id = "ENSG00000141510", # TP53 Ensembl ID
#   perturbation_type = "crispr"
# )
# 
# query$inputs[[1]]$num_samples <- 5
# 
# result <- predict_query(query, model_id = "gem-1-bulk_reference-conditioning")

## ----mode-example, eval=FALSE-------------------------------------------------
# query$sampling_strategy <- "mean estimation"

## ----fixed-total-count, eval=FALSE--------------------------------------------
# # Preserve reference library size (default)
# query$fixed_total_count <- FALSE
# 
# # Or force a specific library size
# query$fixed_total_count <- TRUE
# query$total_count <- 10000000

## ----deterministic-example, eval=FALSE----------------------------------------
# query$deterministic_latents <- TRUE

## ----seed-example, eval=FALSE-------------------------------------------------
# query$seed <- 42

## ----results, eval=FALSE------------------------------------------------------
# # Access metadata and expression matrices
# metadata <- result$metadata
# expression <- result$expression
# 
# # Compare to your reference
# dim(expression)
# head(metadata)

## ----de-analysis, eval=FALSE--------------------------------------------------
# # Your reference (input) counts
# reference_cpm <- your_reference_counts / sum(your_reference_counts) * 1e6
# 
# # Generated (perturbed) counts
# generated_cpm <- expression[1, ] / sum(expression[1, ]) * 1e6
# 
# # Log fold change
# log2fc <- log2(generated_cpm + 1) - log2(reference_cpm + 1)
# 
# # Identify top changed genes
# head(sort(log2fc, decreasing = TRUE), 20)

