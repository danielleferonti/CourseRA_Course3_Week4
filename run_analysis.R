##reading data

library(dplyr)
featurenames <-read.table("C:/RWorkingDir-DMF/Course3/Week4/UCI HAR Dataset/features.txt")
activitylabels <- read.table("C:/RWorkingDir-DMF/Course3/Week4/UCI HAR Dataset/activity_labels.txt", header = FALSE)

subjecttrain<-read.table("C:/RWorkingDir-DMF/Course3/Week4/UCI HAR Dataset/train/subject_train.txt", header = FALSE)
feattrain<-read.table("C:/RWorkingDir-DMF/Course3/Week4/UCI HAR Dataset/train/X_train.txt", header = FALSE)
acttrain<-read.table("C:/RWorkingDir-DMF/Course3/Week4/UCI HAR Dataset/train/y_train.txt", header = FALSE)

subjecttest<-read.table("C:/RWorkingDir-DMF/Course3/Week4/UCI HAR Dataset/test/subject_test.txt", header = FALSE)
feattest<-read.table("C:/RWorkingDir-DMF/Course3/Week4/UCI HAR Dataset/test/X_test.txt", header = FALSE)
acttest<-read.table("C:/RWorkingDir-DMF/Course3/Week4/UCI HAR Dataset/test/y_test.txt", header = FALSE)

subjectcomb <- rbind(subjecttrain, subjecttest)
actcomb <-rbind(activitytrain, activitytest)
featcomb <- rbind(featurestrain, featurestest)

colnames(featcomb) <- t(featurenames[2])
colnames(actcomb) <-"Activity"
colnames(subjectcomb) <- "Subject"
CombinedData <-cbind(featcomb,actcomb,subjectcomb)

##mean & SD

Mean_SD <- grep(".*Mean.*|*.Std.*", names(CombinedData), ignore.case = TRUE)
MSDCols<- c(Mean_SD , 562, 563)

ExtData <-CombinedData[,MSDCols]

## descriptive activities

ExtData$Activity <- as.character(ExtData$Actibit)
for (D in 1:6){
  ExtData$Activity[ExtData$Activity == D] <- as.character(activitylabels[D,2])}
ExtData$Activity <- as.factor(ExtData$Activity)

##names(ExtData)

names(ExtData)<-gsub("Acc", "Accel", names(ExtData))
names(ExtData)<-gsub("Gyro", "Gyro", names(ExtData))
names(ExtData)<-gsub("BodyBody", "Body", names(ExtData))
names(ExtData)<-gsub("Mag", "Magnitude", names(ExtData))
names(ExtData)<-gsub("^t", "Time", names(ExtData))
names(ExtData)<-gsub("^f", "Freq", names(ExtData))
names(ExtData)<-gsub("tBody", "TimeBody", names(ExtData))
names(ExtData)<-gsub("-mean()", "Mean", names(ExtData), ignore.case = TRUE)
names(ExtData)<-gsub("-std()", "STD", names(ExtData), ignore.case = TRUE)
names(ExtData)<-gsub("-freq()", "Freq", names(ExtData), ignore.case = TRUE)
names(ExtData)<-gsub("angle", "Angle", names(ExtData))
names(ExtData)<-gsub("gravity", "Gravity", names(ExtData))

##summarize & make 2nd data set

ExtData$Subject <- as.factor(ExtData$Subject)
ExtData <-data.table(ExtData)

Project <- aggregate(.~Subject + Activity, ExtData, mean)
Project <- Project[order(Project$Subject, Project$Activity),]
write.table(Project, file = "Course3/Week4/UCI HAR Dataset/ProjectWk4.txt", row.names= FALSE)

ReadProj <-read.table("C:/RWorkingDir-DMF/Course3/Week4/UCI HAR Dataset/ProjectWk4.txt", header = TRUE)
