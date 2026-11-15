## ---- test-strRegression-beta-star-dot
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    testthat::skip_on_cran()
    message(text)
    testthat::test_that(
      desc = paste(text, "known values"),
      code = {
        testthat::expect_equal(
          object = strRegression:::.BetaStar(
            beta = c(0.5, 0.3),
            sigmay = 2,
            sigmax = c(1, 4)
          ),
          expected = c(0.25, 0.6)
        )
        testthat::expect_equal(
          object = strRegression:::.BetaStar(beta = 2, sigmay = 4, sigmax = 2),
          expected = 1
        )
      }
    )
  },
  text = "test-strRegression-beta-star-dot"
)
