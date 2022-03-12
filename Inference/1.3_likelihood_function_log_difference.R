## 1.3 Likelihood function

# We use likelihood ratio to compare the support in the data for two fully-specificed models.
# In practice, we often want to compare a continuum of models.

# Likelihood function

# for example in data we observe 30 of q and 70 of 1-q

# Clear console
cat("\014")  # ctrl+L
rm(list = ls()) 



# parameter space
q <- seq(0,1, length=1000)

# Likelihood function
L = function(q) {
        q^30*(1-q)^70
}

par(mfcol=c(1,1))

plot(q, L(q), ylab="L(q)", xlab="q", type="l")


# we can also use log_e likelihood function
q <- seq(0,1, length=100)

LL = function(q){
        30*log(q) + 70*log(1-q)
}

plot(q, LL(q)-LL(0.3), ylab = "log L(q) - Log l(0.3)", xlab = "q", type = "l", ylim=c(-10,0))
?ylim
     