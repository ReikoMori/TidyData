
The original raw data set was downloaded from -

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

For ease and speed of processing, the .zip file was downloaded and then unzipped to the local file system.

The unzipped file consists of a directory called "UCI HAR Dataset. Within "UCI HAR Dataset" are
text files describing how the original experiements were conducted, and the features that were measured
and recorded. It also contained two directories - "train"" and "test"", that contained the original raw data
that was later processed by run_analysis.R.

 run_analysis.R does the the following from the zipped, raw data -
 
    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names. 
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The original raw data set contained a total of 10299 observations for 30 subjects from both the "train" and "test" data sets.

Each of the original observations contained 561 variables. Of the 561 original variables, only those related
to subject, activity, and mean and standard deviation measurements were retained and processed for the 
final data set.

The final data set is a 180 row by 69 column table, which was output to a TAB-delimited ("\t") text file named "TidyTable.txt"
 
 


 