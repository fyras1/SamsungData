# SamsungData

## libraries:
* dplyr

## steps:
* first we read all the necessary files using the read.table() function
* We add the "Subject" and "Activity"" columns to the "x_train" and the "x_test" accordingly
* we merge both subsets in data frame named "ds"
* we label the activity variable values as factors using the data from the activity_labels.txt file
* We name the variables according to the features.txt file . And We name the first two varibales "Subject" and "Activity"
* We extract only the mean and std variables that have "mean()" or "std()" in their name. with exception to the Subject and Activity variables
* we use the aggregate function to calculate the averages of all the variables by the group (Subject,Activi)
