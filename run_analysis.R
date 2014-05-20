#subject
#x - measurements (561)
#y - activity

# checklist
# https://class.coursera.org/getdata-003/forum/thread?thread_id=92
# look at reshape2(), melt
# tab delimited txt file

StartProcess <- function(){
    require(plyr)
    activityLabels <- read.table("activity_labels.txt",sep=" ", col.names=c("id","activity"))
    activity.test <- read.table("test/y_test.txt", col.names="id")
    activity.train <- read.table("train/y_train.txt", col.names="id")
    activity <- rbind(activity.test, activity.train)
    activity <- merge(activity, activityLabels,by="id")
    
    subjects.test <- read.table("test/subject_test.txt", col.names="subject.id")
    subjects.train <- read.table("train/subject_train.txt", col.names="subject.id")
    subjects <- rbind(subjects.test, subjects.train)
    
    measurementLabels <- read.table("features.txt",sep=" ", col.names=c("measurement.id","Description"))
    measurements.test <- read.table("test/X_test.txt", col.names=measurementLabels$Description)
    measurements.train <- read.table("train//X_train.txt", col.names=measurementLabels$Description)
    measurements <- rbind(measurements.test, measurements.train)
    
    flatTable <- activity
    rm(activity)
    
    flatTable <- cbind(flatTable,subjects)
    flatTable <- cbind(flatTable,measurements)
    
    names(flatTable) <- ColumnRenamer(names(flatTable))
    colSubset <- names(flatTable)
    colSubset <- colSubset[str_detect(colSubset, "Mean")|
                                                 str_detect(colSubset, "Std")]
    colSubset <- colSubset[1:12]
#     DataSummary(flatTable, colSubset)
    colSubset <- c(names(flatTable)[1:3], colSubset)
}

ColumnRenamer <- function(columnName){
    val <- gsub("\\.","", columnName)
    val <- gsub("mean","Mean", val)
    val <- gsub("std","Std", val)
    val <- gsub("id","Id", val)
    val
}

DataSummary <- function(inputTable, summaryColumns){
    subsetTable <- inputTable[,summaryColumns]
    
}

