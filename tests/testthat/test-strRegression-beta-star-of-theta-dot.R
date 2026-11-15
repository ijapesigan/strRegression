## ---- test-strRegression-beta-star-of-theta-dot
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
          object = strRegression:::.BetaStarofTheta(
            beta = f$beta,
            sigmasq = 0.4,
            sigmacapx = f$sigmacapx
          ),
          expected = f$betastar
        )
        testthat::expect_equal(
          object = strRegression:::.BetaStarofTheta(
            beta = 1,
            sigmasq = 0,
            sigmacapx = matrix(data = 4)
          ),
          expected = 1
        )
      }
    )
  },
  text = "test-strRegression-beta-star-of-theta-dot"
)
