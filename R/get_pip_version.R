#' Get the version of pip
#' @return a string that is a version, for example \code{20.2}
#' @examples
#' if (is_pip_installed()) {
#'   get_pip_version()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_pip_version <- function() {
  testthat::expect_true(mhcnuggetsr::is_pip_installed())

  line <- system2(
    reticulate::py_config()$python,
    args = c("-m", "pip", "--version"), stdout = TRUE
  )
  stringr::str_match(line, "pip (.*) from")[1, 2]
}
