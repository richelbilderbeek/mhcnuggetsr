#' Determine if an HLA haplotype name follow the name format
#' that MHCnuggets uses internally
#' @inheritParams default_params_doc
#' @examples
#' if (is_mhcnuggets_installed()) {
#'   are_mhcnuggets_names(get_mhc_1_haplotypes())
#'   are_mhcnuggets_names(get_mhc_2_haplotypes())
#' }
#' @export
are_mhcnuggets_names <- function(mhcs) {
  mhcnuggetsr::is_mhcnuggets_name(mhcs)
}
