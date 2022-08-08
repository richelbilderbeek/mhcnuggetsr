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
  mhcnuggetsr_folder = get_default_mhcnuggets_folder(),
  ormr_folder_name = get_default_orm_folder_name()
) {
  mhcnuggetsr::get_trained_mhc_1_haplotypes(
    mhcnuggetsr_folder = mhcnuggetsr_folder,
    ormr_folder_name = ormr_folder_name
  )
}
