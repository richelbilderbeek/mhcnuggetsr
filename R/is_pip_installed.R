#' Determine if pip is installed
#' @return TRUE if pip is installed, FALSE otherwise
#' @examples
#' is_pip_installed()
#' @author Richèl J.C. Bilderbeek
#' @export
is_pip_installed <- function() {

  error_code <- system2(
    reticulate::py_config()$python,
    args = c("-m", "pip", "--version"),
    stderr = NULL,
    stdout = NULL
  )
  error_code == 0
}
