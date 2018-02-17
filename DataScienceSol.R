library(utils)

#train <- read.csv(file="C:\\Users\\Nikhil Kumar Sharma\\Downloads\\Deduplication Problem - Sample Dataset.csv")
train <- read.csv(file="Deduplication Problem - Sample Dataset.csv")
train
library(dplyr)
train2 <- train

train1 <- train[!duplicated(train[,1:4]),]
 
my_solution <- data.frame(ln = train1$ln, dob = train1$dob, gn = train1$gn , fn = train1$fn )

train2$fullNAme <- paste(train2$fn, train2$ln) 
train2$fullNameDob <- paste(train2$fullNAme, train2$dob)
train2$fullNameDobSex <- paste(train2$fullNameDob, train2$gn)
train3 <- train2[!duplicated(train2[,7]),]

my_solution_two <- data.frame(ln = train3$ln, dob = train3$dob, gn = train3$gn , fn = train3$fn )

train3
train4 <- my_solution_two
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
