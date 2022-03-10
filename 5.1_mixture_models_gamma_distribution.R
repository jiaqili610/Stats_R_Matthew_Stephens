## 5.1_mixture_models_gamma_distribution

x = seq(0,10,length=100)

plot(x, 0.7*dgamma(x, scale=0.5, shape=2)+ 0.3*dgamma(x, scale=1 , shape=2) 
     , col="blue", type="l", xlab="protein concentration", main="mixture distribution (blue)\n and component distributions (black,red)", ylab="density", ylim=c(0,0.8))

lines(x, dgamma(x, scale= 0.5, shape=2), type="l", col="black")
lines(x, dgamma(x, scale=1 , shape =2), type="l", col="red")



# simulation
n=10000 # number of samples
x = rep(0,n) # to store the samples
shape = c(2,2) # shapes of the two components)
scale = c(0.5, 1) # scales of the two components

for(i in 1:n){
    if()    
}


