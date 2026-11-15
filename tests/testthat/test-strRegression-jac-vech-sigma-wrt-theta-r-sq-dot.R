## ---- test-strRegression-jac-vech-sigma-wrt-theta-r-sq-dot
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    testthat::skip_on_cran()
    message(text)
    testthat::test_that(
      desc = paste(text, "known values"),
      code = {
        f <- .StrFixture()
        func_rsq <- function(t) {
          sx <- strRegression:::.SymofVech(x = t[4:6], k = 2)
          b <- t[1:2]
          sxb <- as.vector(x = sx %*% b)
          strRegression:::.Vech(
            x = rbind(c(sum(b * sxb) / t[3], sxb), cbind(sxb, sx))
          )
        }
        theta_rsq <- c(
          f$beta,
          0.4,
          f$sigmacapx[lower.tri(x = f$sigmacapx, diag = TRUE)]
        )
        out <- strRegression:::.JacVechSigmaWRTThetaRSq(
          beta = f$beta,
          sigmacapx = f$sigmacapx,
          rsq = 0.4,
          k = 3,
          p = 2
        )
        testthat::expect_equal(object = dim(x = out), expected = c(6, 6))
        testthat::expect_equal(
          object = unname(obj = out),
          expected = unname(
            obj = numDeriv::jacobian(func = func_rsq, x = theta_rsq)
          ),
          tolerance = 1e-6
        )
        testthat::expect_equal(
          object = unname(obj = out),
          expected = unname(
            obj = strRegression:::.JacVechSigmaWRTTheta(
              beta = f$beta,
              sigmacapx = f$sigmacapx,
              q = 6,
              p = 2,
              rsq = 0.4
            )
          ),
          tolerance = 1e-8
        )
      }
    )
  },
  text = "test-strRegression-jac-vech-sigma-wrt-theta-r-sq-dot"
)
