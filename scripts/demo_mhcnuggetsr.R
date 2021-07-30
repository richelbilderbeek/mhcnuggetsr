library(mhcnuggetsr)
folder_name <- "/opt/mhcnuggetsr"
if (is_mhcnuggets_installed(folder_name = folder_name)) {

  peptides_path <- get_example_filename(
    filename = "test_peptides.peps",
    folder_name = folder_name
  )
  mhc_1_haplotype <- "HLA-A02:01"

  mhcnuggets_options <- create_mhcnuggets_options(
    mhc = mhc_1_haplotype,
    folder_name = folder_name
  )

  predict_ic50_from_file(
    peptides_path = peptides_path,
    mhcnuggets_options = mhcnuggets_options
  )
}
