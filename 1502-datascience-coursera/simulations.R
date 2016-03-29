
# Simulating the averages from x die rolls
library(ggplot2)
nosim <- 1000
dat <- data.frame(
    x = c(sample(1 : 6, nosim, replace = TRUE),
          apply(matrix(sample(1 : 6, nosim * 2, replace = TRUE), 
                       nosim), 1, mean),
          apply(matrix(sample(1 : 6, nosim * 3, replace = TRUE), 
                       nosim), 1, mean),
          apply(matrix(sample(1 : 6, nosim * 4, replace = TRUE), 
                       nosim), 1, mean)
    ),
    size = factor(rep(1 : 4, rep(nosim, 4))))
g <- ggplot(dat, aes(x = x, fill = size)) + geom_histogram(alpha = .20, binwidth=.25, colour = "black") 
g <- g + facet_grid(. ~ size)
g

dat <- data.frame(
    x = c(
        apply(matrix(sample(1:6, nosim * 10, replace =TRUE), nosim), 1, mean),
        apply(matrix(sample(1:6, nosim * 20, replace =TRUE), nosim), 1, mean),
        apply(matrix(sample(1:6, nosim * 30, replace =TRUE), nosim), 1, mean)
    ),
    size = factor(rep(c(10, 20, 30), rep(nosim, 3)))
)
g <- ggplot(dat, aes(x = x, fill = size))
g <- g + geom_histogram(alpha = .20, binwidth = .25, colour = "black")
g <- g + facet_grid(. ~ size)
g

nosim <- 1000
cfunc <- function(x, n) sqrt(n) * (mean(x) - 3.5) / 1.71
dat <- data.frame(
    x = c(apply(matrix(sample(1 : 6, nosim * 10, replace = TRUE), 
                       nosim), 1, cfunc, 10),
          apply(matrix(sample(1 : 6, nosim * 20, replace = TRUE), 
                       nosim), 1, cfunc, 20),
          apply(matrix(sample(1 : 6, nosim * 30, replace = TRUE), 
                       nosim), 1, cfunc, 30)
    ),
    size = factor(rep(c(10, 20, 30), rep(nosim, 3))))
g <- ggplot(dat, aes(x = x, fill = size))
g <- g+ geom_histogram(alpha = .20, binwidth=.3, colour = "black", aes(y = ..density..)) 
g <- g + stat_function(fun = dnorm, size = 2)
g + facet_grid(. ~ size)

library(UsingR)
data(father.son)
x <- father.son$sheight
mean <- mean(x)
n < length(x)
sdm <- sd(x)/sqrt(n)

mean(x) + c(-1, 1) * qnorm(0.975) * sdm
