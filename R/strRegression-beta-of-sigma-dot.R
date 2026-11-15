#' Partial Regression Slopes
#' (\eqn{\boldsymbol{\Sigma}})
#'
#' Calculate partial regression slopes
#' from the covariance matrix.
#'
#' @details Let the covariance matrix of \eqn{Y} and
#'   \eqn{\boldsymbol{X} = \left\{ X_{1}, \dots, X_{p} \right\}}
#'   be partitioned as follows
#'   \deqn{
#'     \boldsymbol{\Sigma}
#'     =
#'     \left(
#'     \begin{array}{cc}
#'     \sigma_{Y}^{2}
#'     &
#'     \boldsymbol{\sigma}_{Y \boldsymbol{X}} \\
#'     \boldsymbol{\sigma}_{\boldsymbol{X} Y}
#'     &
#'     \boldsymbol{\Sigma}_{\boldsymbol{X} \boldsymbol{X}}
#'     \end{array}
#'     \right) .
#'   }
#'   The vector of partial regression slopes
#'   is given by
#'   \deqn{
#'     \boldsymbol{\beta}
#'     =
#'     \boldsymbol{\Sigma}_{\boldsymbol{X} \boldsymbol{X}}^{-1}
#'     \boldsymbol{\sigma}_{Y \boldsymbol{X}} .
#'   }
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @param sigmacap Numeric matrix.
#'  \eqn{\boldsymbol{\Sigma}}.
#'   Covariance matrix of
#'   \eqn{\left\{ Y, X_{1}, \dots, X_{p} \right\}}.
#' @param k Positive integer.
#'   Dimension of the `k` by `k` covariance matrix.
#'
#' @return Returns a numeric vector of the `p` partial regression slopes.
#'
#' @examples
#' beta <- c(0.5, 0.3)
#' sigmacapx <- matrix(data = c(1, 0.2, 0.2, 2), nrow = 2)
#' sigmacap <- matrix(
#'   data = c(0.89, 0.56, 0.7, 0.56, 1, 0.2, 0.7, 0.2, 2),
#'   nrow = 3
#' )
#' strRegression:::.BetaofSigma(sigmacap = sigmacap, k = 3)
#'
#' @family Slopes Functions
#' @keywords strRegression slopes internal
#' @noRd
.BetaofSigma <- function(sigmacap,
                         k) {
  .Vec(
    x = solve(
      a = sigmacap[
        2:k,
        2:k,
        drop = FALSE
      ],
      b = sigmacap[
        2:k,
        1,
        drop = FALSE
      ]
    )
  )
}
