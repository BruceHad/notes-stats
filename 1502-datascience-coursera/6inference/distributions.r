dist1 <- rbinom(1000, 1, 0.5)
dist2 <- rbinom(1000, 1, 0.1)
par(mfrow = c(2,1))
hist(dist1)
hist(dist2)

## Poisson

dist1 <- rpois(1000, 0.5)
dist2 <- rpois(1000, 10)
par(mfrow = c(2,1))
hist(dist1)
hist(dist2)

pbinom(2, size = 500, prob = 0.01)
# [1] 0.1234
ppois(2, lambda = 500 * 0.01)
# [1] 0.1247