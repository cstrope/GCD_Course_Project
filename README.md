# GCD_Course_Project
The course project for the Data Scientists Toolbox: Getting and Cleaning Data

This is a script for working with the data found in "Human Activity Recognition Using Smartphones Dataset: Version 1.0". This script reads information and reorganizes the data into a tidy dataset

# Data Organization
The run_analysis.R script requires the "UCI HAR Dataset" information to be in the same directory as the script. The files necessary are 
- 'run_analysis.R': the script returning the tidy data		
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

run_analysis.R concatenates the training and testing data, adds the activity_labels (from activity_labels.txt) and subject IDs (from subject_train.txt for each of test/ and train/ folders) as columns. The training and testing labels from train/y_train.txt and test/y_test.txt are translated to their activity_labels are translated from their numeric identifier to the character description found in activity_labels.txt. The columns of the feature vectors from train/x_train.txt and test/x_test.txt are labelled using the features.txt file. After data is concatenated, we filter the data to include only columns describing the mean (containing mean() or Mean) and standard deviations (std()) of the data. 

After running run_analysis.R, the file 'tidyData.txt' is returned in the same directory as 'run_analysis.R'. 'tidyData.txt' is a 180 (6 activities x 30 subjects) row by 88 column dataset. Each row reports the mean value for each column for one subject and one activity.


# Data Collection Setup Description

Data collected from conference presentation:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.



