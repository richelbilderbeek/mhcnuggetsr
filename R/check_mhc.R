#' Check if `mhc` is a valud MHCnuggets name
#' @inheritParams default_params_doc
#' @examples
#' # MHCnuggets uses names without the asterisk
#' check_mhc("HLA-A01:01")
#'
#' # The official name is not the name format used by MHCnuggets
#' # check_mhc("HLA-A*01:01")
#' @author Richèl J.C. Bilderbeek
#' @export
check_mhc <- function(mhc) {
  if (!mhcnuggetsr::is_mhcnuggets_name(mhc)) {
    stop(
      "'mhc' must be one valid MHC haplotype name", "\n",
      "Actual value: ", mhc, "\n",
      "Tip: use 'to_mhcnuggets_name' to convert to an MHCnuggets name,",
      "or see 'get_mhc_1_haplotypes' or 'get_mhc_2_haplotypes' for examples"
    )
  }
  invisible(mhc)
}
