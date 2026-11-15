## ---- test-strRegression-r-sq-bar-of-vech-sigma-dot
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
        testthat::expect_equal(
          object = strRegression:::.RSqBarofVechSigma(
            vechsigmacap = f$vechsigmacap,
            k = 3,
            n = 100
          ),
          expected = strRegression:::.RSqBar(rsq = f$rsq, k = 3, n = 100)
        )
      }
    )
  },
  text = "test-strRegression-r-sq-bar-of-vech-sigma-dot"
)
