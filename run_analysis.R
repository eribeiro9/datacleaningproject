run_analysis <- function()
{
    # Load the training data, testing data, features, and activity labels
    trainX <- read.table("X_train.txt");
    trainy <- read.table("y_train.txt");
    trainSubject <- read.table("subject_train.txt");
    testX <- read.table("X_test.txt");
    testy <- read.table("y_test.txt");
    testSubject <- read.table("subject_test.txt");
    features <- read.table("features.txt");
    activity_labels <- read.table("activity_labels.txt");
    
    # Merge training data and testing data
    Xdata <- rbind(trainX, testX);
    ydata <- rbind(trainy, testy);
    subjects <- rbind(trainSubject, testSubject);
    
    # Give descriptive names to activities
    activities <- activity_labels[ydata[, 1], 2];
    
    # Rename columns
    names(Xdata) <- features[, 2];
    names(subjects) <- "Subject";
    
    # Remove unnecessary columns
    Xdata <- Xdata[, sort(c(grep("mean()", names(Xdata), fixed = TRUE), grep("std()", names(Xdata))))];
    
    # Merge all data
    data <- cbind(subjects, activities, Xdata);
    
    # Rename Activity column
    names(data)[2] <- "Activity";
    
    # Order data by subject and activity
    data <- data[order(data$Subject, data$Activity),];
    
    # Create new table of averages
    avgData <- split(data[, -(1:2)], list(data$Subject, data$Activity));
    avgData <- sapply(avgData, apply, 2, mean);
    avgData <- t(avgData);
    
    # Split rownames into two columns
    splitNames <- strsplit(rownames(avgData), "\\.");
    subjectList <- sapply(splitNames, "[", 1);
    activityList <- sapply(splitNames, "[", 2);
    avgData <- cbind(subjectList, activityList, avgData);
    colnames(avgData)[1:2] <- c("Subject", "Activity");
    rownames(avgData) <- NULL;
    return(avgData);
}