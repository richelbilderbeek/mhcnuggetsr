#' Get all the MHC-II haplotypes that have been trained on a model
#' @inheritParams default_params_doc
#' @return a character vector with haplotype names in MHCnuggets format
#' @examples
#' if (is_mhcnuggets_installed()) {
#'   get_trained_mhc_2_haplotypes()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_trained_mhc_2_haplotypes <- function(
  folder_name = get_default_mhcnuggets_folder(),
  mhcnuggets_url = get_mhcnuggets_url()
) {
  mhcnuggetsr::check_mhcnuggets_installation(
    folder_name = folder_name,
    mhcnuggets_url = mhcnuggets_url
  )
  mhcnuggets_folder <- file.path(folder_name, basename(mhcnuggets_url))
  testthat::expect_true(dir.exists(mhcnuggets_folder))
  alleles_filename <- file.path(
    mhcnuggets_folder, "mhcnuggets",
    "data", "production", "mhcII", "alleles_with_trained_models.txt"
  )
  testthat::expect_true(file.exists(alleles_filename))
  readLines(alleles_filename)
}
