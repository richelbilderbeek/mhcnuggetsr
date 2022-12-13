#' Check the `mhcnuggetsr_folder`
#'
#' Check the `mhcnuggetsr_folder`.
#' Will \link{stop} if it is invalid.
#' @inheritParams default_params_doc
#' @return Nothing.
#' @author Richèl J.C. Bilderbeek
#' @examples
#' check_mhcnuggetsr_folder("/home/username")
#' @export
check_mhcnuggetsr_folder <- function(mhcnuggetsr_folder) {
  if (length(mhcnuggetsr_folder) != 1) {
    stop(
      "'mhcnuggetsr_folder' must be one folder name. \n",
      "Actual length: ", length(mhcnuggetsr_folder), " \n",
      "Actual value: ", mhcnuggetsr_folder
    )
  }
  if (!is.character(mhcnuggetsr_folder)) {
    stop(
      "'mhcnuggetsr_folder' must be a folder name of class 'character'. \n",
      "Actual class: ", class(mhcnuggetsr_folder), " \n",
      "Actual value: ", mhcnuggetsr_folder
    )
  }
  if (nchar(mhcnuggetsr_folder) == 0) {
    stop(
      "'mhcnuggetsr_folder' must be a folder name of at least 1 character. \n",
      "Actual number of characters: ", nchar(mhcnuggetsr_folder), " \n",
      "Actual value: ", mhcnuggetsr_folder
    )
  }
  invisible(mhcnuggetsr_folder)
}
