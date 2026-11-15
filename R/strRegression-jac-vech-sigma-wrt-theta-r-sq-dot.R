#' Jacobian Matrix of the Half-Vectorization
#' of the Model-Implied Covariance Matrix
#' with Respect to the Parameter Vector (R-Squared)
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @param beta Numeric vector.
#'   Partial regression slopes.
#' @param sigmacapx Numeric matrix.
#'   Covariance matrix of the regressor variables.
#' @param rsq Numeric.
#'   R-squared.
#' @param k Positive integer.
#'   `p` regressors plus 1.
#' @param p Positive integer.
#'   `p` regressors.
#'
#' @return Returns a matrix.
#' @examples
#' beta <- c(0.5, 0.3)
#' sigmacapx <- matrix(data = c(1, 0.2, 0.2, 2), nrow = 2)
#' sigmacap <- matrix(
#'   data = c(0.89, 0.56, 0.7, 0.56, 1, 0.2, 0.7, 0.2, 2),
#'   nrow = 3
#' )
#' strRegression:::.JacVechSigmaWRTThetaRSq(
#'   beta = beta,
#'   sigmacapx = sigmacapx,
#'   rsq = 0.4,
#'   k = 3,
#'   p = 2
#' )
#'
#' @family Derivatives Functions
#' @keywords strRegression derivatives internal
#' @noRd
.JacVechSigmaWRTThetaRSq <- function(beta,
                                     sigmacapx,
                                     rsq,
                                     k,
                                     p) {
  ks <- k * (k + 1) / 2
  ps <- p * (p + 1) / 2
  zp <- matrix(
    data = 0,
    nrow = p,
    ncol = p
  )
  zk <- matrix(
    data = 0,
    nrow = k,
    ncol = k
  )
  vp <- matrix(
    data = 0,
    nrow = p,
    ncol = 1
  )
  vps <- matrix(
    data = 0,
    nrow = 1,
    ncol = ps
  )
  jcap <- matrix(
    data = 0,
    nrow = ks,
    ncol = ks
  )
  j <- 1
  for (i in seq_len(length.out = p)) {
    vpbeta <- vp
    vpbeta[i, 1] <- 1
    tmp <- (
      (
        (
          t(x = vpbeta) %*% sigmacapx %*% beta
        ) + (
          t(x = beta) %*% sigmacapx %*% vpbeta
        )
      ) / rsq
    )
    col1 <- c(
      tmp,
      sigmacapx[, i]
    )
    col2 <- rbind(
      sigmacapx[, i],
      zp
    )
    jcap[, j] <- t(
      x = .Vech(
        x = cbind(
          col1,
          col2
        )
      )
    )
    j <- j + 1
  }
  zk[1, 1] <- (
    -(
      t(x = beta) %*% sigmacapx %*% beta
    ) / rsq^2
  )
  jcap[, j] <- t(x = .Vech(x = zk))
  j <- j + 1
  for (i in seq_len(length.out = ps)) {
    zksigmacapx <- vps
    zksigmacapx[1, i] <- 1
    sym <- .SymofVech(
      x = zksigmacapx,
      k = p
    )
    tmp <- sym %*% beta
    col1 <- c(
      (
        (t(x = beta) %*% tmp) / rsq
      ),
      tmp
    )
    col2 <- rbind(
      t(x = tmp),
      sym
    )
    jcap[, j] <- t(
      x = .Vech(
        x = cbind(
          col1,
          col2
        )
      )
    )
    j <- j + 1
  }
  jcap
}
