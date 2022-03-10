## 6.2 Intro to EM: Gaussian Mixture Models

# in this example, we will assume our mixture components are fully specified 
# Gaussian distribution(e.g. the means and variances are known), and we are
# interested in finding the maximum likelihood estimates of the mixture weights

# assume we have K = 2 components, so that
# Xi | Zi = 0  ~ N(5,  1.5)
# xi | zi = 1  ~ N(10, 2)

# The true mixture proportions will be P(Zi=0)=0.25 and P(Zi=1)=0.75.
# we simulate data from this mixture model:



#   mixture components
mu.true = c(5,10)
sigma.true = c(1.5, 2)

#   determine z_i
Z = rbinom(500,1,0.75)
?rbinom
