#' Get the version of all Python packages
#' @examples
#' if (rappdirs::app_dir()$os != "win" && is_pip_installed()) {
#'   get_python_package_versions()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_python_package_versions <- function() {
  testthat::expect_true(mhcnuggetsr::is_pip_installed())
  text <- system2(
    reticulate::py_config()$python,
    args = c("-m", "pip", "freeze"),
    stdout = TRUE
  )
  matrix <- stringr::str_match(text, "(.*)(==| @ )(.*)")[, c(2, 4)]
  df <- tibble::as_tibble(matrix, .name_repair = "minimal")
  names(df) <- c("package", "version")
  df
}
