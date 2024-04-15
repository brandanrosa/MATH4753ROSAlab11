#' ciNonSym
#'
#' A function which produces a histogram and output list.
#'
#' @param x numeric vector
#' @param alpha alpha level
#' @param alpha2 noncentral cut value 2
#' @param mu0 estimated mu
#' @param epsilon a value for the ball
#' @param bins number of bins for the histogram
#'
#' @return a histogram plot and list
#' @export
#'
#' @importFrom ggplot2 ggplot geom_histogram labs aes
#'
#' @examples \dontrun{ciNonSym(x=cats$LENGTH,alpha=0.05,alpha2=0.02,mu0=45,epsilon=4,bins=25))}
ciNonSym <- function(x, alpha, alpha2, mu0, epsilon, bins) {

  alpha1 <- alpha - alpha2
  n <- length(x)
  ybar <- mean(x)

  t1 <- stats::qt(alpha1, n-1)
  t2 <- stats::qt(1-alpha2, n-1)
  t <- c(t1, t2)

  se <- stats::sd(x)/sqrt(n)

  L <- ybar + t1*se
  U <- ybar + t2*se
  ci <- c(L, U)

  yl <- round(ybar - epsilon,0)
  yu <- round(ybar + epsilon,0)

  ball <- c(yl, yu)

  test <- ifelse(ball[1] >= L & ball[2] <= U, "TRUE", "FALSE")

  CI <- ifelse(x >= L & x <= U, "in", "out")

  df <- data.frame(cbind(as.vector(x), CI))

  g <- ggplot(data = df, aes(x=x, fill=CI)) +
    geom_histogram() +
    labs(title = "Lab 11 Histogram")
  print(g)

  list(ci = ci, t = t, test = test , ball = ball)

}
