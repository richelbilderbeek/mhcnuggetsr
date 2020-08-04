#' Get all the MHC-I haplotypes
#'
#' Get all the MHC-I haplotypes that MHCnuggets has been trained upon.
#' @inheritParams default_params_doc
#' @return a character vector with haplotype names in MHCnuggets format
#' @examples
#' if (is_mhcnuggets_installed()) {
#'   get_mhc_1_haplotypes()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_mhc_1_haplotypes <- function(
  folder_name = get_default_mhcnuggets_folder(),
  mhcnuggets_url = get_mhcnuggets_url()
) {
  mhcnuggetsr::get_trained_mhc_1_haplotypes(
    folder_name = folder_name,
    mhcnuggets_url = mhcnuggets_url
  )
}
