##Introduction
R package "roller" is a minimal package that contains two main functions -- 
"device" and "roll". 

##Device function
In the function "device", users can input two variables, "sides" and "prob", 
second of which is the probabilty of each side of the device. For instance, 
a device with inputs sides = c("heads", "tails") and prob = c(1/2, 1/2) 
simulates a coin. Along with the device function, there's a series of auxilary 
funcitons that check whether the inputs are of the same length, whether the 
probabilities in the prob vector add up to 1, etc. The output is an object of 
class "device".

##Roll function
After having created a "device", there's another function "roll", which allows 

There're several auxilary methods attached to roll(). One of them is summary.rolls(),
which returns a table of frequencies of each side of the device.

If users would like to look at the frequencies graphically, plot.rolls() function will return a vertical barchart of the frequencies based on the given roll function.
