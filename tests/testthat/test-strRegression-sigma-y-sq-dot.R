## ---- test-strRegression-sigma-y-sq-dot
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
          object = strRegression:::.SigmaYSq(
            beta = f$beta,
            sigmasq = 0.4,
            sigmacapx = f$sigmacapx
          ),
          expected = 0.89
        )
        testthat::expect_equal(
          object = strRegression:::.SigmaYSq(
            beta = 2,
            sigmasq = 1,
            sigmacapx = matrix(data = 3)
          ),
          expected = 13
        )
      }
    )
  },
  text = "test-strRegression-sigma-y-sq-dot"
)
