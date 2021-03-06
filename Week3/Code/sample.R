######### run a simulation that involves sampling from a population #########

# Contains 6 functions to test the speed of 5 different methods of calculating 
# means. The first function, myexperiment, samples the data and calculates
# the mean of that sample, the other functions run "num" iterations over 
# myexperiment to generate the means of "num" samples. The functions are then
# run on identical parameters and timed, with the time taken for each being 
# printed to screen.

# Author: Lucy Goodyear (lucy.goodyear19@imperial.ac.uk)
# Version: 0.0.1

# clear workspace
rm(list=ls())

# a function to take a sample of size n from a population "popn" and return its mean
myexperiment <- function(popn, n){
    pop_sample <- sample(popn, n, replace = FALSE)
    return(mean(pop_sample))
}

# calculate means using a loop without preallocation
loopy_sample1 <- function(popn, n, num) {
    result1 <- vector() # initialise empty vector of size 1
    for (i in 1:num){
        result1 <- c(result1, myexperiment(popn, n))
    }
    return(result1)
}

# to run "num" iterations of the experiment using a for loop on a vector with preallocation
loopy_sample2 <- function(popn, n, num) {
    result2 <- vector(,num) # preallocate expected size
    for (i in 1:num) {
        result2[i] <- myexperiment(popn, n)
    }
    return(result2)
}

# to run "num" iterations of the experiment using a for loop on a list with preallocation
loopy_sample3 <- function(popn, n, num) {
    result3 <- vector("list", num) # preallocate expected size
    for (i in 1:num) {
        result3[[i]] <- myexperiment(popn, n)
    }
    return(result3)
}

# to run "num" iterations of the experiment using vectorisation with lapply
lapply_sample <- function(popn, n, num) {
    result4 <- lapply(1:num, function(i) myexperiment(popn, n))
    return(result4)
}

# to run "num" iterations of the experiment using vectorisation with sapply
sapply_sample <- function(popn, n, num) {
    result5 <- sapply(1:num, function(i) myexperiment(popn, n))
    return(result5)
}

# generate the population
popn <- rnorm(1000)
hist(popn)

n <- 20 # sample size for each experiment
num <- 1000 # number of times to rerun the experiment

# time each function and print time to screen
print("The loopy, non-preallocation approach takes:")
print(system.time(loopy_sample1(popn, n, num)))

print("The loopy, but with preallocation approach takes:")
print(system.time(loopy_sample2(popn, n, num)))

print("The loopy, non-preallocation approach takes:")
print(system.time(loopy_sample3(popn, n, num)))

print("The vectorized lapply approach takes:")
print(system.time(sapply_sample(popn, n, num)))

print("The vectorized sapply approach takes:")
print(system.time(sapply_sample(popn, n, num)))
