##################### First plot with annotations #######################

# loads data from a .txt file and plots it as three line ranges
# (using ggplot2) with annotations for particular values.

# Author: Lucy Goodyear (lucy.goodyear19@imperial.ac.uk)
# Version: 0.0.1

# clear workspace
rm(list=ls())

# imports
library(ggplot2)

# read data
a <- read.table("../Data/Results.txt", header = TRUE)

# view data
head(a)

a$ymin <- rep(0, dim(a)[1]) # append a column of zeroes

# print the first linerange
p <- ggplot(a)
p <- p + geom_linerange(data = a, aes(
    x = x,
    ymin = ymin,
    ymax = y1,
    size = (0.5),
    colour = "#E69F00",
    alpha = 1/2),
    show.legend = TRUE)

# print the second linerange
p <- p + geom_linerange(data = a, aes(
    x = x,
    ymin = ymin,
    ymax = y2,
    size = (0.5),
    colour = "#56B4E9",
    alpha = 1/2),
    show.legend = FALSE)

# print the third linerange
p <- p + geom_linerange(data = a, aes(
    x =x,
    ymin = ymin,
    ymax = y3,
    size = (0.5),
    colour = "#D55E00",
    alpha = 1/2),
    show.legend = FALSE)

# annonate the plot with labels
p <- p + geom_text(data = a, aes(x =x, y = -500, label = Label))

# now set the axis labels, remove the legend, and preapre for bw printing
p <- p + scale_x_continuous("My x axis",
                            breaks = seq(3, 5, by = 0.05)) +
                            scale_y_continuous("My y axis") +
                            theme_bw() +
                            theme(legend.position = "none")

pdf("../Results/MyBars.pdf")
p #+ ggtitle("My first annotated plot")
dev.off()
