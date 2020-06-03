
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mhcnuggetsr

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/mhcnuggetsr)](https://CRAN.R-project.org/package=mhcnuggetsr)

| Branch    | [![Travis CI logo](man/figures/TravisCI.png)](https://travis-ci.org)                                                                         | [![AppVeyor logo](man/figures/AppVeyor.png)](https://www.appveyor.com)                                                                                                               | [![Codecov logo](man/figures/Codecov.png)](https://www.codecov.io)                                                                                                         |
| --------- | -------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `master`  | [![Build Status](https://travis-ci.org/richelbilderbeek/mhcnuggetsr.svg?branch=master)](https://travis-ci.org/richelbilderbeek/mhcnuggetsr)  | [![Build status](https://ci.appveyor.com/api/projects/status/r7apdqey2ev9s4q7/branch/master?svg=true)](https://ci.appveyor.com/project/richelbilderbeek/mhcnuggetsr/branch/master)   | [![codecov.io](https://codecov.io/github/richelbilderbeek/mhcnuggetsr/coverage.svg?branch=master)](https://codecov.io/github/richelbilderbeek/mhcnuggetsr/branch/master)   |
| `develop` | [![Build Status](https://travis-ci.org/richelbilderbeek/mhcnuggetsr.svg?branch=develop)](https://travis-ci.org/richelbilderbeek/mhcnuggetsr) | [![Build status](https://ci.appveyor.com/api/projects/status/r7apdqey2ev9s4q7/branch/develop?svg=true)](https://ci.appveyor.com/project/richelbilderbeek/mhcnuggetsr/branch/develop) | [![codecov.io](https://codecov.io/github/richelbilderbeek/mhcnuggetsr/coverage.svg?branch=develop)](https://codecov.io/github/richelbilderbeek/mhcnuggetsr/branch/develop) |

<!-- badges: end -->

R package to work with
[MHCnuggets](https://github.com/KarchinLab/mhcnuggets).

The goal of `mhcnuggetsr` is to predict the half maximal inhibitory
concentration of peptides for an MHC haplotype. It does by calling
[MHCnuggets](https://github.com/KarchinLab/mhcnuggets).

## Installation

You can install the released version of mhcnuggetsr from
[GitHub](https://github.com/) with:

    devtools::install_github("richelbilderbeek/mhcnuggetsr")

Install MHCnuggets:

``` r
library(mhcnuggetsr)

if (!is_mhcnuggets_installed()) {
  install_mhcnuggets()
  mhcnuggetsr_self_test()
}
```

## Example

Here is how to get the IC50 values (in nM) for the peptides in an
example file:

``` r
library(testthat)
library(mhcnuggetsr)

if (is_mhcnuggets_installed()) {
  mhcnuggets_options <- create_mhcnuggets_options(
    mhc_class = "I",
    mhc = "HLA-A02:01"
  )
  
  df <- predict_ic50(
    peptides = "AIAACAMLLV",
    mhcnuggets_options = mhcnuggets_options
  )
  expect_equal(df$ic50, 5578.77)
}
```

## There is a feature I miss

See [CONTRIBUTING](CONTRIBUTING.md), at `Submitting use cases`

## I want to collaborate

See [CONTRIBUTING](CONTRIBUTING.md), at ‘Submitting code’

## I think I have found a bug

See [CONTRIBUTING](CONTRIBUTING.md), at ‘Submitting bugs’

## There’s something else I want to say

Sure, just add an Issue. Or send an email.

## External links

  - [MHCnuggets GitHub repo](https://github.com/KarchinLab/mhcnuggets)

## References

Article about MHCnuggets:

  - Shao, Xiaoshan M., et al. “High-throughput prediction of MHC class I
    and II neoantigens with MHCnuggets.” Cancer Immunology Research 8.3
    (2020): 396-408.
