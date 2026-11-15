## ---- test-strRegression-s-p-cor-dot
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
          object = strRegression:::.SPCor(
            betastar = f$betastar,
            sigmacapx = f$sigmacapx
          )^2,
          expected = f$srsq
        )
        testthat::expect_equal(
          object = strRegression:::.SPCor(
            betastar = 0.5,
            sigmacapx = matrix(data = 4)
          ),
          expected = 0.5
        )
      }
    )
  },
  text = "test-strRegression-s-p-cor-dot"
)
