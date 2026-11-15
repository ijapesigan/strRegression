## ---- test-strRegression-beta-star-of-vech-sigma-dot
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
          object = strRegression:::.BetaStarofVechSigma(
            vechsigmacap = f$vechsigmacap,
            k = 3
          ),
          expected = f$betastar
        )
      }
    )
  },
  text = "test-strRegression-beta-star-of-vech-sigma-dot"
)
