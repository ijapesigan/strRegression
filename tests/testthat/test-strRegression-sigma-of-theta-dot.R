## ---- test-strRegression-sigma-of-theta-dot
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
          object = unname(
            obj = strRegression:::.SigmaofTheta(
              beta = f$beta,
              sigmasq = 0.4,
              sigmacapx = f$sigmacapx
            )
          ),
          expected = f$sigmacap
        )
        testthat::expect_equal(
          object = unname(
            obj = strRegression:::.SigmaofTheta(
              beta = 2,
              sigmasq = 1,
              sigmacapx = matrix(data = 3)
            )
          ),
          expected = matrix(data = c(13, 6, 6, 3), nrow = 2)
        )
      }
    )
  },
  text = "test-strRegression-sigma-of-theta-dot"
)
