## Getting Cleaning Data Project

## Data collection and extraction
link <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(link,"./Dataset.zip",method = "curl")
unzip("Dataset.zip")

## Reading and Merging the dataset
for (i in c("train","test")) {
    for (j in c("X","y","subject")) {
        file <- paste0(j,"_",i,".txt")
        file <- file.path("./UCI HAR Dataset",i,file)
        file <- read.table(file)
        if (!exists("dataset")) {dataset = data.frame(file, row.names = NULL); next}
        dataset <- data.frame(file,dataset, row.names = NULL)
    }
    rm("file")
    if (!exists("merged.dataset")) {merged.dataset = dataset; rm("dataset"); next}
    merged.dataset <- merge(dataset, merged.dataset, by = intersect(names(dataset), names(merged.dataset)), all = TRUE)
    rm("dataset")
}

## Extraction of the variables that represent the mean and the standard deviation each measurement
Column.label <- read.table("./UCI HAR Dataset/features.txt")[,2]
Column.label <- c("Id","Activity",Column.label)
colnames(merged.dataset) <- Column.label
mean.sd.index <- grep("[a-zA-Z]*(\\-mean\\(|\\-st).", Column.label)
extracted.dataset <- merged.dataset[,c(1,2,mean.sd.index)] 

## Modification on the activity name with descriptive value
Activity.label <- read.table("./UCI HAR Dataset/activity_labels.txt")
extracted.dataset[2] <- Activity.label$V2[extracted.dataset[,2]]

## Modification on the labels of the data set with descriptive variable names.
colnames(extracted.dataset) <- gsub("\\-", " ", colnames(extracted.dataset))
colnames(extracted.dataset) <- gsub("\\(\\)", "", colnames(extracted.dataset))
colnames(extracted.dataset) <- gsub("([a-z])([A-Z])", "\\1 \\2", colnames(extracted.dataset))
colnames(extracted.dataset) <- gsub("^[Tt]","Time Based ", colnames(extracted.dataset))
colnames(extracted.dataset) <- gsub("^[Ff]","FFT Based ", colnames(extracted.dataset))

## Generating new dataset that summarize the mean on each variable of each Id and activity
extracted.dataset[,1:2] <- lapply(extracted.dataset[,1:2], as.factor)
Id.and.Activity.meanVar <- aggregate(. ~ Id + Activity, extracted.dataset, mean)

## Generating new tidy data file
write.table(Id.and.Activity.meanVar, file = "New_tidy_dataset.txt", sep = " ", col.names = NA, qmethod = "double")