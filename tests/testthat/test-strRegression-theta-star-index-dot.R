## ---- test-strRegression-theta-star-index-dot
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    testthat::skip_on_cran()
    message(text)
    testthat::test_that(
      desc = paste(text, "known values"),
      code = {
        out <- strRegression:::.ThetaStarIndex(p = 3)
        testthat::expect_equal(
          object = names(x = out),
          expected = c(
            "betastar",
            "sigmay",
            "sigmax",
            "vechsrhocapx",
            "sigmastarsq",
            "muy",
            "mux"
          )
        )
        testthat::expect_equal(
          object = out$vechsrhocapx,
          expected = c("rhox2x1", "rhox3x1", "rhox3x2")
        )
        out1 <- strRegression:::.ThetaStarIndex(p = 1)
        testthat::expect_equal(
          object = names(x = out1),
          expected = c(
            "betastar",
            "sigmay",
            "sigmax",
            "sigmastarsq",
            "muy",
            "mux"
          )
        )
        testthat::expect_equal(object = out1$sigmax, expected = "sigmax1")
      }
    )
  },
  text = "test-strRegression-theta-star-index-dot"
)
