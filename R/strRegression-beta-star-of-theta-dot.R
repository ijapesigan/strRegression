#' Standardized Partial Regression Slopes of
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
#' @return Returns a vector.
#' @examples
#' beta <- c(0.5, 0.3)
#' sigmacapx <- matrix(data = c(1, 0.2, 0.2, 2), nrow = 2)
#' sigmacap <- matrix(
#'   data = c(0.89, 0.56, 0.7, 0.56, 1, 0.2, 0.7, 0.2, 2),
#'   nrow = 3
#' )
#' strRegression:::.BetaStarofTheta(
#'   beta = beta,
#'   sigmasq = 0.4,
#'   sigmacapx = sigmacapx
#' )
#'
#' @family Standardized Slopes Functions
#' @keywords strRegression slopesstd internal
#' @noRd
.BetaStarofTheta <- function(beta,
                             sigmasq,
                             sigmacapx) {
  .Vec(
    x = (
      sqrt(
        x = diag(x = sigmacapx)
      ) / sqrt(
        x = .SigmaYSq(
          beta = beta,
          sigmasq = sigmasq,
          sigmacapx = sigmacapx
        )
      )
    ) * beta
  )
}
