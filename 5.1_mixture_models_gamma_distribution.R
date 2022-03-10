## 5.1_mixture_models_gamma_distribution

x = seq(0,10,length=100)

plot(x, 0.7*dgamma(x, scale=0.5, shape=2)+ 0.3*dgamma(x, scale=1 , shape=2) 
     , col="blue", type="l", xlab="protein concentration", main="mixture distribution (blue)\n and component distributions (black,red)", ylab="density", ylim=c(0,0.8))

lines(x, dgamma(x, scale= 0.5, shape=2), type="l", col="black")
lines(x, dgamma(x, scale=1 , shape =2), type="l", col="red")

