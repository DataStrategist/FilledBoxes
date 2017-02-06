df <- data.frame(Targ=1:10,
                 Time=runif(10)*100)

a <- function(x) rep(x,10)

df <- data.frame(
  Targ=a(1:10),
  Time=sort(a(1:10)))

## Now define function
imageMaker <- function(targ,time){
  x<-factor(1)
  y<-factor( c(rep("a",targ),rep("b",10-targ)) )
  mydata <- data.frame(x,y)
  rm(x,y)
  mypalette <- c(RColorBrewer::brewer.pal(9,"Purples"),"#000000")
  mycol <- mypalette[round(time,0)]
  png(filename = paste(i,".png",sep=""),width=60,height=60)
  par(mar=c(1,1,1,1))
  barplot(as.matrix(table(mydata$y)), col=c(mycol,"white"), beside = FALSE,axes = F)
  dev.off()
}

for (i in 1:nrow(df)){
  imageMaker(df$Targ[i],df$Time[i])
}