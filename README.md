# GettingCleaningData.Coursera
Final project of getting and cleaning data on COURSERA website

Data collection and processing :
=============================

In the beginning all the data is downloaded and collected from the course website. After that, the collected data should be extracted before data reading/loading process. Both of those process can be conducted manually or by automatically by the script.

After the extraction has finished, the data can be loaded as the data frame type. In this script, the looping process are applied to load all the data in the downloaded data to ease the loading process. It can be applied due to the location of each file is well structured.

Generally, the file that loaded in this script are three files from both folder train and test. In the beginning the "X.txt"" files of both train and test are loaded. Those files contain of the measurement of each variable. After that the "y.txt" files are loaded to have data related to the measurement activities. Lastly, the "subject.txt" file are loaded to inform the id of each measurement activity.

Moreover, the data frame of train and test activity are merged to have single dataset. The merging process is based on the intersection/similarity of the variable names. Since those dataset has same variable names, it will prevent the duplication of similar variable.

The second step are extracting the mean and standard deviation of the measurement. Initially, all variable names are loaded based on the "features.txt" file. This file is read as the vector string of "Column.label". Since in the merged dataset are consisted of two additional columns, the id and activity, the vector string is modified by adding those variable names. After each column has variable name, the extraction process are conducted by 'grep' function while the filter procedure by regular expression method. The filter method is by filtering the variable that consisted of dashed symbol (-) and word of mean or std. It is applied to remove the weighted mean value. After the filtering has finished, the extraction is based on the index of filter criterion and two additional variable, Id and Activity.

Further procedure, since the activity column is consisted of numeric value, it is better to have descriptive categorial value of each row. This modification is conducted by convert the numeric value to the characteristic value based on the file "activity_label.txt". Initially, the file is loaded, then each of numeric value calls its description on the loaded file. The new vector of string is loaded to the extracted dataset to replace the numeric value on the activity column.

Then, for the name of each variable, the script will modified the name by following procedure,
1. Subtitute the dash symbols (-) to the space (" "), for instance variable 'tBodyAcc-mean()-X' will be 'tBodyAcc mean() X'
2. Then the round bracket ("()") are removed, for instance 'tBodyAcc mean() X' is going to 'tBodyAcc mean X'
3. Giving space between the lower case and upper case, 'tBodyAcc mean X' will be 't Body Acc mean X'
4. Lastly, all the domain measurement type will be change to more descriptive name, for the time domain from the initial 't' will be changed to 'Timed Based', for instance  'Time Based Body Acc mean X'. The FFT domain also changed similar to the time domain.

Last procedure are creating new dataset that consist of the mean of each extracted variable that grouped based on each Id and Activity.
In the beginning, the Id and Activity variables should be changed into categorical data. After that all the data are arranged based on Id and activity then determine its mean with the 'mean' function. After the new dataset is created, this new dataset is compiled into new tidy data set file, 'New_tidy_dataset.txt'.
