## ---- test-strRegression-sigma-yx-dot
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
          object = strRegression:::.SigmaYX(
            beta = f$beta,
            sigmacapx = f$sigmacapx
          ),
          expected = c(0.56, 0.7)
        )
        testthat::expect_equal(
          object = strRegression:::.SigmaYX(
            beta = 2,
            sigmacapx = matrix(data = 3)
          ),
          expected = 6
        )
      }
    )
  },
  text = "test-strRegression-sigma-yx-dot"
)
