library(factoextra)  

df<-read.csv("data.csv",header=T,row.names = 1)  

head(df)

#Extract the first 100 lines for testing in df
df2 <- df[1:100,]

wssplot <- function(df2, nc=25, seed=1234){
  wss <- (nrow(df2)-1)*sum(apply(df2,2,var))
  for (i in 2:nc){
    set.seed(seed)
    wss[i] <- sum(kmeans(df2, centers=i)$withinss)
  }
  plot(1:nc, wss, type="b", xlab="Number of Clusters",
       ylab="Within groups sum of squares")}

#画碎石图，找具体分类数
wssplot(df2)

#method = "wss"
fviz_nbclust(df2, kmeans, method = "wss")

#calculate gap statistic based on number of clusters
library(cluster)
gap_stat <- clusGap(df2,
                    FUN = kmeans,
                    nstart = 25,
                    K.max = 25,
                    B = 50)

#identify the optimal number of clusters
fviz_gap_stat(gap_stat)

#make this example reproducible
set.seed(1)

#setting number of clusters
km <- kmeans(df2, centers = 12, nstart = 25)

#km 
km
#gene number of each cluster
km$size