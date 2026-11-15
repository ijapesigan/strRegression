## ---- test-strRegression-std-x-index-dot
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    testthat::skip_on_cran()
    message(text)
    testthat::test_that(
      desc = paste(text, "known values"),
      code = {
        xnames <- c("x1", "x2", "x3")
        testthat::expect_equal(
          object = strRegression:::.StdXIndex(std_x = NULL, xnames = xnames),
          expected = c(TRUE, TRUE, TRUE)
        )
        testthat::expect_equal(
          object = strRegression:::.StdXIndex(
            std_x = c("x1", "x3"),
            xnames = xnames
          ),
          expected = c(TRUE, FALSE, TRUE)
        )
        testthat::expect_equal(
          object = strRegression:::.StdXIndex(
            std_x = character(length = 0),
            xnames = xnames
          ),
          expected = c(FALSE, FALSE, FALSE)
        )
        testthat::expect_error(
          object = strRegression:::.StdXIndex(std_x = "z", xnames = xnames)
        )
        testthat::expect_error(
          object = strRegression:::.StdXIndex(std_x = 2, xnames = xnames)
        )
      }
    )
  },
  text = "test-strRegression-std-x-index-dot"
)
