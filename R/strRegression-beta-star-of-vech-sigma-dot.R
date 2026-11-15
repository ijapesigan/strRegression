#' Standardized Partial Regression Slopes of
#' \eqn{\operatorname{vech} \left( \boldsymbol{\Sigma} \right)}
#'
#' Calculate standardized partial regression slopes
#' from the half-vectorization of the covariance matrix.
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @param vechsigmacap Numeric vector
#'   Half-vectorization of the covariance matrix of
#'   \eqn{\left\{ Y, X_{1}, \dots, X_{p} \right\}}.
#' @param k Positive integer.
#'   Dimension of the `k` by `k` covariance matrix.
#'
#' @return Returns a vector.
#' @examples
#' beta <- c(0.5, 0.3)
#' sigmacapx <- matrix(data = c(1, 0.2, 0.2, 2), nrow = 2)
#' sigmacap <- matrix(
#'   data = c(0.89, 0.56, 0.7, 0.56, 1, 0.2, 0.7, 0.2, 2),
#'   nrow = 3
#' )
#' vechsigmacap <- sigmacap[lower.tri(sigmacap, diag = TRUE)]
#' strRegression:::.BetaStarofVechSigma(vechsigmacap = vechsigmacap, k = 3)
#'
#' @family Standardized Slopes Functions
#' @keywords strRegression slopesstd internal
#' @noRd
.BetaStarofVechSigma <- function(vechsigmacap,
                                 k) {
  sigmacap <- .SymofVech(
    x = vechsigmacap,
    k = k
  )
  .BetaStarofSigma(
    sigmacap = sigmacap,
    q = 1 / sqrt(x = diag(x = sigmacap)),
    k = k
  )
}
