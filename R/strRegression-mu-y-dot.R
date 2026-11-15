#' Mean of Y
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @param beta0 Numeric
#'   \eqn{\beta_{0}}.
#'   Intercept.
#' @param beta Numeric vector
#'   \eqn{\boldsymbol{\beta}}.
#'   Partial regression slopes.
#' @param mux Numeric vector.
#'   Mean vector of
#'   \eqn{X_{1}, \dots, X_{j}, \dots, X_{p}}.
#'
#' @return Returns a numeric value, the mean of Y.
#'
#' @examples
#' strRegression:::.MuY(beta0 = 1, beta = c(0.5, 0.3), mux = c(2, 4))
#'
#' @family Mean Functions
#' @keywords strRegression mu internal
#' @noRd
.MuY <- function(beta0,
                 beta,
                 mux) {
  .Vec(
    x = beta0 + crossprod(
      x = beta,
      y = mux
    )
  )
}
