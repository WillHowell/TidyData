
StartProcess <- function(){
    require(plyr)
    
    if (!file.exists("activity_labels.txt")) stop("Required file not found, please make sure the working 
directory is set to the data directory for this project, i.e.. 'UCI HAR Dataset' ")
    
    activityLabels <- read.table("activity_labels.txt",sep=" ", col.names=c("aId","activity"))
    
    activityTest <- na.omit(read.table("test/y_test.txt", col.names="aId"))
    activityTrain <- read.table("train/y_train.txt", col.names="aId")
    activity <- rbind(activityTest, activityTrain)    
    
    activity <- join(activity, activityLabels, by=c("aId","aId"))
    
    subjectTest <- read.table("test/subject_test.txt", col.names="subjectId")
    subjectTrain <- read.table("train/subject_train.txt", col.names="subjectId")
    subjects <- rbind(subjectTest, subjectTrain)
    
    measurementLabels <- read.table("features.txt",sep=" ", col.names=c("measurement.id","Description"))
    measurementsTest <- read.table("test/X_test.txt", col.names=measurementLabels$Description)
    measurementsTrain <- read.table("train/X_train.txt", col.names=measurementLabels$Description)
    measurements <- rbind(measurementsTest, measurementsTrain)    
    
    flatTable <- cbind(activity,subjects)
    flatTable <- cbind(flatTable,measurements)    

    names(flatTable) <- ColumnRenamer(names(flatTable))
    colSubset <- names(flatTable)
    colSubset <- colSubset[str_detect(colSubset, "Mean") | str_detect(colSubset, "Std")]
    colSubset <- colSubset[1:12]
    colSubsetWithIds <- c(names(flatTable)[1:3], colSubset)
    flatTable <- flatTable[,colSubsetWithIds]    
    
    molten <- melt(flatTable, id=c("aId","activity", "subjectId"))
    activityMeans <- dcast(molten,activity+subjectId~variable, mean, drop=TRUE)
    arrange(activityMeans, activity,subjectId)
    
    write.table(activityMeans,"../TidyData.txt", sep="\t", row.names=FALSE)
}

ColumnRenamer <- function(columnName){
    val <- gsub("\\.","", columnName)
    val <- gsub("mean","Mean", val)
    val <- gsub("std","Std", val)
    val <- gsub("id","Id", val)
    val
}

