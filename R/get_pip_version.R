#' Get the version of pip
#' @examples
#' library(testthat)
#'
#' version <- get_pip_version()
#'
#' expect_equal(1, length(version))
#' expect_equal("character", class(version))
#' @author Richèl J.C. Bilderbeek
#' @export
get_pip_version <- function() {
  line <- system2(
    reticulate::py_config()$python,
    args = c("-m", "pip", "--version"), stdout = TRUE
  )
  stringr::str_match(line, "pip (.*) from")[1, 2]
}
