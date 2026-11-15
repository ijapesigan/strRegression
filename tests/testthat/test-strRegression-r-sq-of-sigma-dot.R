## ---- test-strRegression-r-sq-of-sigma-dot
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
          object = strRegression:::.RSqofSigma(sigmacap = f$sigmacap, k = 3),
          expected = 0.49 / 0.89
        )
        testthat::expect_equal(
          object = strRegression:::.RSqofSigma(
            sigmacap = matrix(data = c(4, 2, 2, 9), nrow = 2),
            k = 2
          ),
          expected = 4 / 36
        )
      }
    )
  },
  text = "test-strRegression-r-sq-of-sigma-dot"
)
