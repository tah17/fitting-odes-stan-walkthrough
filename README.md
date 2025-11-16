# fitting-odes-stan-walkthrough

## Table of contents
* [Introduction](#Introduction)
* [Technologies](#Technologies)
* [Setup](#Setup)
* [Usage](#Usage)
* [License](#License)
* [Reference](#Reference)

## Introduction
This repository is intended to be a walkthrough of fitting Ordinary Differential Equation (ODE) models in RStan for anyone who is new to fitting ODEs using Stan. The main files for the walkthrough are the R markdown script and rendered html file. Technical explanations follow those in the Bayesian Data Analysis textbook (Gelman _et al._ 2013) and code examples follow advice given in the [Stan](https://mc-stan.org/docs/stan-users-guide/) user manual.

## Technologies
The code is written in R (v4.4.1) and Stan. Details of the R packages are in the [renv.lock](renv.lock) file.

## Setup
First, clone or download the repository to your machine. To download the correct versions of the R packages use the renv package. There are detailed instructions on how to use renv on the package [website](https://rstudio.github.io/renv/articles/renv.html) but, briefly, to install the correct packages, navigate to the repository folder and run the following in the R console:

```
renv::restore()
```

Or, navigate to the repository folder in the terminal and run:

```
Rscript -e "renv::restore()"
```

## Usage
The [`fit_ode_walkthrough.Rmd`](fit_ode_walkthrough.Rmd) file is an R markdown file that contains the walkthrough on fitting an ODE using RStan. This file can be used to interactively run the code in the example. Alternatively, the rendered [`fit_ode_walkthrough.html`](fit_ode_walkthrough.html) can instead be used to read the walkthrough in a less interactive manner using any browser. The [`fit_ode_walkthrough.Rmd`](fit_ode_walkthrough.Rmd) and [`fit_ode_walkthrough.html`](fit_ode_walkthrough.html) files use the following files provided in this repository: the Stan model ([`logistic.stan`](logistic.stan)), previously generated fake data (`logistic_data.Rda`) and some of the parameters used to generate the fake data (`true_logistic_params.Rda`).

## License
Licensed under the MIT license. See [LICENSE](LICENSE) for more information.

## Reference
Gelman, Andrew, John B. Carlin, Hal S. Stern, David B. Dunson, Aki Vehtari, and Donald B. Rubin. 2013. Bayesian Data Analysis, Third Edition. Bayesian Data Analysis, Third Edition. Chapman; Hall/CRC.