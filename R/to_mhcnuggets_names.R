#' Convert one or more standard haplotype name to the MHCnuggets names
#'
#' Convert one or more standard haplotype names to the MHCnuggets names.
#' Will \link{stop} if this conversion fails.
#' @inheritParams default_params_doc
#' @return the MHCnuggets names for the haplotypes
#' @examples
#' to_mhcnuggets_names("HLA-A*01:01")
#' @author Richèl J.C. Bilderbeek
#' @export
to_mhcnuggets_names <- function(mhcs) {

  if (length(mhcs) == 0) {
    stop("'mhcs' must have at least one value")
  }

  mhcnuggets_names <- rep(NA, length(mhcs))
  for (i in seq_along(mhcnuggets_names)) {
    mhcnuggets_names[i] <- mhcnuggetsr::to_mhcnuggets_name(mhcs[i])
  }
  mhcnuggets_names
}
