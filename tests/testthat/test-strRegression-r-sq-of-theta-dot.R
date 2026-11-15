## ---- test-strRegression-r-sq-of-theta-dot
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
          object = strRegression:::.RSqofTheta(theta = theta, k = 3),
          expected = 0.49 / 0.89
        )
        testthat::expect_equal(
          object = strRegression:::.RSqofTheta(theta = c(1, 1, 4), k = 2),
          expected = 4 / 5
        )
      }
    )
  },
  text = "test-strRegression-r-sq-of-theta-dot"
)
