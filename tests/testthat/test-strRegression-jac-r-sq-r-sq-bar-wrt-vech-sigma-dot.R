## ---- test-strRegression-jac-r-sq-r-sq-bar-wrt-vech-sigma-dot
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
        out <- strRegression:::.JacRSqRSqBarWRTVechSigma(
          x = f$vechsigmacap,
          k = 3,
          n = 100
        )
        num <- numDeriv::jacobian(func = function(v) {
          strRegression:::.RSqofVechSigma(vechsigmacap = v, k = 3)
        }, x = f$vechsigmacap)
        testthat::expect_equal(object = dim(x = out), expected = c(2, 6))
        testthat::expect_equal(
          object = out[1, ],
          expected = as.vector(x = num),
          tolerance = 1e-6
        )
        testthat::expect_equal(
          object = out[2, ],
          expected = as.vector(x = num) * 99 / 97,
          tolerance = 1e-6
        )
      }
    )
  },
  text = "test-strRegression-jac-r-sq-r-sq-bar-wrt-vech-sigma-dot"
)
