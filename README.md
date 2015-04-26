Coursera Getting and Cleaning Data Course Project

## How to run

```bash
# ==== In bash ====
git clone git@github.com:weilu/clean-data-course-project.git
cd clean-data-course-project
R
```

```R
# ==== In R console ====
source('run_analysis.R')

# verify the output
data <- read.table('tidy.txt', header = TRUE)
dim(data) # [1] 180  88
View(data)

# bonus: in case you are interested in the intermediate data
dim(merged) # [1] 10299   564 ## merged test and train data with all the original feature columns, plus "activity", "activityID", and "subject"
dim(pruned) # [1] 10299    88 ## merged test and train data with only the means and standard deviation columns, plus "activity", and "subject"
```

Upon running the script you should see the output file tidy.txt appear in your working directory.

## How it works

The only R script `run_analysis.R` cares about 8 files in the data directory `UCI HAR Dataset`:

- activity_labels.txt
- features.txt
- test/subject_test.txt
- test/X_test.txt
- test/y_test.txt
- train/subject_train.txt
- train/X_train.txt
- train/y_train.txt

It first reads the labels files (activity_labels.txt and features.txt), followed by reading the test and train data (the rest of the files). Each file in the test and train data folder are combined column wise, as they have the same number of observations. The feature columns are named with the feature labels. Then read test data and train data are combined row wise, as they share the same set of columns. The activities are translated to descriptive names using the activity labels. We then extracts the columns we are interested in: all the mean and standard deviation columns (matching on "mean" or "std", ignore case and position), "activity" and "subject". With the pruned data set, we then produce the tidy data set with the average of each variable for each activity and each subject.

The end result is inline with the requirements of "tidy data"[*]

- [x] Each variable you measure should be in one column
- [x] Each different observation of that variable should be in a different row: every row corresponds to one subject and one activity
- [x] There should be one table for each "kind" of variable: I consider "mean" and "standard deviation" the same kind of variables as they go hand-in-hand when used to characterize data
- [ ] If you have multiple tables, they should include a column in the table that allows them to be linked: Not applicable

## Credits

The data directory "HCI HAR Dataset" is downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip (last retrieved on 26/4/2015). The original data set alongside its relevant information are hosted at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

[*]: https://github.com/DataScienceSpecialization/courses/blob/master/03_GettingData/01_03_componentsOfTidyData/index.md
