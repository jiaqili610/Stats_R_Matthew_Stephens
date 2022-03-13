# Asymptotic Normality of MLE
# simulation to observe the normality of MLE estimates

rm(list = ls()) 


################################################################################
# Bernoulli
################################################################################


# simulation samples J = 7000
# in each sample, size n=100
# draw from Bernoulli, with true parameter p0=0.4

p0 <- 0.4

p0_mat = matrix(data=p0, nrow=7000,ncol=1)

# function of bernoulli draw
binomg <- function(x) {
        rbinom(100,1,x)
}

sample_simulation <- sapply(p0_mat, binomg) 

mle_p <- apply(sample_simulation, 2, sum)

hist(mle_p/100, freq = F)
curve(dnorm(x, mean=0.4, sd= sqrt((0.4*(1-0.4)/100))), add=T)
