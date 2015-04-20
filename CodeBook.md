# Codebook for Course Project and script Run_analysis.R

Next, the steps performed for doing the analysis required in this Project:

1) Read the support files:
	- Features file
	- Activity labels file

2) Read and clean X training files:
First, I read the Training Set file (x_train) and added new names to the columns ( using the Features file).
Then, I read the Subject training file and the y_train file with the labels of activities.

After this, I add a new column to  the Training Set file that contains the Labels. I used the command "cbind"
So now I need to add the Subject info, so I do a new "cbind" to add the Subject info to the file.

Finally, I merged the last file with Training, labels and Subject info with the file containing the names of 
the activities performed.

3) I repeated all steps in point 2 for performing the analysis of Test data.

4) Make a new ordering of the columns by Subject and activity labels and reorder the columns
to put Subject on the first column

5) Calculate the mean of the file

6) Write the file to a text file 