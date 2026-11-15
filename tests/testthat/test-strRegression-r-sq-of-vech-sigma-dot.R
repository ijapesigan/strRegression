## ---- test-strRegression-r-sq-of-vech-sigma-dot
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
          object = strRegression:::.RSqofVechSigma(
            vechsigmacap = f$vechsigmacap,
            k = 3
          ),
          expected = 0.49 / 0.89
        )
      }
    )
  },
  text = "test-strRegression-r-sq-of-vech-sigma-dot"
)
