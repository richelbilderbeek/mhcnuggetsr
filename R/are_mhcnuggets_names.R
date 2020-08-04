#' Are these MHCnuggets names?
#'
#' Determine if an HLA haplotype name follow the name format
#' that MHCnuggets uses internally
#' @inheritParams default_params_doc
#' @return a vector of booleans, TRUE for HLA haplotypes that follow
#' the MHCnuggets naming convention
#' @examples
#' if (is_mhcnuggets_installed()) {
#'   are_mhcnuggets_names(get_mhc_1_haplotypes())
#'   are_mhcnuggets_names(get_mhc_2_haplotypes())
#' }
#' @export
are_mhcnuggets_names <- function(mhcs) {
  results <- rep(NA, length(mhcs))
  for (i in seq_along(results)) {
    results[i] <- mhcnuggetsr::is_mhcnuggets_name(mhcs[i])
  }
  results
}
