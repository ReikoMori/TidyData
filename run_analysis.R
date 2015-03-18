# run_analysis.R
# The data that this R program processes was originally found at -
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#

# From data, read the integer ActivityCode (1:6) from column 2, and store the
# corresponding ActivityLabel, e.g., "WALKING", "WALKING_UPSTAIRS", etc., to 
# the newActivityLabels vector. Store the activity labels as character strings.
assignActivityLabels <- function(data) {
    #Create a vector to store data for the ActivityLabel column
    newActivityLabels = vector(mode="character", length=length(data))
    
    for (i in 1:length(data)) {        
        val <- activityLabels[data[i], 2]
        newActivityLabels[i] <- as.character(val)
    }
    
    return (newActivityLabels)
}


# Read in the six activity codes and labels, e.g., 1-WALKING, 2-WALKING_UPSTAIRS,... 
activityLabels <- read.table("activity_labels.txt")

# Name the two columns in the activityLabels table.
names(activityLabels)[1] <- "ActivityCode"
names(activityLabels)[2] <- "ActivityLabel"

# Read the raw test observations
testData <- read.table("./test/X_test.txt", header=FALSE)
# Read the activity codes for the raw test observations
testActivityCodes <- read.table("./test/Y_test.txt", header=FALSE)

# Read the raw training observations
trainData <- read.table("./train/X_train.txt", header=FALSE)
# Read the activity codes for the raw training observations
trainActivityCodes <- read.table("./train/Y_train.txt", header=FALSE)

# Combine training and test observations
allData <- rbind(trainData, testData)

# Combine training and test activity codes
allActivityCodes <- rbind(trainActivityCodes, testActivityCodes)

# Read the subect codes for raw test observations
subject_test <- read.table("./test/subject_test.txt", header=FALSE)

# Read the subject codes for raw training observations
subject_train <- read.table("./train/subject_train.txt", header=FALSE)

# Combine training and test subject codes
allSubjects <- rbind(subject_train, subject_test)

# Read feature name table from original data set. Feature names are in $V2 column.
testFeatures <- read.table("features.txt")

# Replace default table names (V1, v2, v3, etc) with feature names
names(allData) <- testFeatures$V2

# Retrieve columns that have "-mean(" and "-std(" character string in their name
meanColumns <- grep("-mean[(]", names(allData))
stdColumns <- grep("-std[(]", names(allData))

# Create new table containing subject codes, activity codes, mean and std_dev labels,
# and mean and std columns.
finalTable <- cbind(allSubjects, allActivityCodes, allData[,c(meanColumns, stdColumns)])

# Set names of first and second columns
names(finalTable) [1] <- "Subject"
names(finalTable) [2] <- "ActivityCode"

# Group data by subject id and activity code,and run mean on the grouped data
finalTable <- aggregate(finalTable, by=list(finalTable$Subject,
                                            finalTable$ActivityCode),
                        FUN=mean, na.rm=TRUE)

# Get rid of unused columns
finalTable$Group.1 <- NULL;
finalTable$Group.2 <- NULL;

# Run user-defined function to assign character string activity labels to each observation
ActivityLabels <- assignActivityLabels(finalTable$ActivityCode)

# Add the newly created ActivityLabel column to finalTable
finalTable <- cbind(ActivityLabels, finalTable)

# Rearrange finalTable columns so that Subject, ActivityCode, ActivityLabel come first.
finalTable <- finalTable[c(2,3,1,4:length(names(finalTable)))]

# Write table out to MyTable.txt. Each field is separated by a tab character.
write.table(finalTable, "TidyTable.txt", row.name=FALSE, sep="\t")
