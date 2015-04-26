## Project Description

This project aims to produce a tidy data set with the average of each variable for each activity and each subject from the data collected from the accelerometers from the Samsung Galaxy S smartphone.

## Study design and data processing

### Collection of the raw data

The raw data resides in directory "HCI HAR Dataset". It is downloaded from

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip (last retrieved on 26/4/2015).

The original data set alongside its relevant information are hosted at

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Creating the tidy datafile

### Guide to create the tidy data file

```bash
# ==== In bash ====
git clone git@github.com:weilu/clean-data-course-project.git
cd clean-data-course-project
R
```

```R
# ==== In R console ====
source('run_analysis.R')
```

Upon running the script you should see the output file tidy.txt appear in your working directory.

### Cleaning of the data

1. Merges the training and the test sets to create one data set.
2. Appropriately labels the data set with descriptive variable names.
3. Uses descriptive activity names to name the activities in the data set
4. Extracts only the measurements on the mean and standard deviation for each measurement.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

[See README.md for greater details](https://github.com/weilu/clean-data-course-project/blob/master/README.md)

## Description of the variables in the tidy.txt file

- Dimensions: 180 88
- Summary: [See summary.txt](https://github.com/weilu/clean-data-course-project/blob/master/summary.txt)
- Variables: [See variables.txt](https://github.com/weilu/clean-data-course-project/blob/master/variables.txt)

### Variable details
[See str.txt](https://github.com/weilu/clean-data-course-project/blob/master/str.txt)

#### Notes on "activity":

The activity a subject performed. There are 6 levels of this factor:

    WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

#### Notes on "subject":

The label of the person who participated in the experiment. There are labeled with `1:30`

#### Notes on feature variables:

The classes and units are the same as the original data set. [See features_info.txt](https://github.com/weilu/clean-data-course-project/blob/master/UCI%20HAR%20Dataset/features_info.txt)

