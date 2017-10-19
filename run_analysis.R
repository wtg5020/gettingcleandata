

xTrain <- read.table("./UCI HAR Dataset/train/x_train.txt")
xTest <- read.table("./UCI HAR Dataset/test/x_test.txt")
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
activityNames <- read.table("./UCI HAR Dataset/activity_labels.txt")

colnames(xTrain) <- features[,2]
colnames(xTest) <- features[,2]
colnames(yTrain) <- "activityId"
colnames(yTest) <- "activityId"
colnames(subjectTrain) <- "subjectId"
colnames(subjectTest) <- "subjectId"
colnames(activityNames) <- c("activityId", "activityType")

trainCombined <- cbind(subjectTrain, yTrain, xTrain)

testCombined <- cbind(subjectTest, yTest, xTest)

combinedAll <- rbind(trainCombined, testCombined)

allColNames <- colnames(combinedAll)

print(allColNames)

vectorAll <- ((grepl("activityId", allColNames) | grepl("subjectId", allColNames) 
             | grepl("std()", allColNames) | grepl("-mean()", allColNames))& !grepl("Freq", allColNames))

combinedMeanSd <- combinedAll[vectorAll == TRUE]

combinedAct <- merge(combinedMeanSd, activityNames, by='activityId', all.x=TRUE)

finalCols <- colnames(combinedAct)

for (i in 1:length(finalCols)){
    finalCols[i] = gsub("\\()","",finalCols[i])
    finalCols[i] = gsub("\\-","",finalCols[i])
    finalCols[i] = gsub("std","StdDev",finalCols[i])
    finalCols[i] = gsub("-mean","Mean",finalCols[i])
    finalCols[i] = gsub("^t","time",finalCols[i])
    finalCols[i] = gsub("^f","freq",finalCols[i])
    finalCols[i] = gsub("BodyBody","Body",finalCols[i])
    finalCols[i] = gsub("Gyro","Gyroscope",finalCols[i])
    finalCols[i] = gsub("AccMag","AccMagnitude",finalCols[i])
    finalCols[i] = gsub("Mag","Magnitude",finalCols[i])
  
}

colnames(combinedAct) <- finalCols


finalData <- combinedAct[, names(combinedAct) != "activityType"]

outputData <- aggregate(finalData[,names(finalData) != c("activityId", "subjectId")],by=list(activityId = finalData$activityId,subjectId = finalData$subjectId),mean)

finalOutput <- merge(outputData, activityNames, by="activityId", all.x=TRUE)

write.table(finalOutput, "./secondTidyData.txt", row.names = FALSE )







