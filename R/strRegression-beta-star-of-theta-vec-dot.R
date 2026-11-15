#' Standardized Partial Regression Slopes
#' \eqn{\boldsymbol{\theta}}
#'
#' Calculate standardized partial regression slopes
#' from the parameter vector.
#'
#' @details Let the parameter vector
#'   be given by
#'   \deqn{
#'     \boldsymbol{\theta}
#'     =
#'     \left(
#'     \begin{array}{c}
#'       \boldsymbol{\beta} \\
#'       \sigma^{2},
#'       \operatorname{vech}
#'       \left(
#'       \boldsymbol{\Sigma}_{\boldsymbol{X} \boldsymbol{X}}
#'       \right)
#'     \end{array}
#'     \right) .
#'   }
#'   The vector of standardized partial regression slopes
#'   is given by
#'   \deqn{
#'     \boldsymbol{\beta}^{\ast}
#'     =
#'     \left(
#'       \sigma^{2}
#'       +
#'       \boldsymbol{\beta}^{\prime}
#'       \boldsymbol{\Sigma}_{\boldsymbol{X} \boldsymbol{X}}
#'       \boldsymbol{\beta}
#'     \right)^{-1}
#'     \operatorname{diag}
#'     \left(
#'       \boldsymbol{\sigma}_{\boldsymbol{X}}
#'     \right)
#'     \boldsymbol{\beta} .
#'   }
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @param theta Numeric vector
#'   \eqn{\boldsymbol{\theta}}.
#'   Parameter vector.
#' @param q Positive integer.
#'   Length of `theta`.
#' @param p Positive integer.
#'   Number of regressors.
#' @param k Positive integer.
#'   `k = p + 1`.
#'
#' @return Returns a vector.
#' @examples
#' beta <- c(0.5, 0.3)
#' sigmacapx <- matrix(data = c(1, 0.2, 0.2, 2), nrow = 2)
#' sigmacap <- matrix(
#'   data = c(0.89, 0.56, 0.7, 0.56, 1, 0.2, 0.7, 0.2, 2),
#'   nrow = 3
#' )
#' theta <- c(beta, 0.4, sigmacapx[lower.tri(sigmacapx, diag = TRUE)])
#' strRegression:::.BetaStarofThetaVec(theta = theta, q = 6, p = 2, k = 3)
#'
#' @family Standardized Slopes Functions
#' @keywords strRegression slopesstd internal
#' @noRd
.BetaStarofThetaVec <- function(theta,
                                q,
                                p,
                                k) {
  beta <- theta[1:p]
  sigmasq <- theta[k]
  sigmacapx <- matrix(
    data = 0,
    nrow = p,
    ncol = p
  )
  sigmacapx[lower.tri(x = sigmacapx, diag = TRUE)] <- theta[
    (k + 1):q
  ]
  upper <- upper.tri(x = sigmacapx)
  sigmacapx[upper] <- t(x = sigmacapx)[upper]
  .BetaStarofTheta(
    beta = beta,
    sigmasq = sigmasq,
    sigmacapx = sigmacapx
  )
}
