## ---- test-strRegression-beta-star-select-dot
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    testthat::skip_on_cran()
    message(text)
    testthat::test_that(
      desc = paste(text, "known values"),
      code = {
        betastar <- c(0.4, 0.3)
        testthat::expect_equal(
          object = strRegression:::.BetaStarSelect(
            betastar = betastar,
            sigmay = 2,
            sigmax = c(1, 4),
            std_y = TRUE,
            std_x = c(TRUE, TRUE)
          ),
          expected = betastar
        )
        testthat::expect_equal(
          object = strRegression:::.BetaStarSelect(
            betastar = betastar,
            sigmay = 2,
            sigmax = c(1, 4),
            std_y = FALSE,
            std_x = c(TRUE, FALSE)
          ),
          expected = c(0.8, 0.15)
        )
        m <- rbind(betastar, 2 * betastar)
        out <- strRegression:::.BetaStarSelect(
          betastar = m,
          sigmay = c(2, 3),
          sigmax = matrix(data = c(1, 1, 4, 4), nrow = 2),
          std_y = FALSE,
          std_x = c(TRUE, FALSE)
        )
        testthat::expect_equal(
          object = unname(obj = out),
          expected = rbind(c(0.8, 0.15), c(2.4, 0.45))
        )
      }
    )
  },
  text = "test-strRegression-beta-star-select-dot"
)
