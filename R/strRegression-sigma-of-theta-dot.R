#' Model-Implied Covariance Matrix
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @param beta Numeric vector
#'   \eqn{\boldsymbol{\beta}}.
#'   Partial regression slopes.
#' @param sigmasq Numeric vector of length 1
#'   \eqn{\sigma^{2}}.
#'   Error variance.
#' @param sigmacapx Numeric matrix
#'   \eqn{\boldsymbol{\Sigma}_{\boldsymbol{X}, \boldsymbol{X}}}.
#'   Covariance matrix of
#'   \eqn{X_{1}, \dots, X_{j}, \dots, X_{p}}.
#'
#' @return Returns the `k` by `k` model-implied covariance matrix
#'   of Y and the regressors.
#'
#' @examples
#' beta <- c(0.5, 0.3)
#' sigmacapx <- matrix(data = c(1, 0.2, 0.2, 2), nrow = 2)
#' sigmacap <- matrix(
#'   data = c(0.89, 0.56, 0.7, 0.56, 1, 0.2, 0.7, 0.2, 2),
#'   nrow = 3
#' )
#' strRegression:::.SigmaofTheta(
#'   beta = beta,
#'   sigmasq = 0.4,
#'   sigmacapx = sigmacapx
#' )
#'
#' @family Moments Functions
#' @keywords strRegression moments internal
#' @noRd
.SigmaofTheta <- function(beta,
                          sigmasq,
                          sigmacapx) {
  sigmaysq <- .SigmaYSq(
    beta = beta,
    sigmasq = sigmasq,
    sigmacapx = sigmacapx
  )
  sigmayx <- .SigmaYX(
    beta = beta,
    sigmacapx = sigmacapx
  )
  sigmacap <- rbind(
    sigmayx,
    sigmacapx
  )
  cbind(
    c(sigmaysq, sigmayx),
    sigmacap
  )
}
