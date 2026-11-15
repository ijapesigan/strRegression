#' R-Squared as a Function
#' of the parameter vector
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @param theta Numeric vector.
#'   \eqn{\theta = \left\{
#'     \boldsymbol{\beta},
#'     \sigma^{2},
#'     \operatorname{vech} \left(
#'     \boldsymbol{\Sigma}_{\boldsymbol{X} \boldsymbol{X}}
#'     \right)
#'     \right\}}
#' @param k Positive integer.
#'   `p` regressors plus 1.
#'
#' @return Returns a numeric value, R-squared.
#'
#' @examples
#' beta <- c(0.5, 0.3)
#' sigmacapx <- matrix(data = c(1, 0.2, 0.2, 2), nrow = 2)
#' sigmacap <- matrix(
#'   data = c(0.89, 0.56, 0.7, 0.56, 1, 0.2, 0.7, 0.2, 2),
#'   nrow = 3
#' )
#' theta <- c(beta, 0.4, sigmacapx[lower.tri(sigmacapx, diag = TRUE)])
#' strRegression:::.RSqofTheta(theta = theta, k = 3)
#'
#' @family R-squared Functions
#' @keywords strRegression rsq internal
#' @noRd
.RSqofTheta <- function(theta,
                        k) {
  p <- k - 1
  sigmacap <- matrix(
    data = 0.0,
    nrow = k,
    ncol = k
  )
  beta <- theta[1:p]
  sigmasq <- theta[k]
  sigmacapx <- .SymofVech(
    x = theta[(k + 1):length(x = theta)],
    k = p
  )
  sigmacap[2:k, 2:k] <- sigmacapx
  sigmacap[1, 1] <- .SigmaYSq(
    beta = beta,
    sigmasq = sigmasq,
    sigmacapx = sigmacapx
  )
  sigmacap[1, 2:k] <- sigmacap[2:k, 1] <- .SigmaYX(
    beta = beta,
    sigmacapx = sigmacapx
  )
  .RSqofSigma(
    sigmacap = sigmacap,
    k = k
  )
}
