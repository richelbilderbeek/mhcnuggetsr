#' Get the URL of the MHCnuggets source code
#' @examples
#' library(testthat)
#'
#' url <- get_mhcnuggets_url()
#' expect_equal(1, length(url))
#' @author Richèl J.C. Bilderbeek
#' @export
get_mhcnuggets_url <- function() {
  "https://github.com/KarchinLab/mhcnuggets"
}
