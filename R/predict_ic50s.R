#' Predict the half maximal inhibitory concentrations (aka IC50s) (in nM)
#' of all possible n-mers within a peptide
#' @inheritParams default_params_doc
#' @return a tibble with columns:\cr
#' \itemize{
#'   \item peptide the peptide fragment, each of length \code{peptide_length}
#'   \item ic50 the predicted IC50 (in nM)
#' }
#' @examples
#' if (is_mhcnuggets_installed()) {
#'
#'   mhcnuggets_options <- create_mhcnuggets_options(
#'     mhc = "HLA-A02:01"
#'   )
#'
#'   predict_ic50s(
#'     protein_sequence = "AIAACAMLLVCCCCCC",
#'     peptide_length = 13,
#'     mhcnuggets_options = mhcnuggets_options
#'   )
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
predict_ic50s <- function(
  protein_sequence,
  peptide_length,
  mhcnuggets_options,
  peptides_path = create_temp_peptides_path()
) {
  if (peptide_length > 15) {
    stop(
      "'peptide_length' must be 15 at most. \n",
      "Actual value: ", peptide_length
    )
  }
  # Split protein in peptides
  n <- nchar(protein_sequence) - peptide_length + 1
  peptides <- rep(NA, n)
  for (i in seq_len(n)) {
    peptides[i] <- substr(protein_sequence, i, i + peptide_length - 1)
  }
  testthat::expect_true(all(nchar(peptides) == peptide_length))
  mhcnuggetsr::predict_ic50(
    peptides = peptides,
    mhcnuggets_options = mhcnuggets_options
  )
}
