# strRegression: Structure of Regression Functions

## Description

Internal functions for the structure of a linear regression model with
random regressors in R (R Core Team, 2026): the model-implied covariance
matrix, partial and standardized slopes, R-squared and adjusted
R-squared, semipartial and partial correlations, Cohen’s f-squared, and
the Jacobian matrices of these quantities. The functions have no input
checks and are copied by other projects.

## Installation

You can install the development version of `strRegression` from
[GitHub](https://github.com/ijapesigan/strRegression) with:

\
`if`` ``(``!`[`require`](https://rdrr.io/r/base/library.html)`(`[`"pak"`](https://pak.r-lib.org/)`)``)`` `[`install.packages`](https://rdrr.io/r/utils/install.packages.html)`(``"pak"``)`\
`pak``::`[`pkg_install`](https://pak.r-lib.org/reference/pkg_install.html)`(``"ijapesigan/strRegression"``)`

## Example

The functions are internal, so they are called with `:::`. The
model-implied covariance matrix from the parameters of a regression with
two regressors.

\
`beta`` ``<-`` `[`c`](https://rdrr.io/r/base/c.html)`(``0.5``, ``0.3``)`\
`sigmacapx`` ``<-`` `[`matrix`](https://rdrr.io/r/base/matrix.html)`(``data ``=`` `[`c`](https://rdrr.io/r/base/c.html)`(``1``, ``0.2``, ``0.2``, ``2``)``, nrow ``=`` ``2``)`\
`sigmacap`` ``<-`` ``strRegression``:::``.SigmaofTheta``(`\
`  beta ``=`` ``beta``,`\
`  sigmasq ``=`` ``0.4``,`\
`  sigmacapx ``=`` ``sigmacapx`\
`)`\
`sigmacap`\
`#>         [,1] [,2] [,3]`\
`#> sigmayx 0.89 0.56  0.7`\
`#>         0.56 1.00  0.2`\
`#>         0.70 0.20  2.0`

R-squared and the standardized slopes from the covariance matrix.

\
`strRegression``:::``.RSqofSigma``(``sigmacap ``=`` ``sigmacap``, k ``=`` ``3``)`\
`#>   sigmayx `\
`#> 0.5505618`\
`strRegression``:::``.BetaStarofSigma``(`\
`  sigmacap ``=`` ``sigmacap``,`\
`  q ``=`` ``1`` ``/`` `[`sqrt`](https://rdrr.io/r/base/MathFun.html)`(``x ``=`` `[`diag`](https://rdrr.io/r/base/diag.html)`(``x ``=`` ``sigmacap``)``)``,`\
`  k ``=`` ``3`\
`)`\
`#> [1] 0.5299989 0.4497190`

## References

R Core Team. (2026). *R: A language and environment for statistical
computing*. R Foundation for Statistical Computing.
<https://www.R-project.org/>
