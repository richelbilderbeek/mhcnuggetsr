#' Get the version of all Python packages
#' @examples
#' library(testthat)
#'
#' df <- get_python_package_versions()
#' expect_true(tibble::is_tibble(df))
#' expect_true("package" %in% names(df))
#' expect_true("version" %in% names(df))
#' expect_true(nrow(df) > 0)
#' expect_true(!is.factor(df$package))
#' expect_true(!is.factor(df$version))
#' @author Richèl J.C. Bilderbeek
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

