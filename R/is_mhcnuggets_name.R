#' Is this an MHCnuggets name?
#'
#' Determine if an HLA haplotype name follow the name format
#' that MHCnuggets uses internally
#' @inheritParams default_params_doc
#' @return TRUE if the name follows the MHCnuggets naming convention
#' @examples
#' # The official name is not the name format used by MHCnuggets
#' is_mhcnuggets_name("HLA-A*01:01")
#'
#' # MHCnuggets uses names without the asterisk
#' is_mhcnuggets_name("HLA-A01:01")
#' @export
is_mhcnuggets_name <- function(mhc) {
  if (length(mhc) != 1) return(FALSE)
  if (is.null(mhc)) return(FALSE)
  !is.na(
    stringr::str_match(
      string = mhc,
      pattern = paste0(
        "^",
        "(BoLA|Eqca|H|H-2|HLA|Mamu|Patr|SLA)",
        "-[A-Za-z]{0,3}[[:digit:]]{0,4}:?[[:digit:]]{0,4}",
        "(-[A-Za-z]{1,3}[[:digit:]]{1,4}:[[:digit:]]{1,4})?",
        "$"
      )
    )[, 1]
  )
}
