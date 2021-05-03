#Script to run a differential expression analysis using deseq2


#Preparing input data:
#Path to htseq-files
directory <- "/home/huda4885/genome_analysis/Genome-Analysis/genome_analysis_project/analysis/09_htseq"
#List the files to use
sampleFiles <- grep("counts",list.files(directory),value=TRUE)
#What condition each file was cultured in
sampleCondition <- c("Continous","Continous", "Batch", "Batch", "Continous", "Continous", "Continous", "Batch", "Batch", "Continous")
#Creating a dataframe
sampleTable <- data.frame(sampleName = sampleFiles, fileName = sampleFiles, condition = sampleCondition)
#Creating a deseqdataset 
ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable, directory = directory, design = ~condition)


#Running the standard differential expression analysis with a single function:
dds <- DESeq(ddsHTSeq)

#Generating a results table
res <- results(dds)

#Order result by smallest p-value
resOrdered <- res[order(res$pvalue),]

#Summarize some basic tallies
summary(res)
#The number of adjusted p-values below 0.1 = 
sum(res$padj < 0.1, na.rm=TRUE)

#Default cutoff-value alpha = 0.1.
#aplha = 0.05
res05 <- results(dds, alpha=0.05)
summary(res05)
sum(res05$padj < 0.05, na.rm=TRUE)



resLFC <- lfcShrink(dds, coef="condition_Continous_vs_Batch", type="apeglm")

png("ma_plot.png")
plotMA(res, ylim=c(-2,2))
dev.off()

png("ma_plot_resLFC.png")
plotMA(resLFC, ylim=c(-2,2))
dev.off()

png("count_plot_minp.png")
plotCounts(dds, gene=which.min(res$padj), intgroup="condition")
dev.off()
