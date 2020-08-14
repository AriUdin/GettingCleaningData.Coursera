# GettingCleaningData.Coursera

In this final project, Data should be collected and cleaned in order to be able for further processing analysis process.
At the beginning, the data should be collected from the course link-website, or it can be obtained from the MCI machine learning website <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>. In this project, the measured data is obtained from the experimental study related to the human activity. This experimental study consist of six observational activities that conducted into two part with random method. Most of the data are generated for the training dataset, around 70% of the total data, while the test data will cover 30% of the collected data. 


Data source :
============

The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.


After the data has finished collected from the course's website, this downloaded file should be extracted in order to ease the data reading and collection. This data contains the set of data that measured by accelerometer and gyroscope 3-axial raw signal.

Basically, those measurement devices will collect the signal data at the relatively constant rate of 50 Hz. Furthermore, by applying the Butterworth filter, all those signal are converted to the new variables, for instance tBodyAcc, tGravityAcc,tBodyGyro, and etc.

Further analysis process, those new variables are derived in time domain to create new variables. Also, the three dimensional magnitude are determined by the Euclidean norm.

In the last process, the collected data and new variables are analysed by the Fast Fourier Transform to obtain the frequency domain signals. 


Data variable and Transformation :
================================

Generally, the collected data are divided into two type, the time domain data (represented by initial letter t) and the frequency domain data (represented by letter f). Later, those variable name will be converted as 'timed based variable' and 'FFT based variable' to represent time and frequency domain respectively. following are the original data variable names,
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

In this project, the data processing only cover the extraction of the mean and standard deviation of the measurement result. The extraction process will focus only at the variable that indicated as the mean value and the standard deviation of the original dataset.

In the beginning, the data collected from two categories, the train and the test. Each category has dataset that contains of activity and id number of experiment. After that, all the data from two dataset will be merged in order to have single working database. Since the main object in this project only the mean and standard deviation, all other variables will be removed. In order to have better understanding in the extracted data, all the variable names, including the activities name, will be modified. For the measurement variable, the name will explain the domain and its type, for instance 'tBodyAcc-mean()-X' will be converted to 'Time based Body Acc mean X'. 

Lastly, the new dataset will be created. This new dataset is consisted of the mean value of each id and their activities. This new dataset will be written as text format.


Reference :
===========

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

