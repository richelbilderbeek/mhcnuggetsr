#' Check if a file exists.
#'
#' Check if a file exists.
#' \link{stop} otherwise.
#' @inheritParams default_params_doc
#' @return TRUE if MHCnuggets is installed
#' @author Richèl J.C. Bilderbeek
#' @export
check_file_exists <- function(filename) {
  if (!file.exists(filename)) {
    stop("File not found. Filename: ", filename)
  }

}
