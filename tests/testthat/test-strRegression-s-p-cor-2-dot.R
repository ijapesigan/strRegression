## ---- test-strRegression-s-p-cor-2-dot
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
          object = strRegression:::.SPCor2(
            betastar = f$betastar,
            sigmacapx = f$sigmacapx
          ),
          expected = strRegression:::.SPCor(
            betastar = f$betastar,
            sigmacapx = f$sigmacapx
          )
        )
        testthat::expect_equal(
          object = strRegression:::.SPCor2(
            betastar = f$betastar,
            sigmacapx = f$sigmacapx
          )^2,
          expected = f$srsq
        )
      }
    )
  },
  text = "test-strRegression-s-p-cor-2-dot"
)
