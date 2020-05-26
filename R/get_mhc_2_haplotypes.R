#' Get all the MHC-II haplotypes
#' @inheritParams default_params_doc
#' @examples
#' library(testthat)
#'
#' if (is_mhcnuggets_installed()) {
#'   haplotypes <- get_mhc_2_haplotypes()
#'   expect_true(length(haplotypes) > 1)
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_mhc_2_haplotypes <- function(
  folder_name = get_default_mhcnuggets_folder(),
  mhcnuggets_url = get_mhcnuggets_url()
) {
  mhcnuggetsr::get_trained_mhc_2_haplotypes()
}
