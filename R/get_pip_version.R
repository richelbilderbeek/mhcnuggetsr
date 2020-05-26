#' Get the version of pip
#' @export
get_pip_version <- function() {
  line <- system2(
    reticulate::py_config()$python,
    args = c("-m", "pip", "--version"), stdout = TRUE
  )
  stringr::str_match(line, "pip (.*) from")[1, 2]
}
