

library(Mfuzz)

#read data
protein <- read.delim('CK-RP_Network1_FC.txt', row.names = 1, check.names = FALSE)
protein <- as.matrix(protein)

#Build Object
mfuzz_class <- new('ExpressionSet',exprs = protein)

#Pre processing missing value or outlier
mfuzz_class <- filter.NA(mfuzz_class, thres = 0.25)
mfuzz_class <- fill.NA(mfuzz_class, mode = 'mean')
mfuzz_class <- filter.std(mfuzz_class, min.std = 0)

#Standardize Data
mfuzz_class <- standardise(mfuzz_class)

m <- mestimate(mfuzz_class)

#Mfuzz fuzzy c-means 

set.seed(123)
cluster_num <- 6
mfuzz_cluster <- mfuzz(mfuzz_class, c = cluster_num, m = mestimate(mfuzz_class))

#plot
mfuzz.plot2(mfuzz_class, cl = mfuzz_cluster, mfrow = c(2, 3), 
            colo="fancy", ax.col="black",bg = "white",col.axis="black",col.lab="black",
            col.main="black",col.sub="blue",col="blue", centre=F, time.labels = colnames(protein))
