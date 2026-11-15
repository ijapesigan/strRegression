#' Jacobian Matrix of R-Squared and Adjusted R-Squared
#' with Respect to the Half-Vectorization
#' of the Covariance Matrix
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @param x Numeric vector.
#'   Half-vectorization of the covariance matrix of
#'   \eqn{\left\{ Y, X_{1}, \dots, X_{p} \right\}^{\prime}}.
#' @param k Positive integer.
#'   `p` regressors plus 1.
#' @param n Positive integer.
#'   Sample size.
#'
#' @return Returns a matrix.
#' @examples
#' beta <- c(0.5, 0.3)
#' sigmacapx <- matrix(data = c(1, 0.2, 0.2, 2), nrow = 2)
#' sigmacap <- matrix(
#'   data = c(0.89, 0.56, 0.7, 0.56, 1, 0.2, 0.7, 0.2, 2),
#'   nrow = 3
#' )
#' vechsigmacap <- sigmacap[lower.tri(sigmacap, diag = TRUE)]
#' strRegression:::.JacRSqRSqBarWRTVechSigma(x = vechsigmacap, k = 3, n = 100)
#'
#' @family Derivatives Functions
#' @keywords strRegression derivatives internal
#' @noRd
.JacRSqRSqBarWRTVechSigma <- function(x,
                                      k,
                                      n) {
  numDeriv::jacobian(
    func = .RSqRSqBarofVechSigma,
    x = x,
    k = k,
    n = n
  )
}
