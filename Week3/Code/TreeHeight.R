################## Calculate tree heights #####################

# Contains a function that calculates heights of trees, which 
# is called on a sample pair of parameters and then on a 
# loaded data set of trees, the results of which are saved into a csv.

# The function calculates heights of trees given the distance
# of each tree from its base and angle to its top, using the 
# trigonometric formula

# height = distance * tan(radians)

# Arguments:
# degrees: The angle of elevation of tree
# distance: The distance from base of tree (e.g. metres)

# Output:
# the heights of the trees, same units as "distance"

# Author: Lucy Goodyear (lucy.goodyear19@imperial.ac.uk)
# Version: 0.0.1

# clear workspace
rm(list=ls())

# loads data from a csv
Tree_data <- read.csv("../Data/trees.csv")

TreeHeight <- function(degrees, distance){
    radians <- degrees * pi / 180
    height <- distance * tan(radians)
    # commented out print function below to improve speed with large datasets
    #print(paste("Tree height is", height))

    return(height)
}

TreeHeight(37, 40) # sample values

# add column to Tree_data to include tree heights, calculated by the TreeHeight function
Tree_data$Tree.Height.m <- TreeHeight(Tree_data$Angle.degrees, Tree_data$Distance.m)

# write data to a csv
write.csv(Tree_data, "../Results/TreeHts.csv")

