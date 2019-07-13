complete <- function(directory, id = 1:332){
        specdatafiles <- as.character(dir(directory))
        specdatapaths <- paste(directory, "/", specdatafiles, sep="")
        j <- 1
        idv <- c()
        sumC <- c()
        for (i in id) {
                data <- read.csv(specdatapaths[i])
                idv[j] <- i
                sumC[j] <- sum(complete.cases(data))
                j <- j + 1
        }
        
        x <- cbind(idv,sumC)
        colnames(x) <- c("id","nobs")
        
        x <- as.data.frame(x)
        
        x
}
