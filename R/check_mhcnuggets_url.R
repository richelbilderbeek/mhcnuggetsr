#' Check the `mhcnuggets_url`
#'
#' Check the `mhcnuggets_url`.
#' Will \link{stop} if it is invalid.
#' @inheritParams default_params_doc
#' @return Nothing.
#' @author Richèl J.C. Bilderbeek
#' @examples
#' check_mhcnuggets_url("/home/username")
#' @export
check_mhcnuggets_url <- function(mhcnuggets_url) {
  if (length(mhcnuggets_url) != 1) {
    stop(
      "'mhcnuggets_url' must be one URL name. \n",
      "Actual length: ", length(mhcnuggets_url), " \n",
      "Actual value: ", mhcnuggets_url
    )
  }
  if (!is.character(mhcnuggets_url)) {
    stop(
      "'mhcnuggets_url' must be a URL of class 'character'. \n",
      "Actual class: ", class(mhcnuggets_url), " \n",
      "Actual value: ", mhcnuggets_url
    )
  }
  if (nchar(mhcnuggets_url) == 0) {
    stop(
      "'mhcnuggets_url' must be a URL of at least 1 character. \n",
      "Actual number of characters: ", nchar(mhcnuggets_url), " \n",
      "Actual value: ", mhcnuggets_url
    )
  }
  invisible(mhcnuggets_url)
}
