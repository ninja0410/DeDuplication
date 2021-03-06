library(utils)

#train <- read.csv(file="C:\\Users\\Nikhil Kumar Sharma\\Downloads\\Deduplication Problem - Sample Dataset.csv")
train <- read.csv(file="Deduplication Problem - Sample Dataset.csv")
train
library(dplyr)
train2 <- train

train4 <- train
train4$ln_1 <- sapply(strsplit(as.character(train4$ln),' '), "[", 1)
train4$ln_2 <- sapply(strsplit(as.character(train4$ln),' '), "[", 2)
train4
train4$fn_1 <- sapply(strsplit(as.character(train4$fn),' '), "[", 1)
train4$fn_2 <- sapply(strsplit(as.character(train4$fn),' '), "[", 2)
train4
train5 <- train4[!duplicated(train4[,c("dob","gn","ln_1","fn_1")]),]
train5
my_solution_three <- data.frame(ln = train5$ln, dob = train5$dob, gn = train5$gn , fn = train5$fn )
write.csv(my_solution_three, file = "Deduplication_Problem_Sample_Output_final.csv", row.names = FALSE)
