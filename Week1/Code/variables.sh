#!/bin/bash
# Author: Lucy Goodyear lucy.goodyear19@imperial.ac.uk
# Script: variables.sh
# Desc: Shows use of variables
# Arguments: none
# Date: Oct 2019

# shows the use of variables
MyVar='some string'
echo 'The current value of the variable is' $MyVar
echo 'Please enter new string'
read MyVar
echo 'The current value of the variable is' $MyVar

# Reading multiple variables
echo 'Enter two numbers separated by space(s)'
read a b
echo 'you entered ' $a ' and' $b'. Their sum is:'
mysum=`expr $a + $b`
echo $mysum

# exit