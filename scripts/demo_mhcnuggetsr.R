library(mhcnuggetsr)
mhcnuggetsr_folder <- "/opt/mhcnuggetsr"

if (!is_mhcnuggets_installed(mhcnuggetsr_folder = mhcnuggetsr_folder)) {
  stop(
    "MHCnuggets not found. \n",
    "mhcnuggetsr_folder: ", mhcnuggetsr_folder, " \n",
    " \n",
    "Tip: run 'mhcnuggetsrinstall::install_mhcnuggets'"
  )
}

if (is_mhcnuggets_installed(mhcnuggetsr_folder = mhcnuggetsr_folder)) {

  peptides_path <- get_example_filename(
    filename = "test_peptides.peps",
    mhcnuggetsr_folder = mhcnuggetsr_folder
  )
  mhc_1_haplotype <- "HLA-A02:01"

  mhcnuggets_options <- create_mhcnuggets_options(
    mhc = mhc_1_haplotype,
    mhcnuggetsr_folder = mhcnuggetsr_folder
  )

  predict_ic50_from_file(
    peptides_path = peptides_path,
    mhcnuggets_options = mhcnuggets_options
  )
}
