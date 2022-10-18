#' Get all the MHC-I haplotypes that have been trained on a model
#' @inheritParams default_params_doc
#' @return a character vector with haplotype names in MHCnuggets format
#' @examples
#' if (is_mhcnuggets_installed()) {
#'   get_trained_mhc_1_haplotypes()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_trained_mhc_1_haplotypes <- function(
    mhcnuggetsr_folder = get_default_mhcnuggets_folder(),
    ormr_folder_name = get_default_orm_folder_name()
) {
  mhcnuggetsr::check_mhcnuggets_installation(
    mhcnuggetsr_folder = mhcnuggetsr_folder,
    ormr_folder_name = ormr_folder_name
  )
  mhcnuggets_folder <- file.path(
    mhcnuggetsr_folder,
    basename(get_mhcnuggets_url())
  )
  testthat::expect_true(dir.exists(mhcnuggets_folder))
  alleles_filename <- file.path(
    mhcnuggets_folder,
    "data", "production", "mhcI", "alleles_with_trained_models.txt"
  )
  testthat::expect_true(file.exists(alleles_filename))
  readLines(alleles_filename)
}
