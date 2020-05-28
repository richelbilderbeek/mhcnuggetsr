#' Convert a standard haplotype name to the MHCnuggets equivalent
#' @inheritParams default_params_doc
#' @examples
#' library(testthat)
#'
#' haplotype <- "HLA-A*01:01"
#' expect_equal("HLA-A01:01", to_mhcnuggets_name(haplotype))
#' @author Richèl J.C. Bilderbeek
#' @export
to_mhcnuggets_name <- function(mhc) {
  stringr::str_replace(
    string = mhc,
    pattern = "\\*",
    replacement = ""
  )
}
