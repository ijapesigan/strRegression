#' strRegression: Structure of Regression Functions
#'
#' Internal functions for the structure of a linear regression model
#' with random regressors:
#' the model-implied covariance matrix,
#' partial and standardized slopes,
#' R-squared and adjusted R-squared,
#' semipartial and partial correlations,
#' Cohen's f-squared,
#' and the Jacobian matrices of these quantities.
#' The functions have no input checks and are copied by other projects.
#'
#' @author Ivan Jacob Agaloos Pesigan
#' @aliases strRegression-package
#' @keywords internal
"_PACKAGE"

## usethis namespace: start
#' @importFrom Rcpp sourceCpp
#' @useDynLib strRegression, .registration = TRUE
## usethis namespace: end
NULL
