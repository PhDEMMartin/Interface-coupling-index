library(gplots)

CpxAR<-read.csv("C:\\Users\\faits\\Documents\\Clusters\\CpxAR MIp.csv",header=TRUE)
CpxAR
CpxAR$MIp
HeatCpxAR<-matrix(CpxAR$MIp,nrow=40,ncol=40)
HeatCpxAR
x11()
heatmap(HeatCpxAR,Rowv=NA,Colv=NA,symm=TRUE,col=topo.colors(20))
x11()
heatmap.2(HeatCpxAR,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=topo.colors(10),key=TRUE,trace="none",main="CpxA-CpxR MIp")

CpxAR2<-read.csv("C:\\Users\\faits\\Documents\\GitHub\\MIp new\\CpxAR_PII_wMIp.csv",header=TRUE)
CpxAR2
CpxAR2$MIp
HeatCpxAR2<-matrix(CpxAR2$MIp,nrow=40,ncol=40)
HeatCpxAR2
x11()
heatmap(HeatCpxAR2,Rowv=NA,Colv=NA,symm=TRUE,col=topo.colors(20))
x11()
heatmap.2(HeatCpxAR2,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=topo.colors(10),key=TRUE,trace="none",main="CpxA-CpxR MIp")

HeatCpxAR[7,24]
HeatCpxAR2[7,24]


#########################
NarQP<-read.csv("C:\\Users\\faits\\Documents\\Clusters\\NarQP MIp.csv",header=TRUE)
NarQP
NarQP$MIp
HeatNarQP<-matrix(NarQP$MIp,nrow=40,ncol=40)
HeatNarQP
x11()
heatmap(HeatNarQP,Rowv=NA,Colv=NA,symm=TRUE,col=topo.colors(4))
x11()
heatmap.2(HeatNarQP,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=topo.colors(10),key=TRUE,trace="none",main="NarQ-NarP MIp")

NarQP2<-read.csv("C:\\Users\\faits\\Documents\\GitHub\\MIp new\\NarQP_wMIp_test.csv",header=TRUE)
NarQP2
NarQP2$MIp
HeatNarQP2<-matrix(NarQP2$MIp,nrow=40,ncol=40)
HeatNarQP2
x11()
heatmap(HeatNarQP2,Rowv=NA,Colv=NA,symm=TRUE,col=topo.colors(4))
x11()
heatmap.2(HeatNarQP2,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=topo.colors(10),key=TRUE,trace="none",main="NarQ-NarP MIp")

HeatNarQP[12,39]
HeatNarQP2[12,39]


############################
PhoRB<-read.csv("C:\\Users\\faits\\Documents\\Clusters\\PhoRB MIp.csv",header=TRUE)
PhoRB
PhoRB$MIp
HeatPhoRB<-matrix(PhoRB$MIp,nrow=40,ncol=40)
HeatPhoRB
x11()
heatmap(HeatPhoRB,Rowv=NA,Colv=NA,symm=TRUE,col=topo.colors(20))
x11()
heatmap.2(HeatPhoRB,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=topo.colors(10),key=TRUE,trace="none",main="PhoR-PhoB MIp")

PhoRB2<-read.csv("C:\\Users\\faits\\Documents\\GitHub\\MIp new\\PhoRB_wMIp_test.csv",header=TRUE)
PhoRB2
PhoRB2$MIp
HeatPhoRB2<-matrix(PhoRB2$MIp,nrow=40,ncol=40)
HeatPhoRB2
x11()
heatmap(HeatPhoRB2,Rowv=NA,Colv=NA,symm=TRUE,col=topo.colors(20))
x11()
heatmap.2(HeatPhoRB2,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=topo.colors(10),key=TRUE,trace="none",main="PhoR-PhoB MIp")



####################################
QseCB<- read.csv("C:\\Users\\faits\\Documents\\Clusters\\QseCB MIp.csv",header=TRUE)
QseCB
QseCB$MIp
HeatQseCB<-matrix(QseCB$MIp,nrow=40,ncol=40)
HeatQseCB
x11()
heatmap(HeatQseCB,Rowv=NA,Colv=NA,symm=TRUE,col=topo.colors(20))
x11()
heatmap.2(HeatQseCB,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=topo.colors(10),key=TRUE,trace="none",main="QseC-QseB MIp")


QseCB2<- read.csv("C:\\Users\\faits\\Documents\\GitHub\\MIp new\\QseCB_PII_wMIp.csv",header=TRUE)
QseCB2
QseCB2$MIp
HeatQseCB2<-matrix(QseCB2$MIp,nrow=40,ncol=40)
HeatQseCB2
x11()
heatmap(HeatQseCB2,Rowv=NA,Colv=NA,symm=TRUE,col=topo.colors(20))
x11()
heatmap.2(HeatQseCB2,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=topo.colors(10),key=TRUE,trace="none",main="QseC-QseB MIp")


#TCSs orthologues heatmaps

x11()
heatmap.2(HeatQseCB,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=topo.colors(10),key=FALSE,trace="none",main="QseC-QseB MIp")
x11()
heatmap.2(HeatCpxAR,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=topo.colors(10),key=TRUE,trace="none",main="CpxA-CpxR MIp")
x11()
heatmap.2(HeatPhoRB,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=topo.colors(10),key=TRUE,trace="none",main="PhoR-PhoB MIp")
x11()
heatmap.2(HeatNarQP,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=topo.colors(10),key=FALSE,trace="none",main="NarQ-NarP MIp")

ci2d(NarQPQseCB)

#MIp Distances Values Between Matrices

PhoRBCpxAR<-(abs(HeatPhoRB-HeatCpxAR))
PhoRBNarQP<-(abs(HeatPhoRB-HeatNarQP))
PhoRBQseCB<-(abs(HeatPhoRB-HeatQseCB))

CpxARNarQP<-(abs(HeatCpxAR-HeatNarQP))
CpxARQseCB<-(abs(HeatCpxAR-HeatQseCB))

NarQPQseCB<-(abs(HeatNarQP-HeatQseCB))

PhoRBCpxAR2<-(abs(HeatPhoRB2-HeatCpxAR2))
PhoRBNarQP2<-(abs(HeatPhoRB2-HeatNarQP2))
PhoRBQseCB2<-(abs(HeatPhoRB2-HeatQseCB2))

CpxARNarQP2<-(abs(HeatCpxAR2-HeatNarQP2))
CpxARQseCB2<-(abs(HeatCpxAR2-HeatQseCB2))

NarQPQseCB2<-(abs(HeatNarQP2-HeatQseCB2))

#Minimum and maximum MIp values distance matrices

max(PhoRBCpxAR, na.rm = TRUE)
min(PhoRBCpxAR, na.rm = TRUE)

max(PhoRBNarQP, na.rm = TRUE)
min(PhoRBNarQP, na.rm = TRUE)

max(PhoRBQseCB, na.rm = TRUE)
min(PhoRBQseCB, na.rm = TRUE)

max(CpxARNarQP, na.rm = TRUE)
min(CpxARNarQP, na.rm = TRUE)

max(CpxARQseCB, na.rm = TRUE)
min(CpxARQseCB, na.rm = TRUE)

max(NarQPQseCB, na.rm = TRUE)
min(NarQPQseCB, na.rm = TRUE)



boxplot(ProCpxARQseCB[lower.tri(ProCpxARQseCB)])
median(ProCpxARQseCB[lower.tri(ProCpxARQseCB)],na.rm=TRUE)
mean(ProCpxARQseCB[lower.tri(ProCpxARQseCB)],na.rm=TRUE)

par(mfrow=c(2,1))
boxplot(ProCpxARQseCB[lower.tri(ProCpxARQseCB)])
median(ProCpxARQseCB[lower.tri(ProCpxARQseCB)],na.rm=TRUE)
mean(ProCpxARQseCB[lower.tri(ProCpxARQseCB)],na.rm=TRUE)
quantile(ProCpxARQseCB,p=c(0.25,0.5,0.75),na.rm=TRUE)
x11()
boxplot(ProNarQPQseCB[lower.tri(ProNarQPQseCB)])
median(ProNarQPQseCB[lower.tri(ProNarQPQseCB)],na.rm=TRUE)
mean(ProNarQPQseCB[lower.tri(ProNarQPQseCB)],na.rm=TRUE)
quantile(ProNarQPQseCB,p=c(0.25,0.5,0.75),na.rm=TRUE)
x11()
par(mfrow=c(2,1))
boxplot(ProPhoRBCpxAR[lower.tri(ProPhoRBCpxAR)])
median(ProPhoRBCpxAR[lower.tri(ProPhoRBCpxAR)],na.rm=TRUE)
mean(ProPhoRBCpxAR[lower.tri(ProPhoRBCpxAR)],na.rm=TRUE)
quantile(ProPhoRBCpxAR,p=c(0.25,0.5,0.75),na.rm=TRUE)
boxplot(ProPhoRBNarQP[lower.tri(ProPhoRBNarQP)])
median(ProPhoRBNarQP[lower.tri(ProPhoRBNarQP)],na.rm=TRUE)
mean(ProPhoRBNarQP[lower.tri(ProPhoRBNarQP)],na.rm=TRUE)
quantile(ProPhoRBNarQP,p=c(0.25,0.5,0.75),na.rm=TRUE)
x11()
par(mfrow=c(2,1))
boxplot(ProPhoRBQseCB[lower.tri(ProPhoRBQseCB)],nar.rm=T)
median(ProPhoRBQseCB[lower.tri(ProPhoRBQseCB)],na.rm=TRUE)
quantile(ProPhoRBQseCB,p=c(0.25,0.5,0.75),na.rm=TRUE)
mean(ProPhoRBQseCB[lower.tri(ProPhoRBQseCB)],na.rm=TRUE)
boxplot(ProCpxARNarQP[lower.tri(ProCpxARNarQP)])
median(ProCpxARNarQP[lower.tri(ProCpxARNarQP)],na.rm=TRUE)
mean(ProCpxARNarQP[lower.tri(ProCpxARNarQP)],na.rm=TRUE)
quantile(ProCpxARNarQP,p=c(0.25,0.5,0.75),na.rm=TRUE)

#Figure for Mario Ricardo 
par(mfrow=c(3,3))
boxplot(ProPhoRBCpxAR[lower.tri(ProPhoRBCpxAR)],na.rm=TRUE)
qqnorm(ProPhoRBCpxAR[lower.tri(ProPhoRBCpxAR)],na.rm=TRUE)
qqline(ProPhoRBCpxAR[lower.tri(ProPhoRBCpxAR)],col="red")
hist(ProPhoRBCpxAR[lower.tri(ProPhoRBCpxAR)],na.rm=TRUE)
boxplot(ProPhoRBNarQP[lower.tri(ProPhoRBNarQP)],na.rm=TRUE)
qqnorm(ProPhoRBNarQP[lower.tri(ProPhoRBNarQP)],na.rm=TRUE)
qqline(ProPhoRBNarQP[lower.tri(ProPhoRBNarQP)],col="red")
hist(ProPhoRBNarQP[lower.tri(ProPhoRBNarQP)],na.rm=TRUE)
boxplot(ProPhoRBQseCB[lower.tri(ProPhoRBQseCB)],na.rm=TRUE)
qqnorm(ProPhoRBQseCB[lower.tri(ProPhoRBQseCB)],na.rm=TRUE)
qqline(ProPhoRBQseCB[lower.tri(ProPhoRBQseCB)],col="red")
hist(ProPhoRBQseCB[lower.tri(ProPhoRBQseCB)],na.rm=TRUE)
x11()
par(mfrow=c(3,3))
boxplot(ProCpxARNarQP[lower.tri(ProCpxARNarQP)],na.rm=TRUE)
qqnorm(ProCpxARNarQP[lower.tri(ProCpxARNarQP)],na.rm=TRUE)
qqline(ProCpxARNarQP[lower.tri(ProCpxARNarQP)],col="red")
hist(ProCpxARNarQP[lower.tri(ProCpxARNarQP)],na.rm=TRUE)
boxplot(ProCpxARQseCB[lower.tri(ProCpxARQseCB)],na.rm=TRUE)
qqnorm(ProCpxARQseCB[lower.tri(ProCpxARQseCB)],na.rm=TRUE)
qqline(ProCpxARQseCB[lower.tri(ProCpxARQseCB)],col="red")
hist(ProCpxARQseCB[lower.tri(ProCpxARQseCB)],na.rm=TRUE)
boxplot(ProNarQPQseCB[lower.tri(ProNarQPQseCB)],na.rm=TRUE)
qqnorm(ProNarQPQseCB[lower.tri(ProNarQPQseCB)],na.rm=TRUE)
qqline(ProNarQPQseCB[lower.tri(ProNarQPQseCB)],col="red")
hist(ProNarQPQseCB[lower.tri(ProNarQPQseCB)],na.rm=TRUE)

par(mfrow=c(2,3))
boxplot(ProCpxA2RQseC2B[lower.tri(ProCpxA2RQseC2B)],na.rm=TRUE)
qqnorm(ProCpxA2RQseC2B[lower.tri(ProCpxA2RQseC2B)],na.rm=TRUE)
qqline(ProCpxA2RQseC2B[lower.tri(ProCpxA2RQseC2B)],col="red")
hist(ProCpxA2RQseC2B[lower.tri(ProCpxA2RQseC2B)],na.rm=TRUE)
boxplot(ProCpxARQseCB[lower.tri(ProCpxARQseCB)],na.rm=TRUE)
qqnorm(ProCpxARQseCB[lower.tri(ProCpxARQseCB)],na.rm=TRUE)
qqline(ProCpxARQseCB[lower.tri(ProCpxARQseCB)],col="red")
hist(ProCpxARQseCB[lower.tri(ProCpxARQseCB)],na.rm=TRUE)



par(mfrow=c(3,2))
quantile(PhoRBCpxAR[lower.tri(PhoRBCpxAR)],p=c(0.25,0.5,0.75,0.80,0.90),na.rm=TRUE)
quantile(PhoRBNarQP[lower.tri(PhoRBNarQP)],p=c(0.25,0.5,0.75,0.80,0.90),na.rm=TRUE)
quantile(PhoRBQseCB[lower.tri(PhoRBQseCB)],p=c(0.25,0.5,0.75,0.80,0.90),na.rm=TRUE)
quantile(CpxARNarQP[lower.tri(CpxARNarQP)],p=c(0.25,0.5,0.75,0.80,0.90),na.rm=TRUE)
quantile(CpxARQseCB[lower.tri(CpxARQseCB)],p=c(0.25,0.5,0.75,0.80,0.90),na.rm=TRUE)
quantile(NarQPQseCB[lower.tri(NarQPQseCB)],p=c(0.25,0.5,0.75,0.80,0.90),na.rm=TRUE)

par(mfrow=c(3,2))
quantile(PhoRBCpxAR2[lower.tri(PhoRBCpxAR2)],p=c(0.25,0.5,0.75,0.80,0.90),na.rm=TRUE)
quantile(PhoRBNarQP2[lower.tri(PhoRBNarQP2)],p=c(0.25,0.5,0.75,0.80,0.90),na.rm=TRUE)
quantile(PhoRBQseCB2[lower.tri(PhoRBQseCB2)],p=c(0.25,0.5,0.75,0.80,0.90),na.rm=TRUE)
quantile(CpxARNarQP2[lower.tri(CpxARNarQP2)],p=c(0.25,0.5,0.75,0.80,0.90),na.rm=TRUE)
quantile(CpxARQseCB2[lower.tri(CpxARQseCB2)],p=c(0.25,0.5,0.75,0.80,0.90),na.rm=TRUE)
quantile(NarQPQseCB2[lower.tri(NarQPQseCB2)],p=c(0.25,0.5,0.75,0.80,0.90),na.rm=TRUE)



par(mfrow=c(3,4))
hist(ProCpxARQseCB)
boxplot(ProCpxARQseCB)

qqnorm(ProCpxARQseCB)
qqline(ProCpxARQseCB,col="red")
hist(ProNarQPQseCB)
qqnorm(ProNarQPQseCB)
qqline(ProNarQPQseCB,col="red")
hist(ProPhoRBCpxAR)
qqnorm(ProPhoRBCpxAR)
qqline(ProPhoRBCpxAR,col="red")
hist(ProPhoRBNarQP)
qqnorm(ProPhoRBNarQP)
qqline(ProPhoRBNarQP,col="red")
hist(ProPhoRBQseCB)
qqnorm(ProPhoRBQseCB)
qqline(ProPhoRBQseCB,col="red")
hist(ProCpxARNarQP)
qqnorm(ProCpxARNarQP)
qqline(ProCpxARNarQP,col="red")


quantile(ProCpxARQseCB,p=c(0.25,0.5,0.75),na.rm=TRUE)
mean(ProCpxARQseCB,na.rm=TRUE)
max(ProCpxARQseCB,na.rm=TRUE)
median(ProCpxARQseCB,na.rm=TRUE)

x11()
heatmap.2(PhoRBCpxAR,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=rev(topo.colors(10)),key=TRUE,trace="none",main="PhoRB vs CpxAR MIp")
x11()
heatmap.2(PhoRBNarQP,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=rev(topo.colors(10)),key=TRUE,trace="none",main="PhoRB vs NarQP MIp")
x11()
heatmap.2(PhoRBQseCB,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=rev(topo.colors(10)),key=TRUE,trace="none",main="PhoRB vs QseCB MIp")
x11()
heatmap.2(CpxARNarQP,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=rev(topo.colors(10)),key=TRUE,trace="none",main="CpxAR vs NarQP MIp")
x11()
heatmap.2(CpxARQseCB,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=rev(topo.colors(10)),key=TRUE,trace="none",main="CpxAR vs QseCB MIp")
x11()
heatmap.2(NarQPQseCB,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=rev(topo.colors(10)),key=TRUE,trace="none",main="NarQP vs QseCB MIp Difference")

x11()
heatmap.2(PhoRBCpxAR2,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=rev(topo.colors(10)),key=TRUE,trace="none",main="PhoRB vs CpxAR MIp")
x11()
heatmap.2(PhoRBNarQP2,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=rev(topo.colors(10)),key=TRUE,trace="none",main="PhoRB vs NarQP MIp")
x11()
heatmap.2(PhoRBQseCB2,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=rev(topo.colors(10)),key=TRUE,trace="none",main="PhoRB vs QseCB MIp")
x11()
heatmap.2(CpxARNarQP2,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=rev(topo.colors(10)),key=TRUE,trace="none",main="CpxAR vs NarQP MIp")
x11()
heatmap.2(CpxARQseCB2,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=rev(topo.colors(10)),key=TRUE,trace="none",main="CpxAR vs QseCB MIp")
x11()
heatmap.2(NarQPQseCB2,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=rev(topo.colors(10)),key=TRUE,trace="none",main="NarQP vs QseCB MIp Difference")




demo.pal(topo.colors(10)

x11()
heatmap.2(MaxProCpxARQseCB,Rowv=NA,Colv=NA,symm=TRUE,col=topo.colors(10))
x11()
heatmap.2(MaxProNarQPQseCB,Rowv=NA,Colv=NA,symm=TRUE,col=heat.colors(2))
x11()
heatmap.2(MaxProPhoRBCpxAR,Rowv=NA,Colv=NA,symm=TRUE,col=cm.colors(2))
x11()
heatmap.2(MaxProPhoRBNarQP,Rowv=NA,Colv=NA,symm=TRUE,col=cm.colors(2))
x11()
heatmap.2(MaxProPhoRBQseCB,Rowv=NA,Colv=NA,symm=TRUE,col=cm.colors(2))
x11()
heatmap.2(MaxProCpxARNarQP,Rowv=NA,Colv=NA,symm=TRUE,col=cm.colors(2))


#Cutoff TCSs comparison heatmaps
x11()
heatmap.2(PhoRBCpxAR.cutoff,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=rev(topo.colors(10)),key=TRUE,trace="none",main="PhoRB vs CpxAR cutoff",margins = c(1.9, 1.9),breaks=seq(0,0.14107,length.out=11))
x11()
heatmap.2(PhoRBNarQP.cutoff,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=rev(topo.colors(10)),key=TRUE,trace="none",main="PhoRB vs NarQP cutoff",margins = c(1.9, 1.9),breaks=seq(0,0.14107,length.out=11))
x11()
heatmap.2(PhoRBQseCB.cutoff,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=rev(topo.colors(10)),key=TRUE,trace="none",main="PhoRB vs QseCB cutoff",margins=c(1.9,1.9),breaks=seq(0,0.14107,length.out=11))
x11()
heatmap.2(CpxARNarQP.cutoff,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=rev(topo.colors(10)),key=TRUE,trace="none",main="CpxAR vs NarQP cutoff",margins=c(1.9,1.9),breaks=seq(0,0.14107,length.out=11))
x11()
heatmap.2(CpxARQseCB.cutoff,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=rev(topo.colors(10)),key=TRUE,trace="none",main="CpxAR vs QseCB cutoff",margins=c(1.9,1.9),breaks=seq(0,0.14107,length.out=11))
x11()
heatmap.2(NarQPQseCB.cutoff,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=rev(topo.colors(10)),key=TRUE,trace="none",main="NarQP vs QseCB cutoff",margins=c(1.9,1.9),breaks=seq(0,0.14107,length.out=11))


boxplot(ProPhoRBCpxAR)

x11()
hist(CpxARQseCB[lower.tri(CpxARQseCB)])
x11()
hist(NarQPQseCB[lower.tri(NarQPQseCB)])
x11()
hist(PhoRBCpxAR[lower.tri(PhoRBCpxAR)])
x11()
hist(PhoRBNarQP[lower.tri(PhoRBNarQP)])
x11()
hist(PhoRBQseCB[lower.tri(PhoRBQseCB)])
x11()
hist(CpxARNarQP[lower.tri(CpxARNarQP)])
x11()
hist(CpxARQseCB[lower.tri(CpxARQseCB)])

x11()
hist(CpxARQseCB2[lower.tri(CpxARQseCB2)])
x11()
hist(NarQPQseCB2[lower.tri(NarQPQseCB2)])
x11()
hist(PhoRBCpxAR2[lower.tri(PhoRBCpxAR2)])
x11()
hist(PhoRBNarQP2[lower.tri(PhoRBNarQP2)])
x11()
hist(PhoRBQseCB2[lower.tri(PhoRBQseCB2)])
x11()
hist(CpxARNarQP2[lower.tri(CpxARNarQP2)])
x11()
hist(CpxARQseCB2[lower.tri(CpxARQseCB2)])

write.csv(NarQPQseCB,file="NarQPQseCB")

help.search("heatmap.2")

help.search("abs")

help.search("max")

help.search("heatmap")

library(gplots)

