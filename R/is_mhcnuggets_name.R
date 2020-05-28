#' Determine if an HLA haplotype name follow the name format
#' that MHCnuggets uses internally
#' @inheritParams default_params_doc
#' @examples
#' library(testthat)
#'
#' expect_true(!is_mhcnuggets_name("HLA-A*01:01"))
#' expect_true( is_mhcnuggets_name("HLA-A01:01"))
#' @export
is_mhcnuggets_name <- function(mhc) {
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
    )[,1]
  )
}
