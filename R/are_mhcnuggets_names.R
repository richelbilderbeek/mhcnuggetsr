#' Determine if an HLA haplotype name follow the name format
#' that MHCnuggets uses internally
#' @inheritParams default_params_doc
#' @examples
#' library(testthat)
#'
#' expect_true(all(are_mhcnuggets_names(get_mhc_1_haplotypes())))
#' expect_true(all(are_mhcnuggets_names(get_mhc_2_haplotypes())))
#' @export
are_mhcnuggets_names <- function(mhcs) {
  is_mhcnuggets_name(mhcs)
}
