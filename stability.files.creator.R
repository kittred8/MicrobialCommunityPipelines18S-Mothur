#Before mothur can be run to process sequence reads and create OTU tables, you need to create a "stability.files" list, which
#actually can be called anything you want. "stability.files" contains columns with the truncated name of the sample (1st column), 
#the complete file names of the quality controlled forward (2nd column) and reverse reads (3rd column). 
#The creation of this file can be done in R using the following script (stability.files.creator.R):
#Use the following Script in R (stability.files.creator.R), #Also, for now you are going to have to manually remove the _L001_R1.fastq from each file in the "stability.files"
#In a newer version I will do this in the R code above.
module load R
R

library("stringr")
library("plyr")

filenames <- system("ls *fastq*", intern=T)

forward="R1"
reverse="R2"

R1_idx <- grep(forward, filenames)
R1_files <- filenames[R1_idx]

R2_idx <- grep(reverse, filenames)
R2_files <- filenames[R2_idx]

filenames.fin <- data.frame(R1_files, R2_files)

stability.files <- data.frame(group=ldply(str_split(filenames.fin[,1], "18S"))$V1, filenames.fin)

write.table(stability.files, "stability.files", sep = "\t", row.names=F, col.names=F, quote=F)

