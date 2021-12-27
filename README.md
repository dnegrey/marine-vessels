# marineDataApp

*Shiny application for visualizing marine vessel dataset*

**version 0.3.1**

----------

Before this application can be run, the data must be processed by running the executable *Rscript* `bin/mainExecute.R`. This script downloads the dataset and then runs some cleaning and calculation functions before ultimately writing out the application's main data object in the file `pub/main.RData`. The log for this script contains helpful information including notes at the end that describe whether the application was successfully refreshed. In addition to the log, the file `./success.txt` should contain only one line which reads "TRUE" if the application was successfully refreshed after running the script.

This project was built using [R](https://www.r-project.org/) version 3.6.3 for the **x86_64-pc-linux-gnu (64-bit)** platform. The following packages are required for the processing script described above:

* **readr** (version 1.3.1)
* **geodist** (version 0.0.4)
* **dplyr** (version 1.0.1)

The [Shiny](https://shiny.rstudio.com/) application leverages the three file setup (`./global.R`, `./ui.R` and `./server.R`) and requires the following packages:

* **shiny** (version 1.5.0)
* **shiny.semantic** (version 0.4.0)
* **dplyr** (version 1.0.1)
* **leaflet** (version 2.0.3)

Code testing leverages the **testthat** package (version 2.3.2) and can be run *(after running the processing script described above)* by sourcing `tests/testthat.R`.
