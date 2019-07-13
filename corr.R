source("complete.R")
corr <- function(directory, threshold = 0){
        specdatafiles <- as.character(dir(directory))
        specdatapaths <- paste(directory, "/", specdatafiles, sep="")
        
        x <- complete(directory)
        y <- as.data.frame(x)
        z <- subset(y, y$nobs > threshold)
        correlation <- c()
        for (i in z$id) {
                data <- read.csv(specdatapaths[i])
                data <- subset(data,complete.cases(data)) 
                correlation <- c(correlation,cor(data$nitrate,data$sulfate)) 
        }
        
        correlation
}