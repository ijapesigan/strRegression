#' Semipartial Correlation
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @param betastar Numeric vector.
#'   Standardized regression slopes.
#' @param sigmacapx Numeric matrix.
#'   Covariance matrix of
#'   \eqn{\left\{ X_{1}, \dots, X_{p} \right\}^{\prime}}.
#'
#' @return Returns a numeric vector of the semipartial correlations.
#'
#' @examples
#' beta <- c(0.5, 0.3)
#' sigmacapx <- matrix(data = c(1, 0.2, 0.2, 2), nrow = 2)
#' sigmacap <- matrix(
#'   data = c(0.89, 0.56, 0.7, 0.56, 1, 0.2, 0.7, 0.2, 2),
#'   nrow = 3
#' )
#' strRegression:::.SPCor2(betastar = c(0.4, 0.3), sigmacapx = sigmacapx)
#'
#' @family Semipartial Correlation Functions
#' @keywords strRegression spcor internal
#' @noRd
.SPCor2 <- function(betastar,
                    sigmacapx) {
  p <- dim(x = sigmacapx)[1]
  idx <- seq_len(length.out = p)
  rsq <- rep(x = 0.0, times = p)
  for (i in idx) {
    rsq[i] <- .RSqofSigma(
      sigmacap = sigmacapx[
        c(i, idx[!idx %in% i]),
        c(i, idx[!idx %in% i])
      ],
      k = p
    )
  }
  betastar * sqrt(
    x = 1 - rsq
  )
}
