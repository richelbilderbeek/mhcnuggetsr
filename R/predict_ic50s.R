#' Predict the half maximal inhibitory concentrations (aka IC50s) (in nM)
#' of all possible n-mers within a peptide
#' @inheritParams default_params_doc
#' @examples
#' library(testthat)
#'
#' peptide <- "AIAACAMLLVCCCCCC"
#'
#' mhcnuggets_options <- create_mhcnuggets_options(
#'   mhc_class = "I",
#'   mhc = "HLA-A02:01"
#' )
#'
#' df <- predict_ic50s(
#'   peptide = peptide,
#'   n_aas = 15,
#'   mhcnuggets_options = mhcnuggets_options
#' )
#'
#' expect_true("peptide" %in% names(df))
#' expect_true("ic50" %in% names(df))
#' expect_equal("character", class(df$peptide))
#' expect_equal("numeric", class(df$ic50))
#' n_rows_expected <- nchar(peptide) - 15 + 1
#' expect_equal(n_rows_expected, nrow(df))
#' @author Richèl J.C. Bilderbeek
#' @export
predict_ic50s <- function(
  peptide,
  n_aas,
  mhcnuggets_options,
  peptides_path = create_temp_peptides_path()
) {
  if (n_aas > 15) {
    stop(
      "'n_aas' must be 15 at most. \n",
      "Actual value: ", n_aas
    )
  }
  n <- nchar(peptide) - n_aas + 1
  peptides <- rep(NA, n)
  for (i in seq_len(n)) {
    peptides[i] <- substr(peptide, i, i + n_aas - 1)
  }
  testthat::expect_true(all(nchar(peptides) == n_aas))
  mhcnuggetsr::predict_ic50(
    peptides = peptides,
    mhcnuggets_options = mhcnuggets_options
  )
}
