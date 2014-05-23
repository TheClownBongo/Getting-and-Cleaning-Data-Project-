# Create a temporary file that is a zip file
zipfile <- tempfile()

# Now download the zip file 

fileurlproject <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurlproject, zipfile, method = "curl")

# Now unzip the directory
unzip(zipfile)

# Get the name of the directory that was unzipped
list.files()

# Set the working directory as UCI
setwd("UCI HAR Dataset")

# Look at the contents of the directory UCI HAR Dataset
list.files()

# In the train and test directory, you have 3 files and a directory
# - subject_j.txt indicates which subject provided the information, j = train, test 
# - y_j.txt gives the label of the activity, j = train, test
# - X_j.txt gives the measurements collected, j = train, test
# - The directory Inertial Signals has for the x, y, and z coordinates
# - The body acceleration signal obtained by substracting the 
# gravity from total acceleration body_acc_i_j.txt, i = x,y,z, j = train, test
# - The angular velocity vector measured by gyroscope for each
# window sample body_gyro_i_j.txt, i=x,y,z, j = train, test
# - The acceleration signal from the smart phone accelerometer in 
# standard gravity units total_acc_i_j.txt, i=x,y,z, j = train, test

# Load the train data into the data frame trainSmartPhoneData,
# the activity code into trainActivity, and the subject number
# in trainSubject
trainSmartPhoneData <- read.table("./train/X_train.txt")
trainActivity <- read.table("./train/y_train.txt")
trainSubject <- read.table("./train/subject_train.txt")

# Add to the data frame trainSmartPhoneData, the activity code, and
# the subject number
trainSmartPhoneData <- cbind(trainSmartPhoneData, trainActivity, trainSubject)

# Get the size of the training set
dim(trainSmartPhoneData)

# Load the test data into the data frame testSmartPhoneData
# the activity code into testActivity, and the subject number
# in testSubject
testSmartPhoneData <- read.table("./test/X_test.txt")
testActivity <- read.table("./test/y_test.txt")
testSubject <- read.table("./test/subject_test.txt")

# Add to the data frame trainSmartPhoneData, the activity code, and
# the subject number
testSmartPhoneData <- cbind(testSmartPhoneData, testActivity, testSubject)

# Get the size of the training set
dim(testSmartPhoneData)

# Merge the two data frame, training and testing data into one
# data frame SmartPhoneData
SmartPhoneData <- rbind(trainSmartPhoneData, testSmartPhoneData)

# Check whether there is missing data
length(complete.cases(SmartPhoneData))

# Find the dimensions of the data frame SmartPhoneData
dimSmartPhoneData <- dim(SmartPhoneData)

# We are only interested in the mean and standard deviation 
# measurements. We save the information in a new data frame
# SmartPhoneDataMeanStddev

# First get the information for the mean and standard deviation
# of the tBodyAcc in the x, y, and z directions (columns 1-6 of original 
# data frame SmartPhoneData). Name the columns according to the
# codebook
SmartPhoneDataMeanStddev <- data.frame("tBodyAccM_x"=SmartPhoneData[,1], "tBodyAccM_y"=SmartPhoneData[,2], "tBodyAccM_z"=SmartPhoneData[,3], "tBodyAccstddev_x"=SmartPhoneData[,4],"tBodyAccstddev_y"=SmartPhoneData[,5],"tBodyAccstddev_z"=SmartPhoneData[,6] )

# Get the information for the mean and standard deviation of the
# tGravityAcc in the x, y, and z directions (columns 41-46 of original
# data frame SmartPhoneData)
SmartPhoneDataMeanStddev[,"tGravityAccMean_x"] <- SmartPhoneData[,41]
SmartPhoneDataMeanStddev[,"tGravityAccMean_y"] <- SmartPhoneData[,42]
SmartPhoneDataMeanStddev[,"tGravityAccMean_z"] <- SmartPhoneData[,43]
SmartPhoneDataMeanStddev[,"tGravityAccstddev_x"] <- SmartPhoneData[,44]
SmartPhoneDataMeanStddev[,"tGravityAccstddev_y"] <- SmartPhoneData[,45]
SmartPhoneDataMeanStddev[,"tGravityAccstddev_z"] <- SmartPhoneData[,46]

# Get the information for the mean and standard deviation of the
# tBodyAccJerk in the x, y, and z directions (columns 81-86 of original
# data frame SmartPhoneData)
SmartPhoneDataMeanStddev[,"tBodyAccJerkMean_x"] <- SmartPhoneData[,81]
SmartPhoneDataMeanStddev[,"tBodyAccJerkMean_y"] <- SmartPhoneData[,82]
SmartPhoneDataMeanStddev[,"tBodyAccJerkMean_z"] <- SmartPhoneData[,83]
SmartPhoneDataMeanStddev[,"tBodyAccJerkstddev_x"] <- SmartPhoneData[,84]
SmartPhoneDataMeanStddev[,"tBodyAccJerkstddev_y"] <- SmartPhoneData[,85]
SmartPhoneDataMeanStddev[,"tBodyAccJerkstddev_z"] <- SmartPhoneData[,86]

# Get the information for the mean and standard deviation of the
# tBodyGyro in the x, y, and z directions (columns 121-126 of original
# data frame SmartPhoneData)
SmartPhoneDataMeanStddev[,"tBodyGyroMean_x"] <- SmartPhoneData[,121]
SmartPhoneDataMeanStddev[,"tBodyGyroMean_y"] <- SmartPhoneData[,122]
SmartPhoneDataMeanStddev[,"tBodyGyroMean_z"] <- SmartPhoneData[,123]
SmartPhoneDataMeanStddev[,"tBodyGyrostddev_x"] <- SmartPhoneData[,124]
SmartPhoneDataMeanStddev[,"tBodyGyrostddev_y"] <- SmartPhoneData[,125]
SmartPhoneDataMeanStddev[,"tBodyGyrostddev_z"] <- SmartPhoneData[,126]

# Get the information for the mean and standard deviation of the
# tBodyGyroJerk in the x, y, and z directions (columns 161-166 of original
# data frame SmartPhoneData)
SmartPhoneDataMeanStddev[,"tBodyGyroJerkMean_x"] <- SmartPhoneData[,161]
SmartPhoneDataMeanStddev[,"tBodyGyroJerkMean_y"] <- SmartPhoneData[,162]
SmartPhoneDataMeanStddev[,"tBodyGyroJerkMean_z"] <- SmartPhoneData[,163]
SmartPhoneDataMeanStddev[,"tBodyGyroJerkstddev_x"] <- SmartPhoneData[,164]
SmartPhoneDataMeanStddev[,"tBodyGyroJerkstddev_y"] <- SmartPhoneData[,165]
SmartPhoneDataMeanStddev[,"tBodyGyroJerkstddev_z"] <- SmartPhoneData[,166]

# Get the information for the mean and standard deviation of the
# tBodyAccMag (columns 201-202 of original
# data frame SmartPhoneData)
SmartPhoneDataMeanStddev[,"tBodyAccMagMean"] <- SmartPhoneData[,201]
SmartPhoneDataMeanStddev[,"tBodyAccMagstddev"] <- SmartPhoneData[,202]

# Get the information for the mean and standard deviation of the
# tGravityAccMag (columns 214-215 of original
# data frame SmartPhoneData)
SmartPhoneDataMeanStddev[,"tGravityAccMagMean"] <- SmartPhoneData[,214]
SmartPhoneDataMeanStddev[,"tGravityAccMagstddev"] <- SmartPhoneData[,215]

# Get the information for the mean and standard deviation of the
# tBodyAccJerkMag (columns 227-228 of original
# data frame SmartPhoneData)
SmartPhoneDataMeanStddev[,"tBodyAccJerkMagMean"] <- SmartPhoneData[,227]
SmartPhoneDataMeanStddev[,"tBodyAccJerkMagstddev"] <- SmartPhoneData[,228]

# Get the information for the mean and standard deviation of the
# tBodyGyroMag (columns 240-241 of original
# data frame SmartPhoneData)
SmartPhoneDataMeanStddev[,"tBodyGyroMagMean"] <- SmartPhoneData[,240]
SmartPhoneDataMeanStddev[,"tBodyGyroMagstddev"] <- SmartPhoneData[,241]

# Get the information for the mean and standard deviation of the
# tBodyGyroJerkMag (columns 253-254 of original
# data frame SmartPhoneData)
SmartPhoneDataMeanStddev[,"tBodyGyroJerkMagMean"] <- SmartPhoneData[,253]
SmartPhoneDataMeanStddev[,"tBodyGyroJerkMagstddev"] <- SmartPhoneData[,254]

# Get the information for the mean and standard deviation of the
# fBodyAcc in the x, y, and z directions (columns 266-271 of original
# data frame SmartPhoneData)
SmartPhoneDataMeanStddev[,"fBodyAccMean_x"] <- SmartPhoneData[,266]
SmartPhoneDataMeanStddev[,"fBodyAccMean_y"] <- SmartPhoneData[,267]
SmartPhoneDataMeanStddev[,"fBodyAccMean_z"] <- SmartPhoneData[,268]
SmartPhoneDataMeanStddev[,"fBodyAccstddev_x"] <- SmartPhoneData[,269]
SmartPhoneDataMeanStddev[,"fBodyAccstddev_y"] <- SmartPhoneData[,270]
SmartPhoneDataMeanStddev[,"fBodyAccstddev_z"] <- SmartPhoneData[,271]

# Get the information for the mean and standard deviation of the
# fBodyAccJerk in the x, y, and z directions (columns 345-350 of original
# data frame SmartPhoneData)
SmartPhoneDataMeanStddev[,"fBodyAccJerkMean_x"] <- SmartPhoneData[,345]
SmartPhoneDataMeanStddev[,"fBodyAccJerkMean_y"] <- SmartPhoneData[,346]
SmartPhoneDataMeanStddev[,"fBodyAccJerkMean_z"] <- SmartPhoneData[,347]
SmartPhoneDataMeanStddev[,"fBodyAccJerkstddev_x"] <- SmartPhoneData[,348]
SmartPhoneDataMeanStddev[,"fBodyAccJerkstddev_y"] <- SmartPhoneData[,349]
SmartPhoneDataMeanStddev[,"fBodyAccJerkstddev_z"] <- SmartPhoneData[,350]

# Get the information for the mean and standard deviation of the
# fBodyGyro in the x, y, and z directions (columns 424-429 of original
# data frame SmartPhoneData)
SmartPhoneDataMeanStddev[,"fBodyGyroMean_x"] <- SmartPhoneData[,424]
SmartPhoneDataMeanStddev[,"fBodyGyroMean_y"] <- SmartPhoneData[,425]
SmartPhoneDataMeanStddev[,"fBodyGyroMean_z"] <- SmartPhoneData[,426]
SmartPhoneDataMeanStddev[,"fBodyGyrostddev_x"] <- SmartPhoneData[,427]
SmartPhoneDataMeanStddev[,"fBodyGyrostddev_y"] <- SmartPhoneData[,428]
SmartPhoneDataMeanStddev[,"fBodyGyrostddev_z"] <- SmartPhoneData[,429]

# Get the information for the mean and standard deviation of the
# fBodyAccMag (columns 503-504 of original
# data frame SmartPhoneData)
SmartPhoneDataMeanStddev[,"fBodyAccMagMean"] <- SmartPhoneData[,503]
SmartPhoneDataMeanStddev[,"fBodyAccMagstddev"] <- SmartPhoneData[,504]

# Get the information for the mean and standard deviation of the
# fBodyAccJerkMag (columns 516-517 of original
# data frame SmartPhoneData)
SmartPhoneDataMeanStddev[,"fBodyAccJerkMagMean"] <- SmartPhoneData[,516]
SmartPhoneDataMeanStddev[,"fBodyAccJerkMagstddev"] <- SmartPhoneData[,517]

# Get the information for the mean and standard deviation of the
# fBodyGyroMag (columns 529-530 of original
# data frame SmartPhoneData)
SmartPhoneDataMeanStddev[,"fBodyGyroMagMean"] <- SmartPhoneData[,529]
SmartPhoneDataMeanStddev[,"fBodyGyroMagstddev"] <- SmartPhoneData[,530]

# Get the information for the mean and standard deviation of the
# fBodyBodyGyroJerkMag (columns 542-543 of original
# data frame SmartPhoneData)
SmartPhoneDataMeanStddev[,"fBodyGyroJerkMagM"] <- SmartPhoneData[,542]
SmartPhoneDataMeanStddev[,"fBodyGyroJerkMagstddev"] <- SmartPhoneData[,543]

# Add to the data frame SmartPhoneDataMeanStddev the activity listed as a factor
SmartPhoneDataMeanStddev$Activity <- SmartPhoneData[,562]

# Describe in English the activity instead as being a factor
SmartPhoneDataMeanStddev$Activity[SmartPhoneDataMeanStddev$Activity=="1"] <- "Walking"
SmartPhoneDataMeanStddev$Activity[SmartPhoneDataMeanStddev$Activity=="2"] <- "Walking Upstairs"
SmartPhoneDataMeanStddev$Activity[SmartPhoneDataMeanStddev$Activity=="3"] <- "Walking Downstairs"
SmartPhoneDataMeanStddev$Activity[SmartPhoneDataMeanStddev$Activity=="4"] <- "Sitting"
SmartPhoneDataMeanStddev$Activity[SmartPhoneDataMeanStddev$Activity=="5"] <- "Standing"
SmartPhoneDataMeanStddev$Activity[SmartPhoneDataMeanStddev$Activity=="6"] <- "Laying"

# Add a column to your data frame indicating the activity type the
# subject is engaged in as well the subject number
SmartPhoneDataMeanStddev[,"Subject"] <- SmartPhoneData[,563]

# Find the dimension of the data frame SmartPhoneDataMeanStddev
dimSmartPhoneDataMeanStddev <- dim(SmartPhoneDataMeanStddev)

# Define the data frame SmartPhoneSummaryData
SmartPhoneSummaryData <- data.frame("tBodyAccMean_x" = numeric(36),
    "tBodyAccMean_y" = numeric(36), "tBodyAccMean_z" = numeric(36),
    "tBodyAccstddev_x" = numeric(36), "tBodyAccstddev_y" = numeric(36), 
    "tBodyAccstddev_z" = numeric(36), "tGravityAccMean_x" = numeric(36),
    "tGravityAccMean_y" = numeric(36), "tGravityAccMean_z" = numeric(36),
    "tGravityAccstddev_x" = numeric(36), "tGravityAccstddev_y" = numeric(36), 
    "tGravityAccstddev_z" = numeric(36), "tBodyAccJerkMean_x" = numeric(36),
    "tBodyAccJerkMean_y" = numeric(36), "tBodyAccJerkMean_z" = numeric(36),
    "tBodyAccJerkstddev_x" = numeric(36), "tBodyAccJerkstddev_y" = numeric(36),
    "tBodyAccJerkstddev_z" = numeric(36), "tBodyGyroMean_x" = numeric(36),
    "tBodyGyroMean_y" = numeric(36), "tBodyGyroMean_z" = numeric(36),
    "tBodyGyrostddev_x" = numeric(36), "tBodyGyrostddev_y" = numeric(36), 
    "tBodyGyrostddev_z" = numeric(36), "tBodyGyroJerkMean_x" = numeric(36),
    "tBodyGyroJerkMean_y" = numeric(36), "tBodyGyroJerkMean_z" = numeric(36),
    "tBodyGyroJerkstddev_x" = numeric(36), "tBodyGyroJerkstddev_y" = numeric(36), 
    "tBodyGyroJerkstddev_z" = numeric(36), "tBodyAccMagMean" = numeric(36),
    "tBodyAccMagstddev" = numeric(36), "tGravityAccMagMean" = numeric(36),
    "tGravityAccMagstddev" = numeric(36), "tBodyAccJerkMagMean" = numeric(36),
    "tBodyAccJerkMagstddev" = numeric(36), "tBodyGyroMagMean" = numeric(36),
    "tBodyGyroMagstddev" = numeric(36),"tBodyGyroJerkMagMean" = numeric(36),
    "tBodyGyroJerkMagstddev" = numeric(36), "fBodyAccMean_x" = numeric(36),
    "tBodyAccMean_y" = numeric(36), "fBodyAccMean_z" = numeric(36),
    "fBodyAccstddev_x" = numeric(36), "fBodyAccstddev_y" = numeric(36), 
    "fBodyAccstddev_z" = numeric(36), "fBodyAccJerkMean_x" = numeric(36),
    "fBodyAccJerkMean_y" = numeric(36), "fBodyAccJerkMean_z" = numeric(36),
    "fBodyAccJerkstddev_x" = numeric(36), "fBodyAccJerkstddev_y" = numeric(36),
    "fBodyAccJerkstddev_z" = numeric(36), "fBodyGyroMean_x" = numeric(36),
    "fBodyGyroMean_y" = numeric(36), "fBodyGyroMean_z" = numeric(36),
    "fBodyGyrostddev_x" = numeric(36), "fBodyGyrostddev_y" = numeric(36), 
    "fBodyGyrostddev_z" = numeric(36), "fBodyAccMagMean" = numeric(36),
    "fBodyAccMagstddev" = numeric(36), "fBodyAccJerkMagMean" = numeric(36),
    "fBodyAccJerkMagstddev" = numeric(36), "fBodyGyroMagMean" = numeric(36),
    "fBodyGyroMagstddev" = numeric(36), "fBodyGyroJerkMagMean" = numeric(36), 
    "fBodyGyroJerkMagstddev" = numeric(36))

# Define the number of columns
numcolSummary <- dim(SmartPhoneSummaryData)[2]

# Name the rows of the data frame SmartPhoneSummaryData
rownames(SmartPhoneSummaryData) <- c("walking", "walkingupstairs",
    "walkingdownstairs", "sitting", "standing", "laying", "subject1",
    "subject2", "subject3", "subject4", "subject5", "subject6",
    "subject7", "subject8", "subject9", "subject10", "subject11",
    "subject12", "subject13", "subject14", "subject15", "subject16",
    "subject17", "subject18", "subject19", "subject20", "subject21",
    "subject22", "subject23", "subject24", "subject25", "subject26",
    "subject27", "subject28", "subject29", "subject30")

# Populate the data frame SmartPhoneSummaryData with the means of
# each column for the Walking, Walking Upstairs, Walking Downstairs,
# Sitting, Standing, Laying, and each subject
SmartPhoneSummaryData["walking", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Activity == "Walking", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["walkingupstairs", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Activity == "Walking Upstairs", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["walkingdownstairs", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Activity == "Walking Downstairs", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["sitting", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Activity == "Sitting", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["standing", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Activity == "Standing", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["laying", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Activity == "Laying", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])

# Add to the data frame SmartPhoneSummaryData the average of each variable 
# by subject number
SmartPhoneSummaryData["subject1", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Subject == "1", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["subject2", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Subject == "2", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["subject3", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Subject == "3", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["subject4", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Subject == "4", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["subject5", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Subject == "5", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["subject6", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Subject == "6", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["subject7", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Subject == "7", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["subject8", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Subject == "8", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["subject9", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Subject == "9", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["subject10", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Subject == "10", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["subject11", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Subject == "11", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["subject12", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Subject == "12", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["subject13", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Subject == "13", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["subject14", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Subject == "14", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["subject15", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Subject == "15", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["subject16", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Subject == "16", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["subject17", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Subject == "17", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["subject18", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Subject == "18", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["subject19", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Subject == "19", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["subject20", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Subject == "20", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["subject21", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Subject == "21", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["subject22", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Subject == "22", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["subject23", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Subject == "23", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["subject24", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Subject == "24", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["subject25", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Subject == "25", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["subject26", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Subject == "26", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["subject27", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Subject == "27", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["subject28", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Subject == "28", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["subject29", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Subject == "29", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])
SmartPhoneSummaryData["subject30", 1: numcolSummary] <- colMeans(SmartPhoneDataMeanStddev[SmartPhoneDataMeanStddev$Subject == "30", -c(dimSmartPhoneDataMeanStddev[2]-1, dimSmartPhoneDataMeanStddev[2])])

# Now that you have populated the data frames SmartPhoneDataMeanStddev and
# SmartPhoneSummaryData, save them into a file with write.table
write.table(SmartPhoneDataMeanStddev, "./Mean_StdDevData.txt", sep = "\t", 
    eol = "\n", row.names = TRUE, col.names = TRUE)
write.table(SmartPhoneSummaryData, "./ActivitySubjectData.txt", sep = "\t", 
            eol = "\n", row.names = TRUE, col.names = TRUE)

