## read training set
train_data = read.table("train/X_train.txt")
train_labels = read.table("train/y_train.txt")
train_subject = read.table("train/subject_train.txt")

## read test set
test_data = read.table("test/X_test.txt")
test_labels = read.table("test/y_test.txt")
test_subject = read.table("test/subject_test.txt")


## merge labels
labels = rbind(train_labels, test_labels)
names(labels) <- "Labels"

##merge subject
subject = rbind(train_subject, test_subject)
names(subject) <- "Subject"

## merge all data
all_data = rbind(train_data,test_data)

## import features
features = read.table("features.txt")

## add feature names
colnames(all_data) <- levels(features$V2)

## select features
feature_select = all_data[,grepl("mean\\(\\)$|std\\(\\)$", names(all_data))]

## Merge all data
final_df = cbind(feature_select, labels, subject)

## read activity labels
activity = read.table("activity_labels.txt")

##rename activities
final_df$Labels <- as.factor(final_df$Labels)
levels(final_df$Labels)<-as.character(activity$V2)

## Adding descriptive names
names(final_df) <- gsub("^f", "frequency", names(final_df))
names(final_df) <- gsub("^t", "time", names(final_df))
names(final_df) <- gsub("Acc", "Accelerometer", names(final_df))
names(final_df) <- gsub("Gyro", "Gyroscopic", names(final_df))
names(final_df) <- gsub("Mag", "Magnitude", names(final_df))
names(final_df) <- gsub("BodyBody", "Body", names(final_df))


## Create tidy dataset

tidy_data = aggregate(final_df[1:18], by=list(final_df$Labels, final_df$Subject), FUN = mean, na.rm=TRUE)
colnames(tidy_data)[1] <- "Activity"
colnames(tidy_data)[2] <- "Subject"

write.table(tidy_data, file="tidy.txt", row.name=FALSE)
