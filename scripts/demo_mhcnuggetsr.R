library(mhcnuggetsr)

mhcnuggetsr_folder <- "/opt/mhcnuggetsr"
message("mhcnuggetsr_folder: ", mhcnuggetsr_folder)

if (1 == 2) {
  mhcnuggetsr_folder <- "/home/richel/test/and/test/again/mhcnuggetr"
  mhcnuggetsrinstall::install_mhcnuggets(mhcnuggetsr_folder)

}

if (!is_mhcnuggets_installed(mhcnuggetsr_folder = mhcnuggetsr_folder)) {
  stop(
    "MHCnuggets not found. \n",
    "mhcnuggetsr_folder: ", mhcnuggetsr_folder, " \n",
    " \n",
    "Tip: run 'mhcnuggetsrinstall::install_mhcnuggets'"
  )
}
message("MHCnuggets is installed")

mhc_1_haplotype <- "HLA-A02:01"
message("mhc_1_haplotype: ", mhc_1_haplotype)

mhcnuggets_options <- create_mhcnuggets_options(
  mhc = mhc_1_haplotype,
  mhcnuggetsr_folder = mhcnuggetsr_folder
)

message("mhcnuggets_options: ", mhcnuggets_options_to_text(mhcnuggets_options))

peptides_path <- get_example_filename(
  filename = "test_peptides.peps",
  mhcnuggetsr_folder = mhcnuggetsr_folder
)
message("peptides_path: ", peptides_path)
testthat::expect_true(file.exists(peptides_path))

message(
  "trained MHC-I haplotypes: ",
  paste0(get_trained_mhc_1_haplotypes(mhcnuggetsr_folder), collapse = ", ")
)
message(
  "trained MHC-II haplotypes: ",
  paste0(get_trained_mhc_2_haplotypes(mhcnuggetsr_folder), collapse = ", ")
)

predict_ic50_from_file(
  peptides_path = peptides_path,
  mhcnuggets_options = mhcnuggets_options,
  verbose = TRUE
)
