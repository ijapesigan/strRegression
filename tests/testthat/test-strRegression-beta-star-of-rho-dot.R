## ---- test-strRegression-beta-star-of-rho-dot
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    testthat::skip_on_cran()
    message(text)
    testthat::test_that(
      desc = paste(text, "known values"),
      code = {
        rhocap <- matrix(
          data = c(1, 0.5, 0.4, 0.5, 1, 0.3, 0.4, 0.3, 1),
          nrow = 3
        )
        testthat::expect_equal(
          object = strRegression:::.BetaStarofRho(rhocap = rhocap, k = 3),
          expected = as.vector(
            x = solve(a = rhocap[2:3, 2:3], b = rhocap[2:3, 1])
          )
        )
        testthat::expect_equal(
          object = strRegression:::.BetaStarofRho(
            rhocap = matrix(data = c(1, 0.6, 0.6, 1), nrow = 2),
            k = 2
          ),
          expected = 0.6
        )
      }
    )
  },
  text = "test-strRegression-beta-star-of-rho-dot"
)
