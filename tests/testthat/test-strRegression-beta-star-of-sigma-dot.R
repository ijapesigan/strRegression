## ---- test-strRegression-beta-star-of-sigma-dot
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
          object = strRegression:::.BetaStarofSigma(
            sigmacap = f$sigmacap,
            q = 1 / sqrt(x = diag(x = f$sigmacap)),
            k = 3
          ),
          expected = f$betastar
        )
        testthat::expect_equal(
          object = strRegression:::.BetaStarofSigma(
            sigmacap = matrix(data = c(4, 1.2, 1.2, 9), nrow = 2),
            q = c(0.5, 1 / 3),
            k = 2
          ),
          expected = 0.2
        )
      }
    )
  },
  text = "test-strRegression-beta-star-of-sigma-dot"
)
