# A Potential Protective Effect of Cannabis Use on the Development of HIV Drug Resistance Mutations

**Short Title:** Effect of Cannabis on HIV Drug Resistance Mutations

This repository contains the data and analysis for the manuscript **"A Potential Protective Effect of Cannabis Use on the Development of HIV Drug Resistance Mutations"** submitted to *NeuroImmune Pharmacol. Ther.* by Jonathan F. Hale, Shellynea Reynolds, Mohammed M. Benmassaoud, Roberto D. Palella, Kelly A. Smith, Daohai Yu, Servio H. Ramirez, and Allison M. Andrews (2023). The primary analysis is focused on logistic regression model selection and fitting to assess the effect of substance use (including cannabis) on Antiviral Drug Resistance Mutations (AVDRM) in HIV patients.

## Repository Structure

```plaintext  
.
├── code
│   └── AVDRM_SubstanceUse.LogisticRegressionModeling.Rmd
├── data
│   └── TableS1.csv #This file is hidden prior to publication. Email `hkates@ufl.edu` for access.
├── original_data
│   └── Hale2023_originalData.csv #This file is hidden prior to publication. Email `hkates@ufl.edu` for access.
└── results
    ├── Table2.csv
    └── TableS2.csv
```  

### Directory Breakdown:
- **`code/`**  
  Contains the R markdown file used for the logistic regression model selection and fitting process:
  - **`AVDRM_SubstanceUse.LogisticRegressionModeling.Rmd`**: The main analysis script for fitting logistic regression models to evaluate the effect of substance use on AVDRM.
  
- **`data/`**  
  Contains data files that have been processed or generated for inclusion in the manuscript:
  - **`TableS1.csv`**: Processed data used for the statistical analysis included in the manuscript.

- **`original_data/`**  
  Contains the raw data file used in this study:
  - **`Hale2023_originalData.csv`**: Original dataset including the necessary variables for the logistic regression analysis (substance use, AVDRM, and covariates).

- **`results/`**  
  Contains the results generated from the analysis:
  - **`Table2.csv`**: Results from the best fitting model included as **Table 2** in the manuscript, summarizing the regression models.
  - **`TableS2.csv`**: Supplementary table, **Table S2**, with model fit metrics and significant predictors, if any, from all models tested.

## Analysis Summary

The analysis explores the relationship between substance use (including cannabis) and the presence of Antiviral Drug Resistance Mutations (AVDRM) in individuals with HIV. The primary statistical technique employed is logistic regression, which allows for the modeling of binary outcomes (i.e., presence or absence of AVDRM) based on a set of predictors such as substance use and other relevant covariates. The analysis script (`AVDRM_SubstanceUse.LogisticRegressionModeling.Rmd`) details the step-by-step approach to model selection, fitting, and result interpretation.

Key aspects covered in the analysis include:
- Model selection using AIC and BIC criteria
- Evaluating model fit using goodness-of-fit tests and residual diagnostics
- Estimating the effect of cannabis and other substances on AVDRM

## Usage

To reproduce the analysis:
1. Clone the repository.
2. Open and run the `code/AVDRM_SubstanceUse.LogisticRegressionModeling.Rmd` file in RStudio.
3. The script will read in the original data from `originaldata/TableS1.csv` and output results to the `results/` directory.

### Requirements:
- R version 4.0 or higher
- R packages: `dplyr`, `ggplot2`, `logistf`, `tidyr`, and `DT`

## Citation

If you use this repository in your work, please cite it as follows:

Hale, J.F., Reynolds, S., Benmassaoud, M.M., Palella, R.D., Smith, K.A., Yu, D., Ramirez, S.H., and Andrews, A.M. (2023). A Potential Protective Effect of Cannabis Use on the Development of HIV Drug Resistance Mutations. *NeuroImmune Pharmacol. Ther.*.

