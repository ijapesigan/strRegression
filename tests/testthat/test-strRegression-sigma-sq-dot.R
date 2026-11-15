## ---- test-strRegression-sigma-sq-dot
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
          object = strRegression:::.SigmaSq(
            beta = f$beta,
            sigmaysq = 0.89,
            sigmacapx = f$sigmacapx
          ),
          expected = 0.4
        )
        testthat::expect_equal(
          object = strRegression:::.SigmaSq(
            beta = 2,
            sigmaysq = 13,
            sigmacapx = matrix(data = 3)
          ),
          expected = 1
        )
      }
    )
  },
  text = "test-strRegression-sigma-sq-dot"
)
