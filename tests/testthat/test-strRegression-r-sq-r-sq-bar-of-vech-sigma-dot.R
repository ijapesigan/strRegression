## ---- test-strRegression-r-sq-r-sq-bar-of-vech-sigma-dot
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
        out <- strRegression:::.RSqRSqBarofVechSigma(
          vechsigmacap = f$vechsigmacap,
          k = 3,
          n = 100
        )
        testthat::expect_equal(
          object = out,
          expected = c(
            f$rsq,
            strRegression:::.RSqBar(rsq = f$rsq, k = 3, n = 100)
          )
        )
      }
    )
  },
  text = "test-strRegression-r-sq-r-sq-bar-of-vech-sigma-dot"
)
