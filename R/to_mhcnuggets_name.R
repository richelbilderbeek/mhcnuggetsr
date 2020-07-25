#' Convert a standard haplotype name to the MHCnuggets equivalent
#' @inheritParams default_params_doc
#' @examples
#' haplotype <- "HLA-A*01:01"
#' to_mhcnuggets_name(haplotype)
#' @author Richèl J.C. Bilderbeek
#' @export
to_mhcnuggets_name <- function(mhc) {
  # Remove asterisks
  mhc_no_asterisks <- stringr::str_replace_all(
    string = mhc,
    pattern = "\\*",
    replacement = ""
  )
  # Replace slash by dash
  mhc_no_slash <- stringr::str_replace_all(
    string = mhc_no_asterisks,
    pattern = "/",
    replacement = "-"
  )
  # Replace 5 digits by 123:45
  stringr::str_replace_all(
    string = mhc_no_slash,
    pattern = "([[:digit:]]{3})([[:digit:]]{2})",
    replacement = "\\1:\\2"
  )
}
