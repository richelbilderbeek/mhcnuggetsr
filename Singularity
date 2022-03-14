# The mhcnuggetsr R package, with MHCnuggets installed
Bootstrap: docker
From: rocker/tidyverse

%post
    # Install python3
    apt-get update
    apt-get install -y git wget python3-pip

    # python3 -m pip install --upgrade pip
    # Tip from Pavlin Mitev
    python3 -m pip install --no-cache-dir --upgrade pip

    apt-get -y install libssl-dev libcurl4-openssl-dev libxml2-dev git
    apt-get clean

    Rscript -e 'install.packages(c("remotes", "devtools"))'
    Rscript -e 'remotes::install_github("richelbilderbeek/ormr")'
    Rscript -e 'remotes::install_github("richelbilderbeek/mhcnuggetsr")'
    Rscript -e 'remotes::install_github("richelbilderbeek/mhcnuggetsrinstall")'
    Rscript -e 'mhcnuggetsrinstall::install_mhcnuggets(folder_name = "/opt/mhcnuggetsr", ormr_folder_name = "python3")'

%runscript
exec R --vanilla --silent --no-echo "$@"

%test
    Rscript -e 'mhcnuggetsr::mhcnuggetsr_report(folder_name = "/opt/mhcnuggetsr", ormr_folder_name = "python3")'

%help

This container has the R package mhcnuggetsr and MHCnuggets installed.

To make the container run a script called, e.g. `script.R`, do:

```
cat script.R | ./mhcnuggetsr.sif
```

Within the script, set `folder_name` to `/opt/mhcnuggetsr`, for example:

```
library(mhcnuggetsr)
mhcnuggetsr_report(folder_name = "/opt/mhcnuggetsr")
```

%labels

    AUTHOR Richel J.C. Bilderbeek

    NAME mhcnuggetsr
 
    DESCRIPTION The mhcnuggetsr R package, with MHCnuggets installed

    USAGE send the R stcript as text to the container

    URL https://github.com/richelbilderbeek/mhcnuggetsr

    VERSION 1.2
