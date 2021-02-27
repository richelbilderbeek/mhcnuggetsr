#' Install pip.
#' @param python_script_filename name of a temporary Python
#' script file. Will be deleted at the end of the function
#' @return Nothing
#' @examples
#' \dontrun{
#'   install_pip()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
install_pip <- function(
  python_script_filename = file.path(
    tmpdir = rappdirs::user_cache_dir(),
    "temp_install_pip.py"
  )
) {
  dir.create(
    dirname(python_script_filename),
    showWarnings = FALSE,
    recursive = TRUE
  )

  utils::download.file(
    url = "https://bootstrap.pypa.io/get-pip.py",
    destfile = python_script_filename,
    quiet = TRUE
  )
  error_code <- system2(
    reticulate::py_config()$python,
    args = c(python_script_filename, "--user"),
    stdout = FALSE
  )

  file.remove(python_script_filename)

  error_code
}
