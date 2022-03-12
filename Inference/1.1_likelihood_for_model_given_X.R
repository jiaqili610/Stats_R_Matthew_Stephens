# Comparing two models with a likelihood ratio

# compute the likelihood and likelihood ratio. for Model 1 and Model 2

# data we observe
x = c(1, 0, 1 , 0, 0 ,1)

# probability distribution of Model1
fS = c(0.40, 0.12, 0.21, 0.12, 0.02, 0.32)

# probability distribution of Model2
fF = c(0.8, 0.2, 0.11, 0.17, 0.23, 0.25)


# a function to calculate the likelihood of model given data x
L = function(f,x) {
        prod(f^x * (1-f)^(1-x))
}

LR = L(fS,x)/L(fF,x)
print(LR)

# the data favours model 1 by a factor of about 1.8
# large enough to be convincing?




# SIMULATION - EXERCISE