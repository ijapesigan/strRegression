## ---- test-strRegression-beta-of-sigma-dot
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
          object = strRegression:::.BetaofSigma(sigmacap = f$sigmacap, k = 3),
          expected = f$beta
        )
        testthat::expect_equal(
          object = strRegression:::.BetaofSigma(
            sigmacap = matrix(data = c(4, 2, 2, 9), nrow = 2),
            k = 2
          ),
          expected = 2 / 9
        )
      }
    )
  },
  text = "test-strRegression-beta-of-sigma-dot"
)
