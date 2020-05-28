#' Predict the half maximal inhibitory concentration (aka IC50) (in nM)
#' for one or more peptides as saved in a file.
#' Each peptide must be 15 amino acids at
#' most (use \link{predict_ic50s} to predict the IC50s for longer peptides)
#' @inheritParams default_params_doc
#' @examples
#' library(testthat)
#'
#' if (is_mhcnuggets_installed()) {
#'
#'   peptides_path <- get_example_filename("test_peptides.peps")
#'   expect_true(file.exists(peptides_path))
#'
#'   mhc_1_haplotype <- "HLA-A02:01"
#'   expect_true(mhc_1_haplotype %in% get_trained_mhc_1_haplotypes())
#'
#'   df <- predict_ic50_from_file(
#'     mhc_class = "I",
#'     peptides_path = peptides_path,
#'     mhc = mhc_1_haplotype
#'   )
#'   expect_true("peptide" %in% names(df))
#'   expect_true("ic50" %in% names(df))
#'   expect_equal("character", class(df$peptide))
#'   expect_equal("numeric", class(df$ic50))
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
predict_ic50_from_file <- function(
  mhc_class,
  peptides_path,
  mhc,
  ba_models = FALSE,
  folder_name = get_default_mhcnuggets_folder(),
  mhcnuggets_url = get_mhcnuggets_url()
) {
  if (!mhc_class %in% c("I", "II")) {
    stop(
      "'mhc_class' must be either 'I' or 'II'. \n",
      "Actual value: ", mhc_class
    )
  }
  if (!file.exists(peptides_path)) {
    stop(
      "Cannot find 'peptides_path'. \n",
      "Actual value: ", peptides_path
    )
  }
  if (any(nchar(readLines(peptides_path, warn = FALSE)) > 15)) {
    stop("'peptides' must have lengths of at most 15")
  }
  if (!is_mhcnuggets_name(mhc)) {
    stop(
      "'mhc' must be a valid MHC haplotype name", "\n",
      "Actual value: ", mhc, "\n",
      "Tip: see 'get_mhc_1_haplotypes' or 'get_mhc_2_haplotypes'"
    )
  }
  mhcnuggetsr::check_mhcnuggets_installation(
    folder_name = folder_name,
    mhcnuggets_url = mhcnuggets_url
  )
  if (mhc_class == "I" && mhc %in% get_trained_mhc_2_haplotypes()) {
    stop("Must use the same 'mhc_class' as the 'mhc' is from")
  }
  if (mhc_class == "II" && mhc %in% get_trained_mhc_1_haplotypes()) {
    stop("Must use the same 'mhc_class' as the 'mhc' is from")
  }
  mhcnuggets_folder <- file.path(folder_name, basename(mhcnuggets_url))
  testthat::expect_true(dir.exists(mhcnuggets_folder))
  module <- reticulate::import_from_path(
    module = "mhcnuggets.src.predict",
    path = file.path(mhcnuggets_folder, "mhcnuggets")
  )
  filename <- tempfile()

  suppressMessages(
    module$predict(
      class_ = mhc_class,
      peptides_path = peptides_path,
      mhc = mhc,
      ba_models = ba_models,
      output = filename
    )
  )

  df <- tibble::as_tibble(utils::read.csv(filename))
  df$peptide <- as.character(df$peptide)
  df
}
