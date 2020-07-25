#' Predict the half maximal inhibitory concentrations (aka IC50s) (in nM)
#' of all possible n-mers within a peptide
#' @inheritParams default_params_doc
#' @examples
#' if (is_mhcnuggets_installed()) {
#'   peptide <- "AIAACAMLLVCCCCCC"
#'
#'   mhcnuggets_options <- create_mhcnuggets_options(
#'     mhc = "HLA-A02:01"
#'   )
#'
#'   predict_ic50s(
#'     peptide = peptide,
#'     n_aas = 15,
#'     mhcnuggets_options = mhcnuggets_options
#'   )
#' }
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
