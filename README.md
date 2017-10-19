# gettingcleandata

## Directions

Please unzip the folder from the url below

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Once this is unzipped make sure to set your working directory in your rstudio or editor to the directory that this is unzipped

## Script description

The script takes in the files from the working directory, it then combines them and adds column names. It then removes unwanted columns by filtering only the activity, subject, meand and stdev information. Once this is complete it cleans up the column names and makes them readable and it will then generate a clean dataset and write it to the same working directory
