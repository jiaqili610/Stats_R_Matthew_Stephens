## 6.2 Intro to EM: Gaussian Mixture Models

# in this example, we will assume our mixture components are fully specified 
# Gaussian distribution(e.g. the means and variances are known), and we are
# interested in finding the maximum likelihood estimates of the mixture weights

# assume we have K = 2 components, so that
# Xi | Zi = 0  ~ N(5,  1.5)
# xi | zi = 1  ~ N(10, 2)

# The true mixture proportions will be P(Zi=0)=0.25 and P(Zi=1)=0.75.
# we simulate data from this mixture model:



rm(list = ls()) 




#   mixture components
mu.true = c(5,10)
sigma.true = c(1.5, 2)

#   determine z_i
Z = rbinom(500,1,0.75)

# sample from mixture model 111

X <- rnorm(10000, mean=mu.true[Z+1], sd=sigma.true[Z+1])

hist(X, breaks = 15)






# since we now assume parameters are known, mixture components are fully specified
# for each observation we compute the likelihood P(Xi | Zi= 0) and P(Xi | Zi=1).
# We store these values in the columns of L: 
# we write a function to compute the log weighted  likelihood
compute.log.lik <- function(L, w){
        L[,1] = L[,1] * w[1]
        L[,2] = L[,2] * w[2]
        return(sum(log(rowSums(L))))
}


L= matrix(NA, nrow=length(X), ncol=2)

L[,1] = dnorm(X, mean= mu.true[1], sd = sigma.true[1])
L[,2] = dnorm(X, mean= mu.true[2], sd = sigma.true[2])



# finally, we implement the E and M step in the EM.iter function below.

# the mixture.EM function is the driver which checks for convergence by computing
# the log likelihoods at each step

mixture.EM <- function(w.init, L) {
        
        w.curr <- w.init
        
        # store log-likehoods for each iteration
        log_liks <-c()
        ll <- compute.log.lik(L, w.curr)
        log_liks <- c(log_liks, ll)
        delta.ll <-1
        
        while(delta.ll >1e-5){
                w.curr <- EM.iter(w.curr, L)
                ll     <- compute.log.lik(L, w.curr)
                log_liks <- c(log_liks, ll)
                delta.ll <- log_liks[length(log_liks)] - log_liks[length(log_liks)-1]
        }
        
        return(list(w.curr, log_liks))
}



EM.iter <- function(w.curr, L, ...){
        # E step: compute E_{Z| X,w0}[I(Z_i=k)]
        z_ik <- L
        
        for(i in seq_len(ncol(L))) {
                z_ik[,i] <- w.curr[i]*z_ik[,i]
        }
        
        z_ik <- z_ik/rowSums(z_ik)
        
        # M-step
        w.next <- colSums(z_ik)/sum(z_ik)
        
        return(w.next)
        
}




#perform EM
ee <- mixture.EM(w.init = c(0.5, 0.5), L)


print(paste("Estimate = (", round(ee[[1]][1], 2), ",", round(ee[[1]][2], 2), ")", sep="" ))

plot(ee[[2]] , ylab = 'incomplete log-likelihood' , xlab='iteration')
