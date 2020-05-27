#' Get the version of all Python packages
#' @export
get_python_package_versions <- function() {
  text <- system2(
    reticulate::py_config()$python,
    args = c("-m", "pip", "freeze"), stdout = TRUE
  )
  matrix <- stringr::str_match(text, "(.*)(==| @ )(.*)")[, c(2, 4)]
  df <- tibble::as_tibble(matrix, .name_repair = "minimal")
  names(df) <- c("package", "version")
  df
}

