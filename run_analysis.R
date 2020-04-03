#we need the dplyr library
library(dplyr)

#we read all the necessary files
x_train<-read.table("UCI HAR Dataset\\train\\X_train.txt")
x_test<-read.table("UCI HAR Dataset\\test\\X_test.txt")

train_lb<-read.table("UCI HAR Dataset\\train\\y_train.txt")
test_lb<-read.table("UCI HAR Dataset\\test\\y_test.txt")

train_sub<-read.table("UCI HAR Dataset\\train\\subject_train.txt")
test_sub<-read.table("UCI HAR Dataset\\test\\subject_test.txt")

ac_lb<-read.table("UCI HAR Dataset\\activity_labels.txt")

feat<-read.table("UCI HAR Dataset\\features.txt", stringsAsFactors = FALSE)

#we add the subject and activity varibles to the "train" and "test" data sets
train<-cbind(train_sub,train_lb,x_train)
test<-cbind(test_sub,test_lb,x_test)

#since train and test don't have the same subjects , we can merge the two data sets
#simply using rbind() (we dont need merge() or join())
ds<-rbind(train,test)

#we label the activity variable values as factors using the data from the activity_labels.txt file
ds[,2]<-factor(ds[,2],levels=c(1,2,3,4,5,6),labels=ac_lb[,2])

#We name the variables according to the features.txt file
#We name the first two varibales "Subject" and "Activity"
names(ds)<-c("Subject","Activity",feat[,2])

#We transform ds$Subject into a Factor instead of a numeric vector
ds$Subject<-as.factor(ds$Subject)

#We extract only the mean and std variables that have "mean()" or "std()" in their name.
#with exception to the Subject and Activity variables
arr<-grepl("mean()|std()|Subject|Activity",names(ds))
ds<-ds[,arr]

#we use the aggregate function to calculate the averages of all the variables by the group (Subject,Activi)
final_ds<-aggregate(ds[,c(-1,-2)], list(ds$Subject,ds$Activity), mean)
names(final_ds)[1:2]<-c("Subject","Activity")

# This line will arrange the rows so its sorted by the "Subject" variable first , then the Activity second
# don't execute this line if you want the table sorted by the activity.
final_ds<-arrange(final_ds,final_ds$Subject,final_ds$Activity)

write.table(final_ds,"tidy_data.txt", row.name = FALSE)
