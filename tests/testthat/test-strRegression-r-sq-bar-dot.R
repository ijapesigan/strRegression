## ---- test-strRegression-r-sq-bar-dot
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
          object = strRegression:::.RSqBar(rsq = 0.5, k = 3, n = 100),
          expected = 1 - 0.5 * 99 / 97
        )
        testthat::expect_equal(
          object = strRegression:::.RSqBar(rsq = 0, k = 2, n = 11),
          expected = 1 - 10 / 9
        )
      }
    )
  },
  text = "test-strRegression-r-sq-bar-dot"
)
