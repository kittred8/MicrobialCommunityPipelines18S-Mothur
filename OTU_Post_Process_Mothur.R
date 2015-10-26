#Use the R script "OTU_Post_Process_Mothur.R" to post process 18S eukaryotic data tables.
#Combines OTU table with taxonomic names of OTUs in a format usable by vegan package.
#Need to set working directory where the two files below are located (.shared and .taxonomy)
module load R
R
rm(list=ls())

s16otu=read.table("stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pds.wang.pick.pick.tx.shared",header=TRUE, sep="\t",fill=T,stringsAsFactors=F)
s16tax=read.table("stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pds.wang.pick.pick.tx.1.cons.taxonomy",header=TRUE, sep="\t",fill=T,stringsAsFactors=F)
s1=t(s16otu)
s1=s1[-c(1,2,3),]
colnames(s1)=s16otu[,2]
s16=cbind(s16tax[,c(3,1)],s1)
colnames(s16)[c(1,2)]=c("Taxonomy","OTU")


s18otu=read.table("stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.nr_v119.wang.pick.tx.shared",header=TRUE, sep="\t",fill=T,stringsAsFactors=F)
s18tax=read.table("stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.nr_v119.wang.pick.tx.1.cons.taxonomy",header=TRUE, sep="\t",fill=T,stringsAsFactors=F)
s2=t(s18otu)
s2=s2[-c(1,2,3,239),]
colnames(s2)=s18otu[,2]
s18=cbind(s18tax[,c(3,1)],s2)
colnames(s18)[c(1,2)]=c("Taxonomy","OTU")

write.table(s18,"Nambia_Iowa_18S_9-28-15.txt",sep="\t",row.names=FALSE)

