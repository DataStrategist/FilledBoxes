## function to create 1000 icons, suitable for use w/ a HirearchyChart

## Define imagemaker function (don't laugh... it works)
imageMaker <- function(targ,time){
  x<-factor(1)
  y<-factor( c(rep("a",targ),rep("b",100-targ)) )
  mydata <- data.frame(x,y)
  rm(x,y)
  mypalette <- c(RColorBrewer::brewer.pal(9,"Purples"),"#000000")
  mycol <- mypalette[round(time,0)]
  png(filename = paste(targ,".",time,".png",sep=""),width=60,height=60)
  par(mar=c(1,1,1,1))
  barplot(as.matrix(table(mydata$y)), col=c(mycol,"white"), beside = FALSE,axes = F)
  dev.off()
}

## Now figure out how many thingies to make. I want 100 by 10, suitable for mapping to percents and a 10-gradient color scale, so:
df <- data.frame(Targ=rep(1:100,10), Time=sort(rep(1:10,100)))

for (i in 1:nrow(df)){
  imageMaker(df$Targ[i],df$Time[i])
}

##Done


### WORKING EXAMPLE ####
# path_to_images <- "https://raw.githubusercontent.com/datastorm-open/datastorm-open.github.io/master/visNetwork/data/img/indonesia/"
path_to_images <- "https://raw.githubusercontent.com/mexindian/FilledBoxes/master/"

nodes <- data.frame(id = 1:4, 
                    shape = c("image", "circularImage"),
                    image = paste0(path_to_images,round(runif(4)*100,0),".",round(runif(4)*100,0), ".png"),
                    label = "I'm an image")

edges <- data.frame(from = c(2,4,3,3), to = c(1,2,4,2))

## Remember, it won't show up in RStudio... look on real web browser.
visNetwork(nodes, edges, width = "100%") %>% 
  visNodes(shapeProperties = list(useBorderWithImage = TRUE)) %>%
  visLayout(randomSeed = 2)
