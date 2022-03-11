## 6.1 introduction to mixture models

# example 1. distribution of price of books (hardback + paperback)

NUM.SAMPLES <- 5000
prices      <- numeric(NUM.SAMPLES)


for (i in seq_len(NUM.SAMPLES)) {
  
  z.i <- rbinom(1,1,0.5)
  
  if (z.i == 0) {
    prices[i] <- rnorm(1, mean=9 , sd=1)
  } else  {
    prices[i] <- rnorm(1, mean=20, sd=1)
  }
  
}

hist(prices)



# example 2. heights of students
NUM.SAMPLES <- 5000
heights <- numeric(NUM.SAMPLES)


for (i in seq_len(NUM.SAMPLES)) {

  z.i <- rbinom(1,1, 0.75)
  
  if (z.i== 0) {
    heights[i] <- rnorm(1, mean=69, sd=2.5)
  } else {
    heights[i] <- rnorm(1, mean=64, sd=2.5)
  }
}

hist(heights)
