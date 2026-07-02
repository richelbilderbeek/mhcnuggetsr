#' Get the installed  Python packages and their versions
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with two rows:
#'  * `package`: the package name
#'  * `version`: the package version
#'  * `requirement`: the packages requirements
#'  * `channel`: the package's channel
#' @examples
#' # Local python3
#' get_installed_python_packages(ormr_folder_name = "python3")
#'
#' # Conda environment
#' if (is_conda_installed()) {
#'   get_installed_python_packages()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_installed_python_packages <- function(
  ormr_folder_name = get_default_ormr_folder_name(),
  python_version = get_default_python_version(),
  verbose = FALSE
) {
  testthat::expect_equal(ormr_folder_name, "python3")
  text <- system2(
    command = "python3",
    args = c("-m", "pip", "list"),
    stdout = TRUE,
    stderr = TRUE
  )
  # Remove warnings
  while (stringr::str_detect(text[1], "WARNING:")) {
    testthat::expect_true(stringr::str_detect(text[1], "WARNING:"))
    text <- text[-1]
  }
  testthat::expect_true(stringr::str_detect(text[1], "Package.*Version"))
  text <- text[-1]
  testthat::expect_true(stringr::str_detect(text[1], "---.*---"))
  text <- text[-1]
  text <- text[stringr::str_detect(text, "WARNING: ", negate = TRUE)]
  text <- text[stringr::str_detect(text, "You should", negate = TRUE)]
  table <- stringr::str_split_fixed(text, pattern = " ", n = 2)
  installed_python_packages <- tibble::tibble(
    package = stringr::str_trim(table[, 1]),
    version = stringr::str_trim(table[, 2])
  )
  installed_python_packages
}
