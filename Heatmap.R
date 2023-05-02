
library(pheatmap)

df <- read.delim("clipboard",header=T,row.names=1)

pheatmap(df)

range(df)

pheatmap(df,treeheight_row=100,treeheight_col=20)


pheatmap(df,treeheight_row=100,treeheight_col=20,
         cluster_cols=FALSE,display_numbers = F,
         show_rownames=F,cluster_rows =FALSE,
         color = colorRampPalette(c("blue","black","yellow"))(10000),
         border_color=NA,cellwidth = 20, cellheight = 0.1) 