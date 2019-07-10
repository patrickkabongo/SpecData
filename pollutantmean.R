pollutantmean <- function(directory, pollutant, id = 1:332){
        total <- 0
        observations <- 0
        specdatafiles <- as.character(dir(directory))
        specdatapaths <- paste(directory, "/", specdatafiles, sep="")
        
        
        for (i in id) {
              data <- read.csv(specdatapaths[i])
              data <- na.omit(data)
              observations <- observations + nrow(data)
              
              if(pollutant == "sulfate"){
                      total <- total + sum(data$sulfate)
              }
              
              if(pollutant == "nitrate"){
                      total <- total + sum(data$nitrate)
              }
        }
        
        means <- total/observations
        means
}
