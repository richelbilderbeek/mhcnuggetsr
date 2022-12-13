#' Check the `ba_models`
#'
#' Check the `ba_models`
#' Will \link{stop} if it is invalid.
#' @inheritParams default_params_doc
#' @return Nothing.
#' @author Richèl J.C. Bilderbeek
#' @examples
#' check_ba_models(TRUE)
#' check_ba_models(FALSE)
#' @export
check_ba_models <- function(ba_models) {
  if (length(ba_models) != 1) {
    stop(
      "'ba_models' must be either TRUE or FALSE. \n",
      "Actual value: ", ba_models
    )
  }
  if (ba_models != TRUE && ba_models != FALSE) {
    stop(
      "'ba_models' must be either TRUE or FALSE. \n",
      "Actual value: ", ba_models
    )
  }
  invisible(ba_models)
}
