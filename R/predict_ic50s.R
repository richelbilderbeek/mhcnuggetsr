#' Predict the half maximal inhibitory concentrations (aka IC50s) (in nM)
#' of all possible 15-mers within a peptide
#' @inheritParams default_params_doc
#' @examples
#' library(testthat)
#'
#' peptide <- "AIAACAMLLVCCCCCC"
#'
#' df <- predict_ic50s(
#'   mhc_class = "I",
#'   peptide = peptide,
#'   mhc = "HLA-A02:01",
#'   n_aas = 15
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
  mhc_class,
  peptide,
  mhc,
  n_aas,
  ba_models = FALSE,
  folder_name = get_default_mhcnuggets_folder(),
  mhcnuggets_url = get_mhcnuggets_url(),
  peptides_path = tempfile()
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
  predict_ic50(
    mhc_class = mhc_class,
    peptides = peptides,
    mhc = mhc,
    ba_models = ba_models,
    folder_name = folder_name,
    mhcnuggets_url = mhcnuggets_url,
    peptides_path = peptides_path
  )
}