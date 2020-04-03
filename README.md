# SamsungData

## Data source
Original data and description for this project can be found at : [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Goal : 
using the messy data mentioned above , we create a new tidy data file containing the averages of the variables by subject and activity

## Output files :
* **run_analysis.R** : the R script that will extract and tidy the given data
* **README.md** : a md file that explains the evnironment (*data source* , *files* , *scripts*,...) as well as the thought process behind the script.
* **CodeBook** : a md file that describes the original data and numerates the new variables in the tidy data set

## libraries used :
* base R 
* dplyr


## steps:
* first we read all the necessary files using the read.table() function
* We add the "Subject" and "Activity"" columns to the "x_train" and the "x_test" accordingly
* we merge both subsets in data frame named "ds"
* we label the activity variable values as factors using the data from the activity_labels.txt file
* We name the variables according to the features.txt file . And We name the first two varibales "Subject" and "Activity"
* We extract only the mean and std variables that have "mean()" or "std()" in their name. with exception to the Subject and Activity variables
* we use the aggregate function to calculate the averages of all the variables by the group (Subject,Activi)
