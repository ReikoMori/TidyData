
The output data table consists of 180 observations (rows) and 69 variables (columns).


The data types in the processed table include -

Subject (Column 1) - An integer subject code between 1 and 30 to identify which of the 30 subjects the measurements were made on.
  
ActivityCode (Column 2) - An integer activity code between 1 and 6 to identify which activity was being measured.
 
ActivityLabel (Column 3) - A character string {"WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING""} that gives a text description of the activity being measured. An ActivityCode of 1 corresponds to an ActivityLabel of "WALKING", an ActivityCode of 2 corresponds to an ActivityLabel of"WALKING_UPSTAIRS", and so on.
 
Mean values (Columns 4-69) of remaining mean and standard deviation measurements, grouped by subject and activity code. The mean values are numeric.

The original names for columns 4-69 were maintained to make it easy to compare the processed table data with the raw data.