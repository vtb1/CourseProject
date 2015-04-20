# Read the files
setwd("C:/Users/CRISTINA/Documents/Coursera/UCI HAR Dataset")

# Code for reading the Features and Activity Labels
  # Read the file of features
  Features_tmp <- read.table(file="./features.txt", header=FALSE)
  # Get only the second column that contains the names
  Features <- Features_tmp[,2]
  # Read the file activity labels ( to link labels with activiy name)
  Activity_labels <- read.table(file="./activity_labels.txt", header=FALSE, sep= " ")
  colnames(Activity_labels) <- c("Activity_labels","Activity")



# Code for reading and merging Training Data Files
  
  # Read the file X_train Training Set
  Training_set <- read.table(file="./train/X_train.txt", header=FALSE)

  # Code to assign Features column names to the Training Set
  Col_Training_set <- ncol(Training_set)
  for (i in 1:Col_Training_set){
    names(Training_set)[i] <- paste(Features[i])
  }
  
  # Read the Subject train file which contains the subject whe performed the activity
  Subject_training <- read.table(file="./train/subject_train.txt", header=FALSE)
  # Assign subject name to Subject file
  colnames(Subject_training) <- c("Subject")

  # Read the file y_train Training labels
  Training_labels <- read.table(file="./train/y_train.txt", header=FALSE)
  # Assign name to the column of Activity_labels
  colnames(Training_labels) <- c("Activity_labels")

  # Merge the Training_set and training_labels
  Training_set_labels <- cbind(Training_labels,Training_set)

  # Merge the Training_Set_labels and the Subject File
  Training_set_labels_subject <- cbind(Subject_training,Training_set_labels)
  
  # Merge of the Training_set_labels and the Activity labels table
  Training_merged_set <- merge(Training_set_labels_subject,Activity_labels)

# Code for reading and merging Training Data Files

  # Read the file X_train Training Set
  Test_set <- read.table(file="./test/X_test.txt", header=FALSE)
  
  # Code to assign Features column names to the Training Set
  Col_Test_set <- ncol(Test_set)
  for (i in 1:Col_Test_set){
    names(Test_set)[i] <- paste(Features[i])
  }
  
  # Read the Subject test file which contains the subject whe performed the activity
   Subject_test <- read.table(file="./test/subject_test.txt", header=FALSE)
  # Assign subject name to Subject file
  colnames(Subject_test) <- c("Subject")

  # Read the file y_train Training labels
  Test_labels <- read.table(file="./test/y_test.txt", header=FALSE)
  # Assign name to the column of Activity_labels
  colnames(Test_labels) <- c("Activity_labels")


    
  # Merge the Training_set and training_labels
  Test_set_labels <- cbind(Test_labels,Test_set)

  # Merge the Test_Set_labels and the Subject File
  Test_set_labels_subject <- cbind(Subject_test,Test_set_labels)


  
  # Merging of the Training_set_labels and the Activity labels table
  Test_merged_set <- merge(Test_set_labels_subject,Activity_labels)

# Rbind the two data sets : Training and Test
Training_test_merged <- rbind(Training_merged_set,Test_merged_set)

# Order the data frame by Subject and Activity_labels
Training_test_merged_ordered_tmp1 <- Training_test_merged[with(Training_set_merged, order(Subject, Activity_labels)), ]
# Delete the Activity_labels, we don't need them
Training_test_merged_ordered_tmp2 <- Training_test_merged_ordered_tmp1[,c(2:564)]
# Reorder the Data Set to Put the Activity on the second column, after the subject
Training_test_merged_ordered_final <- Training_test_merged_ordered_tmp2[,c(1,563,2:562)]

## Step 2
## Extract only the measurements on the mean and standard deviation
## I decided to extract variables using mean() and std()
## Can filter after reading the file


## Step 5
  ## 5.From the data set in step 4, creates a second, independent tidy data set with the average of 
  ## each variable for each activity and each subject. 
  Tidy_set <- aggregate(Training_test_merged_ordered_final[, 3:563], list(Training_test_merged_ordered_final$Subject,Training_test_merged_ordered_final$Activity), mean)

 # Change the names of the group columns to Subject and Activity
  names(Tidy_set)[1] <- paste("Subject")
  names(Tidy_set)[2] <- paste("Activity")


  ## Write the final set Tidy set on a file
  write.table(Tidy_set, file="./Tidy_set.txt" , row.name=FALSE)




