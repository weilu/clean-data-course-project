DATA.DIR = 'UCI\ HAR\ Dataset'
FEATURE.LABELS.FILEPATH = file.path(DATA.DIR, 'features.txt')
ACTIVITY.LABELS.FILEPATH = file.path(DATA.DIR, 'activity_labels.txt')

allData <- NA

main <- function() {
  # read test data and train data
  testData <- buildDataFrame(file.path(DATA.DIR, 'test'))
  trainData <- buildDataFrame(file.path(DATA.DIR, 'train'))

  # merge test data and train data into a single data frame
  allData <<- rbind(testData, trainData)

  # meaningful labels for activities in every row
  activityLabels <- read.table(ACTIVITY.LABELS.FILEPATH, colClasses="character", col.names = c("activityID", "activity"))
  merge(activityLabels, allData, by="activityID")
}

# Take a directory, combine data from X_*.txt, y_*.txt, and subject_*.txt into
# a data frame with appropriately headers. The activities (in y_*.txt) are
# also translated to descriptive names
#
# param: a directory path
# returns: a data frame consisting of columns each named after its originating file
buildDataFrame <- function(dirpath) {
  # prepare headers
  featureLabels <- read.table(FEATURE.LABELS.FILEPATH, colClasses="character")
  headers <- c("subject", "activityID", featureLabels[, 2])

  # prepare data
  prefixes <- c("subject_", "y_", "X_") # order must match headers
  combined <- list()
  for(i in 1:3) {
    filename <- list.files(dirpath, pattern = prefixes[i], full.names = T)[1]
    combined <- c(combined, read.table(filename))
  }
  combined <- as.data.frame(combined)
  colnames(combined) <- headers

  return combined
}

main()
