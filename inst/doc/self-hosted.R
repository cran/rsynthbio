## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE # Set to FALSE since these calls require a running container
)

## ----install, eval=FALSE------------------------------------------------------
# install.packages("rsynthbio")
# install.packages("arrow") # required for self-hosted mode

## ----enable, eval=FALSE-------------------------------------------------------
# library(rsynthbio)
# 
# Sys.setenv(SYNTHESIZE_SELF_HOSTED = "1")

## ----per-model, eval=FALSE----------------------------------------------------
# Sys.setenv(
#   SYNTHESIZE_API_BASE_URL__GEM_1_BULK = "https://gem-1-bulk.internal.example",
#   SYNTHESIZE_API_BASE_URL__GEM_1_SC   = "https://gem-1-sc.internal.example"
# )
# 
# query <- get_example_query("gem-1-bulk", self_hosted = TRUE)$example_query
# result <- predict_query(query, model_id = "gem-1-bulk", self_hosted = TRUE)
# 
# expression <- result$expression
# metadata <- result$metadata

## ----explicit-url, eval=FALSE-------------------------------------------------
# result <- predict_query(
#   query,
#   model_id = "gem-1-bulk",
#   api_base_url = "https://gem-1-bulk.internal.example",
#   self_hosted = TRUE
# )

## ----auth, eval=FALSE---------------------------------------------------------
# Sys.setenv(SYNTHESIZE_API_KEY = "your-container-api-key")

## ----raw, eval=FALSE----------------------------------------------------------
# raw <- predict_query(
#   query,
#   model_id = "gem-1-bulk",
#   self_hosted = TRUE,
#   raw_response = TRUE
# )
# 
# raw$table # an arrow::Table
# raw$model_version

## ----session-info-------------------------------------------------------------
# sessionInfo()

