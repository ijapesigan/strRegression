## ---- test-strRegression-beta-star-of-theta-vec-dot
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
        theta <- c(
          f$beta,
          0.4,
          f$sigmacapx[lower.tri(x = f$sigmacapx, diag = TRUE)]
        )
        testthat::expect_equal(
          object = strRegression:::.BetaStarofThetaVec(
            theta = theta,
            q = 6,
            p = 2,
            k = 3
          ),
          expected = f$betastar
        )
        testthat::expect_equal(
          object = strRegression:::.BetaStarofThetaVec(
            theta = c(1, 0, 4),
            q = 3,
            p = 1,
            k = 2
          ),
          expected = 1
        )
      }
    )
  },
  text = "test-strRegression-beta-star-of-theta-vec-dot"
)
