## likelihood ratio for continuous data

rm(list = ls()) 




# Concentration of a protein in the blood.

# Gamma distribution
# Normal people :    (mean 1, shape 2)
# Diseased people:   (mean 2, shape 2)


# visualisation
x <- seq(0,10,length=1000)

plot(x, dgamma(x, scale=0.5, shape=2) , type="l", xlab= "protein concentration")
lines(x, dgamma(x, scale=1, shape = 2), type="l", col="red")

# if we observe a person with protein concentration 4.02
# the likelihood ratio of him  sick to healthy
dgamma(4.02, scale=1, shape=2)/dgamma(4.02, scale=0.5, shape=2)
# by a factor of approximately 14




#  likelihood ratio must be computed from same data
#  Remember that the likelihood ratio is computed for two different models
#  on the same data.

#  example - determine whether some data X are from normal or log normal

X <- exp(rnorm(1000, -5, 2))
Z <- log(X)

# graph look
par(mfcol=c(2,2))
hist(X)
hist(Z)
qqnorm(X)
qqnorm(Z)
