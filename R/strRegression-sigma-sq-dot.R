#' Error Variance
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @param beta Numeric vector.
#'   Partial regression slopes.
#' @param sigmaysq Numeric.
#'   Variance of the regressand variable.
#' @param sigmacapx Numeric matrix.
#'   COvariance matrix of the regressor variables.
#'
#' @return Returns a numeric value, the error variance.
#'
#' @examples
#' beta <- c(0.5, 0.3)
#' sigmacapx <- matrix(data = c(1, 0.2, 0.2, 2), nrow = 2)
#' sigmacap <- matrix(
#'   data = c(0.89, 0.56, 0.7, 0.56, 1, 0.2, 0.7, 0.2, 2),
#'   nrow = 3
#' )
#' strRegression:::.SigmaSq(beta = beta, sigmaysq = 0.89, sigmacapx = sigmacapx)
#'
#' @family Error Variance Functions
#' @keywords strRegression variance internal
#' @noRd
.SigmaSq <- function(beta,
                     sigmaysq,
                     sigmacapx) {
  .Vec(
    x = sigmaysq - crossprod(
      x = beta,
      y = sigmacapx
    ) %*% beta
  )
}
