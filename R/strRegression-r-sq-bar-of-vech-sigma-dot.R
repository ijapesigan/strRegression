#' Adjusted R-Squared as a Function
#' of the Half-Vectorization
#' of the Covariance Matrix
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @param vechsigmacap Numeric vector.
#'   Half-vectorization of the covariance matrix of
#'   \eqn{\left\{ Y, X_{1}, \dots, X_{p} \right\}^{\prime}}.
#' @param k Positive integer.
#'   `p` regressors plus 1.
#' @param n Positive integer.
#'   Sample size.
#'
#' @return Returns a numeric value, the adjusted R-squared.
#'
#' @examples
#' beta <- c(0.5, 0.3)
#' sigmacapx <- matrix(data = c(1, 0.2, 0.2, 2), nrow = 2)
#' sigmacap <- matrix(
#'   data = c(0.89, 0.56, 0.7, 0.56, 1, 0.2, 0.7, 0.2, 2),
#'   nrow = 3
#' )
#' vechsigmacap <- sigmacap[lower.tri(sigmacap, diag = TRUE)]
#' strRegression:::.RSqBarofVechSigma(
#'   vechsigmacap = vechsigmacap,
#'   k = 3,
#'   n = 100
#' )
#'
#' @family R-squared Functions
#' @keywords strRegression rsq internal
#' @noRd
.RSqBarofVechSigma <- function(vechsigmacap,
                               k,
                               n) {
  1 - (
    1 - .RSqofVechSigma(
      vechsigmacap = vechsigmacap,
      k = k
    )
  ) * ((n - 1) / (n - k))
}
