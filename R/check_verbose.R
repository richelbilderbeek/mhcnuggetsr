#' Check the `verbose`
#'
#' Check the `verbose`
#' Will \link{stop} if it is invalid.
#' @inheritParams default_params_doc
#' @return Nothing.
#' @author Richèl J.C. Bilderbeek
#' @examples
#' check_verbose(TRUE)
#' check_verbose(FALSE)
#' @export
check_verbose <- function(verbose) {
  if (length(verbose) != 1) {
    stop(
      "'verbose' must be either TRUE or FALSE. \n",
      "Actual value: ", verbose
    )
  }
  if (verbose != TRUE && verbose != FALSE) {
    stop(
      "'verbose' must be either TRUE or FALSE. \n",
      "Actual value: ", verbose
    )
  }
  invisible(verbose)
}
