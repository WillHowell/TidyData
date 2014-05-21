
StartProcess <- function(){
    require(plyr)
    
    if (!file.exists("activity_labels.txt")) stop("Required file not found, please make sure the working 
directory is set to the data directory for this project, i.e.. 'UCI HAR Dataset' ")
    
    activityLabels <- read.table("activity_labels.txt",sep=" ", col.names=c("aId","activity"))
    
    activity.test <- na.omit(read.table("test/y_test.txt", col.names="aId"))
    activity.train <- read.table("train/y_train.txt", col.names="aId")
    activity <- rbind(activity.test, activity.train)    
    
    activity <- join(activity, activityLabels, by=c("aId","aId"))
    
    subjects.test <- read.table("test/subject_test.txt", col.names="subject.id")
    subjects.train <- read.table("train/subject_train.txt", col.names="subject.id")
    subjects <- rbind(subjects.test, subjects.train)
    
    measurement.labels <- read.table("features.txt",sep=" ", col.names=c("measurement.id","Description"))
    measurements.test <- read.table("test/X_test.txt", col.names=measurement.labels$Description)
    measurements.train <- read.table("train/X_train.txt", col.names=measurement.labels$Description)
    measurements <- rbind(measurements.test, measurements.train)    
    
    flat.table <- cbind(activity,subjects)
    flat.table <- cbind(flat.table,measurements)    

    names(flat.table) <- ColumnRenamer(names(flat.table))
    colSubset <- names(flat.table)
    colSubset <- colSubset[str_detect(colSubset, "Mean") | str_detect(colSubset, "Std")]
    colSubset <- colSubset[1:12]
    colSubsetWithIds <- c(names(flat.table)[1:3], colSubset)
    flat.table <- flat.table[,colSubsetWithIds]    
    
    molten <- melt(flat.table, id=c("aId","activity", "subjectId"))
    activity.means <- dcast(molten,activity+subjectId~variable, mean, drop=TRUE)
    arrange(activity.means, activity,subjectId)
    
    write.table(activity.means,"../TidyData.txt", sep="\t", row.names=FALSE)
}

ColumnRenamer <- function(columnName){
    val <- gsub("\\.","", columnName)
    val <- gsub("mean","Mean", val)
    val <- gsub("std","Std", val)
    val <- gsub("id","Id", val)
    val
}



