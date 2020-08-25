#' Determine if pip is installed
#' @return TRUE if pip is installed, FALSE otherwise
#' @examples
#' is_pip_installed()
#' @author Richèl J.C. Bilderbeek
#' @export
is_pip_installed <- function() {

  python_path <- NA
  tryCatch({
      python_path <- reticulate::py_config()$python
    },
    error = function(e) return(FALSE)
  )

  if (is.na(python_path) || !file.exists(python_path)) return(FALSE)

  error_code <- system2(
    python_path,
    args = c("-m", "pip", "--version"),
    stderr = NULL,
    stdout = NULL
  )
  error_code == 0
}
