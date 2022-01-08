
CpxAR2<-read.csv("C:\\Users\\faits\\Documents\\GitHub\\MIp new\\CpxAR_wMIp_final_4.csv",header=TRUE)
CpxAR2
CpxAR2$MIp
CpxAR2$dis
HeatCpxAR2<-matrix(CpxAR2$MIp,nrow=40,ncol=40)
low_CpxAR2 <- HeatCpxAR2[lower.tri(HeatCpxAR2)]
low_CpxAR2

MCpxAR2<-matrix(CpxAR2$dis,nrow=40,ncol=40)
low_disCpxAR2 <- MCpxAR2[lower.tri(MCpxAR2)]
low_disCpxAR2

sMIpCpxAR2<-matrix(CpxAR2$sMIp,nrow=40,ncol=40)
low_sMIpCpxAR2 <- sMIpCpxAR2[lower.tri(sMIpCpxAR2)]
low_sMIpCpxAR2

wMIpCpxAR2<-matrix(CpxAR2$wMIp,nrow=40,ncol=40)
low_wMIpCpxAR2 <- wMIpCpxAR2[lower.tri(wMIpCpxAR2)]
low_wMIpCpxAR2

swMIpCpxAR2<-matrix(CpxAR2$swMIp,nrow=40,ncol=40)
low_swMIpCpxAR2 <- swMIpCpxAR2[lower.tri(swMIpCpxAR2)]
low_swMIpCpxAR2

MIp2 <- low_CpxAR2
Dis2 <- low_disCpxAR2
wMIp2 <- low_wMIpCpxAR2
sMIp2 <- low_sMIpCpxAR2
swMIp2 <- low_swMIpCpxAR2

NarQP2<-read.csv("C:\\Users\\faits\\Documents\\GitHub\\MIp new\\NarQP_wMIp_final_4.csv",header=TRUE)
NarQP2
NarQP2$MI
HeatNarQP2<-matrix(NarQP2$MIp,nrow=40,ncol=40)
low_NarQP2 <- HeatNarQP2[lower.tri(HeatNarQP2)]

MNarQP2<-matrix(NarQP2$dis,nrow=40,ncol=40)
low_disNarQP2 <- MNarQP2[lower.tri(MNarQP2)]
low_disNarQP2 

sMIpNarQP2<-matrix(NarQP2$sMIp,nrow=40,ncol=40)
low_sMIpNarQP2 <- sMIpNarQP2[lower.tri(sMIpNarQP2)]
low_sMIpNarQP2

wMIpNarQP2<-matrix(NarQP2$wMIp,nrow=40,ncol=40)
low_wMIpNarQP2 <- wMIpNarQP2[lower.tri(wMIpNarQP2)]
low_wMIpNarQP2

swMIpNarQP2<-matrix(NarQP2$swMIp,nrow=40,ncol=40)
low_swMIpNarQP2 <- swMIpNarQP2[lower.tri(swMIpNarQP2)]
low_swMIpNarQP2

MIp2 <- append(MIp2, low_NarQP2, after = length(MIp2))
Dis2 <- append(Dis2, low_disNarQP2, after = length(Dis2))
wMIp2 <- append(wMIp2, low_wMIpNarQP2, after = length(wMIp2))
sMIp2 <- append(sMIp2, low_sMIpNarQP2, after = length(sMIp2))
swMIp2 <- append(swMIp2, low_swMIpNarQP2, after = length(swMIp2))

PhoRB2<-read.csv("C:\\Users\\faits\\Documents\\GitHub\\MIp new\\PhoRB_wMIp_final_4.csv",header=TRUE)
PhoRB2
PhoRB2$swMIp
HeatPhoRB2<-matrix(PhoRB2$MIp,nrow=40,ncol=40)
low_PhoRB2 <- HeatPhoRB2[lower.tri(HeatPhoRB2)]

MPhoRB2<-matrix(PhoRB2$dis,nrow=40,ncol=40)
low_disPhoRB2 <- MPhoRB2[lower.tri(MPhoRB2)]
low_disPhoRB2 

sMIpPhoRB2<-matrix(PhoRB2$sMIp,nrow=40,ncol=40)
low_sMIpPhoRB2 <- sMIpPhoRB2[lower.tri(sMIpPhoRB2)]
low_sMIpPhoRB2

wMIpPhoRB2<-matrix(PhoRB2$wMIp,nrow=40,ncol=40)
low_wMIpPhoRB2 <- wMIpPhoRB2[lower.tri(wMIpPhoRB2)]
low_wMIpPhoRB2

swMIpPhoRB2<-matrix(PhoRB2$swMIp,nrow=40,ncol=40)
low_swMIpPhoRB2 <- swMIpPhoRB2[lower.tri(swMIpPhoRB2)]
low_swMIpPhoRB2

MIp2 <- append(MIp2, low_PhoRB2, after = length(MIp2))
Dis2 <- append(Dis2, low_disPhoRB2, after = length(Dis2))
wMIp2 <- append(wMIp2, low_wMIpPhoRB2, after = length(wMIp2))
sMIp2 <- append(sMIp2, low_sMIpPhoRB2, after = length(sMIp2))
swMIp2 <- append(swMIp2, low_swMIpPhoRB2, after = length(swMIp2))

QseCB2<- read.csv("C:\\Users\\faits\\Documents\\GitHub\\MIp new\\QseCB_wMIp_final_4.csv",header=TRUE)
QseCB2
QseCB2$MIp
HeatQseCB2<-matrix(QseCB2$MIp,nrow=40,ncol=40)
low_QseCB2 <- HeatQseCB2[lower.tri(HeatQseCB2)]
low_QseCB2

MQseCB2<-matrix(QseCB2$dis,nrow=40,ncol=40)
low_disQseCB2 <- MQseCB2[lower.tri(MQseCB2)]
low_disQseCB2

sMIpQseCB2<-matrix(QseCB2$sMIp,nrow=40,ncol=40)
low_sMIpQseCB2 <- sMIpQseCB2[lower.tri(sMIpQseCB2)]
low_sMIpQseCB2

wMIpQseCB2<-matrix(QseCB2$wMIp,nrow=40,ncol=40)
low_wMIpQseCB2 <- wMIpQseCB2[lower.tri(wMIpQseCB2)]
low_wMIpQseCB2

swMIpQseCB2<-matrix(QseCB2$swMIp,nrow=40,ncol=40)
low_swMIpQseCB2 <- swMIpQseCB2[lower.tri(swMIpQseCB2)]
low_swMIpQseCB2

MIp2 <- append(MIp2, low_QseCB2, after = length(MIp2))
Dis2 <- append(Dis2, low_disQseCB2, after = length(Dis2))
wMIp2 <- append(wMIp2, low_wMIpQseCB2, after = length(wMIp2))
sMIp2 <- append(sMIp2, low_sMIpQseCB2, after = length(sMIp2))
swMIp2 <- append(swMIp2, low_swMIpQseCB2, after = length(swMIp2))

filter.CpxAR2<-which(CpxAR2$swMIp>0.041116691,arr.ind=TRUE)
pp <- CpxAR2[filter.CpxAR2,1]
pp <- append(pp, CpxAR2[filter.CpxAR2,2], after = length(pp))
pp <- append(pp, CpxAR2[filter.CpxAR2,14], after = length(pp))
pp <- append(pp, CpxAR2[filter.CpxAR2,11], after = length(pp))
qq <- matrix(pp,nrow=length(filter.CpxAR2),4)
#qq
filter.CpxAR2_x<-which(qq[,1]<579,arr.ind=TRUE)
pp <- qq[filter.CpxAR2_x,1]
pp <- append(pp, qq[filter.CpxAR2_x,2], after = length(pp))
pp <- append(pp, qq[filter.CpxAR2_x,3], after = length(pp))
pp <- append(pp, qq[filter.CpxAR2_x,4], after = length(pp))
qq <- matrix(pp,nrow=length(filter.CpxAR2_x),4)
#qq
filter.CpxAR2_y<-which(qq[,2]>683,arr.ind=TRUE)
pp <- qq[filter.CpxAR2_y,1]
pp <- append(pp, qq[filter.CpxAR2_y,2], after = length(pp))
pp <- append(pp, qq[filter.CpxAR2_y,3], after = length(pp))
pp <- append(pp, qq[filter.CpxAR2_y,4], after = length(pp))
qq <- matrix(pp,nrow=length(filter.CpxAR2_y),4)
qq

filter.NarQP2<-which(NarQP2$swMIp>0.028285871,arr.ind=TRUE)
pp1 <- NarQP2[filter.NarQP2,1]
pp1 <- append(pp1, NarQP2[filter.NarQP2,2], after = length(pp1))
pp1 <- append(pp1, NarQP2[filter.NarQP2,14], after = length(pp1))
pp1 <- append(pp1, NarQP2[filter.NarQP2,11], after = length(pp1))
qq1 <- matrix(pp1,nrow=length(filter.NarQP2),4)
#qq1
filter.NarQP2_x<-which(qq1[,1]<907,arr.ind=TRUE)
pp1 <- qq1[filter.NarQP2_x,1]
pp1 <- append(pp1, qq1[filter.NarQP2_x,2], after = length(pp1))
pp1 <- append(pp1, qq1[filter.NarQP2_x,3], after = length(pp1))
pp1 <- append(pp1, qq1[filter.NarQP2_x,4], after = length(pp1))
qq1 <- matrix(pp1,nrow=length(filter.NarQP2_x),4)
#qq1
filter.NarQP2_y<-which(qq1[,2]>1043,arr.ind=TRUE)
pp1 <- qq1[filter.NarQP2_y,1]
pp1 <- append(pp1, qq1[filter.NarQP2_y,2], after = length(pp1))
pp1 <- append(pp1, qq1[filter.NarQP2_y,3], after = length(pp1))
pp1 <- append(pp1, qq1[filter.NarQP2_y,4], after = length(pp1))
qq1 <- matrix(pp1,nrow=length(filter.NarQP2_y),4)
qq1

filter.PhoRB2<-which(PhoRB2$swMIp>0.041116691,arr.ind=TRUE)
pp2 <- PhoRB2[filter.PhoRB2,1]
pp2 <- append(pp2, PhoRB2[filter.PhoRB2,2], after = length(pp2))
pp2 <- append(pp2, PhoRB2[filter.PhoRB2,14], after = length(pp2))
pp2 <- append(pp2, PhoRB2[filter.PhoRB2,11], after = length(pp2))
qq2 <- matrix(pp2,nrow=length(filter.PhoRB2),4)
#qq2
filter.PhoRB2_x<-which(qq2[,1]<780,arr.ind=TRUE)
pp2 <- qq2[filter.PhoRB2_x,1]
pp2 <- append(pp2, qq2[filter.PhoRB2_x,2], after = length(pp2))
pp2 <- append(pp2, qq2[filter.PhoRB2_x,3], after = length(pp2))
pp2 <- append(pp2, qq2[filter.PhoRB2_x,4], after = length(pp2))
qq2 <- matrix(pp2,nrow=length(filter.PhoRB2_x),4)
#qq2
filter.PhoRB2_y<-which(qq2[,2]>935,arr.ind=TRUE)
pp2 <- qq2[filter.PhoRB2_y,1]
pp2 <- append(pp2, qq2[filter.PhoRB2_y,2], after = length(pp2))
pp2 <- append(pp2, qq2[filter.PhoRB2_y,3], after = length(pp2))
pp2 <- append(pp2, qq2[filter.PhoRB2_y,4], after = length(pp2))
qq2 <- matrix(pp2,nrow=length(filter.PhoRB2_y),4)
qq2

filter.QseCB2<-which(QseCB2$swMIp>0.041116691,arr.ind=TRUE)
pp3 <- QseCB2[filter.QseCB2,1]
pp3 <- append(pp3, QseCB2[filter.QseCB2,2], after = length(pp3))
pp3 <- append(pp3, QseCB2[filter.QseCB2,14], after = length(pp3))
pp3 <- append(pp3, QseCB2[filter.QseCB2,11], after = length(pp3))
qq3 <- matrix(pp3,nrow=length(filter.QseCB2),4)
#qq3
filter.QseCB2_x<-which(qq3[,1]<529,arr.ind=TRUE)
pp3 <- qq3[filter.QseCB2_x,1]
pp3 <- append(pp3, qq3[filter.QseCB2_x,2], after = length(pp3))
pp3 <- append(pp3, qq3[filter.QseCB2_x,3], after = length(pp3))
pp3 <- append(pp3, qq3[filter.QseCB2_x,4], after = length(pp3))
qq3 <- matrix(pp3,nrow=length(filter.QseCB2_x),4)
#qq3
filter.QseCB2_y<-which(qq3[,2]>628,arr.ind=TRUE)
pp3 <- qq3[filter.QseCB2_y,1]
pp3 <- append(pp3, qq3[filter.QseCB2_y,2], after = length(pp3))
pp3 <- append(pp3, qq3[filter.QseCB2_y,3], after = length(pp3))
pp3 <- append(pp3, qq3[filter.QseCB2_y,4], after = length(pp3))
qq3 <- matrix(pp3,nrow=length(filter.QseCB2_y),4)
qq3

x11()
hist(qq3[,4])
plot(MIp,Dis)
abline(v=0.0529590, col="red")
x11()
hist(-log(MIp))
x11()
boxplot(MIp)
max(MIp, na.rm = TRUE)
min(MIp, na.rm = TRUE)
quantile(MIp2,p=c(0.25,0.5,0.75,0.80,0.90,0.95,0.96,0.97,0.98,0.99,1),na.rm=TRUE)
quantile(wMIp2,p=c(0.25,0.5,0.75,0.80,0.90,0.95,0.96,0.97,0.98,0.99,1),na.rm=TRUE)
quantile(swMIp2,p=c(0.25,0.5,0.75,0.80,0.90,0.95,0.96,0.97,0.98,0.99,1),na.rm=TRUE)
x11()
qqnorm(MIp,na.rm=TRUE)
qqline(MIp,col="red")

xlab='MIp', ylab='minimal backbone residue distance', 
x11()
par(mfrow=c(1,2))
plot(MIp2,Dis2, axes= False)
axis(1, at = c(5, 10, 15, 20, 25, 30, 35))
axis(2, at = c(-0.2, -0.15, -0.1, -0.05, 0.0, 0.05, 0.1, 0.15, 0.2))
axis(1)
axis(2)
#abline(v=0.0501920, col="red")
#abline(v=0.057346, col="green")
#abline(v=0.0914296, col="purple")
plot(wMIp2,Dis2, xlab='wMIp', ylab= NA, axes= False)
axis(1, at = c(5, 10, 15, 20, 25, 30, 35))
axis(2, at = c(-0.3, -0.2 , -0.1, 0.0, 0.1, 0.2, 0.3))
axis(1)
axis(2)
#abline(v=0.0452415, col="red")
#abline(v=0.04986200, col="green")
#abline(v=0.0801385, col="purple")


x11()
plot(sMIp2,Dis2)
abline(v=0.013875365, col="red")
abline(v=0.016360208, col="green")

x11()
plot(swMIp2,Dis2, ylab='minimal backbone residue distance', xlab='MRI')
#abline(v=0.018144743, col="red")
#abline(v=0.022462373, col="green")
#abline(v=0.028285871, col="yellow")
abline(v=0.041387259, col="red")

points(swMIp2, Dis2)

#Absolut distance

wMIpCpxAR2<-matrix(CpxAR2$wMIp,nrow=40,ncol=40)
wMIpNarQP2<-matrix(NarQP2$wMIp,nrow=40,ncol=40)
wMIpPhoRB2<-matrix(PhoRB2$wMIp,nrow=40,ncol=40)
wMIpQseCB2<-matrix(QseCB2$wMIp,nrow=40,ncol=40)

PhoRBCpxAR2<-(abs(wMIpPhoRB2-wMIpCpxAR2))
PhoRBNarQP2<-(abs(wMIpPhoRB2-wMIpNarQP2))
PhoRBQseCB2<-(abs(wMIpPhoRB2-wMIpQseCB2))

CpxARNarQP2<-(abs(wMIpCpxAR2-HeatNarQP2))
CpxARQseCB2<-(abs(wMIpCpxAR2-wMIpQseCB2))

NarQPQseCB2<-(abs(wMIpNarQP2-wMIpQseCB2))

scalar <-matrix(CpxAR2$sca,nrow=40,ncol=40)

scaPhoRBCpxAR2 <-(PhoRBCpxAR2/scalar)
scaPhoRBNarQP2 <-(PhoRBNarQP2/scalar)
scaPhoRBQseCB2 <-(PhoRBQseCB2/scalar)

scaCpxARNarQP2 <-(CpxARNarQP2/scalar)
scaCpxARQseCB2 <-(CpxARQseCB2/scalar)

scaNarQPQseCB2 <-(NarQPQseCB2/scalar)

low_scaPhoRBCpxAR2 <- scaPhoRBCpxAR2 [lower.tri(scaPhoRBCpxAR2)]
low_scaPhoRBNarQP2 <- scaPhoRBNarQP2 [lower.tri(scaPhoRBNarQP2)]
low_scaPhoRBQseCB2 <- scaPhoRBQseCB2 [lower.tri(scaPhoRBQseCB2)]

low_scaCpxARNarQP2 <- scaCpxARNarQP2 [lower.tri(scaCpxARNarQP2)]
low_scaCpxARQseCB2 <- scaCpxARQseCB2 [lower.tri(scaCpxARQseCB2)]

low_scaNarQPQseCB2 <- scaNarQPQseCB2 [lower.tri(scaNarQPQseCB2)]

sdwMIp <- low_scaPhoRBCpxAR2
sdwMIp <- append(sdwMIp, low_scaPhoRBNarQP2 , after = length(sdwMIp))
sdwMIp <- append(sdwMIp, low_scaPhoRBQseCB2 , after = length(sdwMIp))
sdwMIp <- append(sdwMIp, low_scaCpxARNarQP2 , after = length(sdwMIp))
sdwMIp <- append(sdwMIp, low_scaCpxARQseCB2 , after = length(sdwMIp))
sdwMIp <- append(sdwMIp, low_scaNarQPQseCB2 , after = length(sdwMIp))

quantile(sdwMIp,p=c(0.25,0.5,0.75,0.80,0.90,0.95,0.96,0.97,0.98,0.99,1),na.rm=TRUE)


library("gplots")
x11()
heatmap.2(scaPhoRBCpxAR2,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=rev(topo.colors(10)),key=TRUE,trace="none",main="PhoRB vs CpxAR MIp",breaks=seq(0,0.149947614 ,length.out=11))
x11()
heatmap.2(scaPhoRBNarQP2,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=rev(topo.colors(10)),key=TRUE,trace="none",main="PhoRB vs NarQP MIp",breaks=seq(0,0.149947614,length.out=11))
x11()
heatmap.2(scaPhoRBQseCB2,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=rev(topo.colors(10)),key=TRUE,trace="none",main="PhoRB vs QseCB MIp",breaks=seq(0,0.149947614 ,length.out=11))
x11()
heatmap.2(scaCpxARNarQP2,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=rev(topo.colors(10)),key=TRUE,trace="none",main="CpxAR vs NarQP MIp",breaks=seq(0,0.149947614 ,length.out=11))
x11()
heatmap.2(scaCpxARQseCB2,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=rev(topo.colors(10)),key=TRUE,trace="none",main="CpxAR vs QseCB MIp",breaks=seq(0,0.149947614 ,length.out=11))
x11()
heatmap.2(scaNarQPQseCB2,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=rev(topo.colors(10)),key=TRUE,trace="none",main="NarQP vs QseCB MIp",breaks=seq(0,0.149947614 ,length.out=11))

filter.scaPhoRBCpxAR2<-which(scaPhoRBCpxAR2>0.071687722,arr.ind=TRUE)
scaPhoRBCpxAR2.cutoff<-matrix(NA,ncol=40,nrow=40)
scaPhoRBCpxAR2.cutoff[filter.scaPhoRBCpxAR2]<-scaPhoRBCpxAR2[filter.scaPhoRBCpxAR2]

filter.scaPhoRBNarQP2<-which(scaPhoRBNarQP2>0.071687722,arr.ind=TRUE)
scaPhoRBNarQP2.cutoff<-matrix(NA,ncol=40,nrow=40)
scaPhoRBNarQP2.cutoff[filter.scaPhoRBNarQP2]<-scaPhoRBNarQP2[filter.scaPhoRBNarQP2]

filter.scaPhoRBQseCB2<-which(scaPhoRBQseCB2>0.071687722,arr.ind=TRUE)
scaPhoRBQseCB2.cutoff<-matrix(NA,ncol=40,nrow=40)
scaPhoRBQseCB2.cutoff[filter.scaPhoRBQseCB2]<-scaPhoRBQseCB2[filter.scaPhoRBQseCB2]

filter.scaCpxARNarQP2<-which(scaCpxARNarQP2>0.071687722,arr.ind=TRUE)
scaCpxARNarQP2.cutoff<-matrix(NA,ncol=40,nrow=40)
scaCpxARNarQP2.cutoff[filter.scaCpxARNarQP2]<-scaCpxARNarQP2[filter.scaCpxARNarQP2]

filter.scaCpxARQseCB2<-which(scaCpxARQseCB2>0.071687722,arr.ind=TRUE)
scaCpxARQseCB2.cutoff<-matrix(NA,ncol=40,nrow=40)
scaCpxARQseCB2.cutoff[filter.scaCpxARQseCB2]<-scaCpxARQseCB2[filter.scaCpxARQseCB2]

filter.scaNarQPQseCB2<-which(scaNarQPQseCB2>0.071687722,arr.ind=TRUE)
scaNarQPQseCB2.cutoff<-matrix(NA,ncol=40,nrow=40)
scaNarQPQseCB2.cutoff[filter.scaNarQPQseCB2]<-scaNarQPQseCB2[filter.scaNarQPQseCB2]

x11()
heatmap.2(scaPhoRBCpxAR2.cutoff,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=rev(topo.colors(10)),key=TRUE,trace="none",main="PhoRB vs CpxAR MIp",breaks=seq(0,0.149947614 ,length.out=11))
x11()
heatmap.2(scaPhoRBNarQP2.cutoff,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=rev(topo.colors(10)),key=TRUE,trace="none",main="PhoRB vs NarQP MIp",breaks=seq(0,0.149947614,length.out=11))
x11()
heatmap.2(scaPhoRBQseCB2.cutoff,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=rev(topo.colors(10)),key=TRUE,trace="none",main="PhoRB vs QseCB MIp",breaks=seq(0,0.149947614 ,length.out=11))
x11()
heatmap.2(scaCpxARNarQP2.cutoff,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=rev(topo.colors(10)),key=TRUE,trace="none",main="CpxAR vs NarQP MIp",breaks=seq(0,0.149947614 ,length.out=11))
x11()
heatmap.2(scaCpxARQseCB2.cutoff,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=rev(topo.colors(10)),key=TRUE,trace="none",main="CpxAR vs QseCB MIp",breaks=seq(0,0.149947614 ,length.out=11))
x11()
heatmap.2(scaNarQPQseCB2.cutoff,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=rev(topo.colors(10)),key=TRUE,trace="none",main="NarQP vs QseCB MIp",breaks=seq(0,0.149947614 ,length.out=11))

help('plot')

