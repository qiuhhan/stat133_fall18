#Title: Test Functions
#Descriptions: The code below tests the functions implemented 
#in ../workout02/code/functions
#Output: test-output.txt
############################################################################

functions <- dir('code/functions')
lapply(paste0('../code/functions', functions), source)
sink(file = 'test-output.txt')
test_dir('../code/tests')
sink()
