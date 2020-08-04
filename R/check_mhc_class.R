#' Check the MHC class.
#'
#' Check the MHC class. Will \link{stop} if it is invalid.
#' @inheritParams default_params_doc
#' @return Nothing.
#' @author Richèl J.C. Bilderbeek
#' @examples
#' check_mhc_class("I")
#' check_mhc_class("II")
#' check_mhc_class(NA)
#' @export
check_mhc_class <- function(mhc_class) {
  if (length(mhc_class) != 1 ||
    (!is.na(mhc_class) && !mhc_class %in% c("I", "II"))
  ) {
    stop(
      "'mhc_class' must be either 'I', 'II' or NA. \n",
      "Actual value: ", mhc_class
    )
  }
}
