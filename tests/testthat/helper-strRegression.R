# Shared test helpers (testthat sources helper-*.R before the tests).
# rProject writes this file once; it is yours after that.

# Slow tests: run on CI and on request, skipped in local builds and on CRAN.
.SkipSlow <- function() {
  testthat::skip_on_cran()
  testthat::skip_if_not(
    condition = Sys.getenv(x = "CI") == "true" ||
      Sys.getenv(x = "RPROJECT_SLOW_TESTS") == "true",
    message = "set RPROJECT_SLOW_TESTS=true to run slow tests"
  )
}

# Proprietary software: never on CI or CRAN, and only where it is found.
.SkipIfMissing <- function(program) {
  testthat::skip_on_cran()
  testthat::skip_on_ci()
  testthat::skip_if(
    condition = Sys.which(names = program) == "",
    message = paste0(program, " is not installed")
  )
}

# Fixture: a regression with p = 2 regressors (k = 3); the numbers are exact.
# beta = (0.5, 0.3), sigma^2 = 0.4, Sigma_X = [1, 0.2; 0.2, 2].
.StrFixture <- function() {
  beta <- c(0.5, 0.3)
  sigmacapx <- matrix(data = c(1, 0.2, 0.2, 2), nrow = 2)
  sigmacap <- matrix(
    data = c(0.89, 0.56, 0.7, 0.56, 1, 0.2, 0.7, 0.2, 2),
    nrow = 3
  )
  rhocap <- stats::cov2cor(V = sigmacap)
  rsq <- 0.49 / 0.89
  list(
    beta = beta,
    sigmacapx = sigmacapx,
    sigmacap = sigmacap,
    vechsigmacap = sigmacap[lower.tri(x = sigmacap, diag = TRUE)],
    betastar = as.vector(
      x =
        solve(a = rhocap[2:3, 2:3], b = rhocap[2:3, 1])
    ),
    rsq = rsq,
    srsq = rsq - c(rhocap[1, 3], rhocap[1, 2])^2
  )
}

# Standardized parameters
# (betastar, sigmay, sigmax, vechs(rhocapx)) for p = 1, 2, or 3.
.JacFixture <- function(p) {
  betastar <- c(0.4, 0.3, 0.2)[seq_len(length.out = p)]
  sigmax <- c(1, 1.5, 2)[seq_len(length.out = p)]
  rhocapx <- diag(x = p)
  if (p > 1) {
    rhocapx[lower.tri(x = rhocapx)] <- c(0.3, 0.2, 0.4)[
      seq_len(length.out = p * (p - 1) / 2)
    ]
    upper <- upper.tri(x = rhocapx)
    rhocapx[upper] <- t(x = rhocapx)[upper]
  }
  list(
    betastar = betastar,
    rhocapx = rhocapx,
    theta = c(
      betastar,
      2,
      sigmax,
      rhocapx[lower.tri(x = rhocapx)]
    )
  )
}

# The inverse of .JacFixture(): split the standardized parameters.
.RhoFromTheta <- function(t,
                          p) {
  rhocapx <- diag(x = p)
  if (p > 1) {
    rhocapx[lower.tri(x = rhocapx)] <- t[(2 * p + 2):length(x = t)]
    upper <- upper.tri(x = rhocapx)
    rhocapx[upper] <- t(x = rhocapx)[upper]
  }
  list(
    betastar = t[seq_len(length.out = p)],
    sigmay = t[p + 1],
    sigmax = t[p + 1 + seq_len(length.out = p)],
    rhocapx = rhocapx
  )
}
