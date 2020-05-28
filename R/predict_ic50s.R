#' Predict IC50s (in nM) of 15-mers of a peptide
#' @inheritParams default_params_doc
predict_ic50s <- function(
  mhc_class,
  peptide,
  mhc,
  ba_models = FALSE,
  folder_name = get_default_mhcnuggets_folder(),
  mhcnuggets_url = get_mhcnuggets_url(),
  peptides_path = tempfile()
) {
  if (nchar(peptide) < 16) {
    return(
      predict_ic50(
        mhc_class = mhc_class,
        peptides = peptide,
        mhc = mhc,
        ba_models = ba_models,
        folder_name = folder_name,
        mhcnuggets_url = mhcnuggets_url,
        peptides_path = peptides_path
      )
    )
  }
  n <- nchar(peptide) - 15 + 1
  peptides <- rep(NA, n)
  for (i in seq_len(n)) {
    peptides[i] <- substr(peptide, i, i + 15 - 1)
  }
  testthat::expect_true(all(nchar(peptides) == 15))
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
