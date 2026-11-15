## ---- test-strRegression-mu-y-dot
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
          object = strRegression:::.MuY(
            beta0 = 1,
            beta = c(0.5, 0.3),
            mux = c(2, 4)
          ),
          expected = 3.2
        )
        testthat::expect_equal(
          object = strRegression:::.MuY(beta0 = 1, beta = 2, mux = 3),
          expected = 7
        )
      }
    )
  },
  text = "test-strRegression-mu-y-dot"
)
