#' Convert a standard haplotype name to the MHCnuggets name
#'
#' Convert a standard haplotype name to the MHCnuggets name.
#' Will \link{stop} if this conversion fails.
#' @inheritParams default_params_doc
#' @return the MHCnuggets name for the haplotype
#' @examples
#' to_mhcnuggets_name("HLA-A*01:01")
#' @author Richèl J.C. Bilderbeek
#' @export
to_mhcnuggets_name <- function(mhc) {
  if (length(mhc) != 1) {
    stop("'mhc' must be one value")
  }
  if (!is.character(mhc)) {
    stop("'mhc' must be of type character")
  }

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
  mhcnuggets_name <- stringr::str_replace_all(
    string = mhc_no_slash,
    pattern = "([[:digit:]]{3})([[:digit:]]{2})",
    replacement = "\\1:\\2"
  )
  if (!is_mhcnuggets_name(mhcnuggets_name)) {
    stop(
      "'to_mhcnuggets_name' did not result in an MHCnuggets name. \n",
      "'mhc': '", mhc, "'\n",
      "'mhcnuggets_name': '", mhcnuggets_name, "' ",
      "(which, again, is not an MCHnuggets name) \n"
    )
  }
  mhcnuggets_name
}
