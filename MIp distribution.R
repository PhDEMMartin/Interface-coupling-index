install(gplots)
library("gplots")

CpxAR<-read.csv("C:\\Users\\faits\\Documents\\Clusters\\CpxAR MIp Dis.csv",header=TRUE)
CpxAR
CpxAR$MIp
CpxAR$Dis
HeatCpxAR<-matrix(CpxAR$MIp,nrow=40,ncol=40)
low_CpxAR <- HeatCpxAR[lower.tri(HeatCpxAR)]
low_CpxAR

MCpxAR<-matrix(CpxAR$Dis,nrow=40,ncol=40)
low_disCpxAR <- MCpxAR[lower.tri(MCpxAR)]
low_disCpxAR 

CpxAR2<-read.csv("C:\\Users\\faits\\Documents\\GitHub\\MIp new\\CpxAR_wMIp_test_4.csv",header=TRUE)
CpxAR2
CpxAR2$MIp
CpxAR2$dis
HeatCpxAR2<-matrix(CpxAR2$MIp,nrow=40,ncol=40)
low_CpxAR2 <- HeatCpxAR2[lower.tri(HeatCpxAR2)]
low_CpxAR2
x11()
heatmap.2(HeatCpxAR2,Rowv=NA,Colv=NA,symm=TRUE,scale="none",col=topo.colors(10),key=TRUE,trace="none",main="CpxA-CpxR MIp")


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

x11()
plot(low_CpxAR,low_disCpxAR)
abline(v=0.0529590, col="red")
x11()
plot(CpxAR$MIp,CpxAR$Dis)
abline(v=0.0529590, col="red")

x11()
plot(low_CpxAR2,low_disCpxAR2)
abline(v=0.0529590, col="red")
x11()
plot(CpxAR2$MIp,CpxAR2$dis)
abline(v=0.0529590, col="red")
x11()
plot(CpxAR2$wMIp,CpxAR2$dis)

hist(low_CpxAR)
x11()
hist(low_CpxAR2)

help.search("plot")
MIp <- low_CpxAR
Dis <- low_disCpxAR

MIp2 <- low_CpxAR2
Dis2 <- low_disCpxAR2
wMIp2 <- low_wMIpCpxAR2
sMIp2 <- low_sMIpCpxAR2
swMIp2 <- low_swMIpCpxAR2

NarQP<-read.csv("C:\\Users\\faits\\Documents\\Clusters\\NarQP MIp Dis.csv",header=TRUE)
NarQP
NarQP$MIp
HeatNarQP<-matrix(NarQP$MIp,nrow=40,ncol=40)
low_NarQP <- HeatNarQP[lower.tri(HeatNarQP)]


MNarQP<-matrix(NarQP$Dis,nrow=40,ncol=40)
low_disNarQP <- MNarQP[lower.tri(MNarQP)]
low_disNarQP 

NarQP2<-read.csv("C:\\Users\\faits\\Documents\\GitHub\\MIp new\\NarQP_wMIp_test_4.csv",header=TRUE)
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

NarQP3<-read.csv("C:\\Users\\faits\\Documents\\GitHub\\MIp new\\NarQP_wMIp_test_4.csv",header=TRUE)
NarQP3
NarQP3$MIp
HeatNarQP3<-matrix(NarQP3$MIp,nrow=40,ncol=40)
low_NarQP3 <- HeatNarQP3[lower.tri(HeatNarQP3)]

MNarQP3<-matrix(NarQP3$dis,nrow=40,ncol=40)
low_disNarQP3 <- MNarQP3[lower.tri(MNarQP3)]
low_disNarQP3 

NarQP4<-read.csv("C:\\Users\\faits\\Documents\\GitHub\\kruskalpython\\NarQP MIp_scalar.csv",header=TRUE)
NarQP4
NarQP4$s
HeatNarQP4<-matrix(NarQP4$s,nrow=40,ncol=40)
low_NarQP4 <- HeatNarQP4[lower.tri(HeatNarQP4)]

MNarQP4<-matrix(NarQP4$d,nrow=40,ncol=40)
low_disNarQP4 <- MNarQP4[lower.tri(MNarQP4)]
low_disNarQP4 
x11()
hist(low_NarQP)
x11()
hist(NarQP2$MI)
x11()
hist(NarQP2$APC)
m_narqp2_MI <-matrix(NarQP2$MI,nrow = 1600,ncol=1)
m_narqp3_MI <-matrix(NarQP3$MI,nrow = 1600,ncol=1)
x11()
hist(NarQP3$MI)
x11()
hist(NarQP3$wMI)
x11()
hist(NarQP3$APC)
x11()
plot(low_NarQP,low_disNarQP)
abline(v=0.0529590, col="red")
quantile(low_NarQP,p=c(0.25,0.5,0.75,0.80,0.90,0.95,1),na.rm=TRUE)
x11()
plot(NarQP2$sMIp,NarQP2$dis)
x11()
plot(NarQP2$MIp,NarQP2$dis)
x11()
plot(NarQP2$wMIp,NarQP2$dis)
x11()
plot(low_NarQP2,low_disNarQP2)
abline(v=0.0529590, col="red")
max(low_NarQP2)
x11()
plot(NarQP3$sMIp,NarQP3$dis)
x11()
plot(NarQP3$MI,NarQP3$dis)
x11()
plot(NarQP3$wMI,NarQP3$dis)
x11()
plot(low_NarQP2,low_disNarQP2)
abline(v=0.0529590, col="red")
max(low_NarQP3)
quantile(low_NarQP3,p=c(0.25,0.5,0.75,0.80,0.90,0.95,1),na.rm=TRUE)
x11()
hist(low_NarQP3)

x11()
plot(NarQP4$s,NarQP4$d)
max(low_NarQP4)
quantile(low_NarQP4,p=c(0.25,0.5,0.75,0.80,0.90,0.95,1),na.rm=TRUE)

quantile(NarQP2$MI,p=c(0.25,0.5,0.75,0.80,0.90,0.95,1),na.rm=TRUE)
quantile(NarQP3$MI,p=c(0.25,0.5,0.75,0.80,0.90,0.95,1),na.rm=TRUE)

plot(NarQP2$MI,NarQP2$APC)
plot(NarQP3$MI,NarQP3$APC)
plot(NarQP5$MIcd,NarQP5$APC)
plot(NarQP6$MI,NarQP6$APC)
x11()
plot(NarQP7$MI,NarQP7$APC)

filter.NarQP3<-which(NarQP3$MIp>0.25,arr.ind=TRUE)
pp1 <- NarQP3[filter.NarQP3,1]
pp1 <- append(pp1, NarQP3[filter.NarQP3,2], after = length(pp1))
pp1 <- append(pp1, NarQP[filter.NarQP3,3], after = length(pp1))
pp1 <- append(pp1, NarQP[filter.NarQP3,4], after = length(pp1))
qq1 <- matrix(pp1,nrow=length(filter.NarQP3),4)
qq1

MIp <- append(MIp, low_NarQP, after = length(MIp))
Dis <- append(Dis, low_disNarQP, after = length(Dis))

MIp2 <- append(MIp2, low_NarQP2, after = length(MIp2))
Dis2 <- append(Dis2, low_disNarQP2, after = length(Dis2))
wMIp2 <- append(wMIp2, low_wMIpNarQP2, after = length(wMIp2))
sMIp2 <- append(sMIp2, low_sMIpNarQP2, after = length(sMIp2))
swMIp2 <- append(swMIp2, low_swMIpNarQP2, after = length(swMIp2))


PhoRB<-read.csv("C:\\Users\\faits\\Documents\\Clusters\\PhoRB MIp Dis.csv",header=TRUE)
PhoRB
PhoRB$MIp
HeatPhoRB<-matrix(PhoRB$MIp,nrow=40,ncol=40)
low_PhoRB <- HeatPhoRB[lower.tri(HeatPhoRB)]

MPhoRB<-matrix(PhoRB$Dis,nrow=40,ncol=40)
low_disPhoRB <- MPhoRB[lower.tri(MPhoRB)]
low_disPhoRB 

PhoRB2<-read.csv("C:\\Users\\faits\\Documents\\GitHub\\MIp new\\PhoRB_wMIp_test_4.csv",header=TRUE)
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


hist(low_PhoRB)
x11()
plot(PhoRB$MIp,PhoRB$Dis)
abline(v=0.0529590, col="red")
x11()
plot(PhoRB2$MIp,PhoRB2$dis)
abline(v=0.0529590, col="red")
x11()
plot(PhoRB2$wMIp,PhoRB2$dis)
x11()
plot(low_PhoRB2 , low_disPhoRB2 )

MIp <- append(MIp, low_PhoRB, after = length(MIp))
Dis <- append(Dis, low_disPhoRB, after = length(Dis))

MIp2 <- append(MIp2, low_PhoRB2, after = length(MIp2))
Dis2 <- append(Dis2, low_disPhoRB2, after = length(Dis2))
wMIp2 <- append(wMIp2, low_wMIpPhoRB2, after = length(wMIp2))
sMIp2 <- append(sMIp2, low_sMIpPhoRB2, after = length(sMIp2))
swMIp2 <- append(swMIp2, low_swMIpPhoRB2, after = length(swMIp2))

QseCB<- read.csv("C:\\Users\\faits\\Documents\\Clusters\\QseCB MIp Dis.csv",header=TRUE)
QseCB
QseCB$MIp
HeatQseCB<-matrix(QseCB$MIp,nrow=40,ncol=40)
low_QseCB <- HeatQseCB[lower.tri(HeatQseCB)]
low_QseCB

MQseCB<-matrix(QseCB$Dis,nrow=40,ncol=40)
low_disQseCB <- MQseCB[lower.tri(MQseCB)]
low_disQseCB 

QseCB2<- read.csv("C:\\Users\\faits\\Documents\\GitHub\\MIp new\\QseCB_wMIp_test_4.csv",header=TRUE)
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

hist(low_QseCB)
x11()
plot(QseCB$MIp,QseCB$Dis)
abline(v=0.0529590, col="red")
x11()
plot(QseCB2$MIp,QseCB2$dis)
abline(v=0.0529590, col="red")
x11()
plot(QseCB2$wMIp,QseCB2$dis)
x11()
plot(QseCB2$sMIp,QseCB2$dis)
x11()
plot(QseCB2$swMIp,QseCB2$dis)
x11()
plot(low_QseCB2, low_disQseCB2)


MIp <- append(MIp, low_QseCB, after = length(MIp))
Dis <- append(Dis, low_disQseCB, after = length(Dis))


MIp2 <- append(MIp2, low_QseCB2, after = length(MIp2))
Dis2 <- append(Dis2, low_disQseCB2, after = length(Dis2))
wMIp2 <- append(wMIp2, low_wMIpQseCB2, after = length(wMIp2))
sMIp2 <- append(sMIp2, low_sMIpQseCB2, after = length(sMIp2))
swMIp2 <- append(swMIp2, low_swMIpQseCB2, after = length(swMIp2))

filter.CpxAR<-which(CpxAR$MIp>0.0529590,arr.ind=TRUE)
pp <- CpxAR[filter.CpxAR,1]
pp <- append(pp, CpxAR[filter.CpxAR,2], after = length(pp))
pp <- append(pp, CpxAR[filter.CpxAR,3], after = length(pp))
pp <- append(pp, CpxAR[filter.CpxAR,4], after = length(pp))
qq <- matrix(pp,nrow=length(filter.CpxAR),4)
qq

filter.CpxAR2<-which(CpxAR2$swMIp>0.031091147,arr.ind=TRUE)
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

filter.NarQP<-which(NarQP$MIp>0.0529590,arr.ind=TRUE)
pp1 <- NarQP[filter.NarQP,1]
pp1 <- append(pp1, NarQP[filter.NarQP,2], after = length(pp1))
pp1 <- append(pp1, NarQP[filter.NarQP,3], after = length(pp1))
pp1 <- append(pp1, NarQP[filter.NarQP,4], after = length(pp1))
qq1 <- matrix(pp1,nrow=length(filter.NarQP),4)
qq1

filter.NarQP2<-which(NarQP2$swMIp>0.031091147,arr.ind=TRUE)
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

filter.PhoRB<-which(PhoRB$MIp>0.0529590,arr.ind=TRUE)
pp2 <- PhoRB[filter.PhoRB,1]
pp2 <- append(pp2, PhoRB[filter.PhoRB,2], after = length(pp2))
pp2 <- append(pp2, PhoRB[filter.PhoRB,3], after = length(pp2))
pp2 <- append(pp2, PhoRB[filter.PhoRB,4], after = length(pp2))
qq2 <- matrix(pp2,nrow=length(filter.PhoRB),4)
qq2

filter.PhoRB2<-which(PhoRB2$swMIp>0.031091147,arr.ind=TRUE)
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

filter.QseCB<-which(QseCB$MIp>0.0529590,arr.ind=TRUE)
pp3 <- QseCB[filter.QseCB,1]
pp3 <- append(pp3, QseCB[filter.QseCB,2], after = length(pp3))
pp3 <- append(pp3, QseCB[filter.QseCB,3], after = length(pp3))
pp3 <- append(pp3, QseCB[filter.QseCB,4], after = length(pp3))
qq3 <- matrix(pp3,nrow=length(filter.QseCB),4)
qq3

filter.QseCB2<-which(QseCB2$wMIp>0.0452415,arr.ind=TRUE)
pp3 <- QseCB2[filter.QseCB2,1]
pp3 <- append(pp3, QseCB2[filter.QseCB2,2], after = length(pp3))
pp3 <- append(pp3, QseCB2[filter.QseCB2,10], after = length(pp3))
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
filter.QseCB2_y<-which(qq3[,2]>528,arr.ind=TRUE)
pp3 <- qq3[filter.QseCB2_y,1]
pp3 <- append(pp3, qq3[filter.QseCB2_y,2], after = length(pp3))
pp3 <- append(pp3, qq3[filter.QseCB2_y,3], after = length(pp3))
pp3 <- append(pp3, qq3[filter.QseCB2_y,4], after = length(pp3))
qq3 <- matrix(pp3,nrow=length(filter.QseCB2_y),4)
qq3

filter.QseCB2<-which(QseCB2$swMIp>0.031091147,arr.ind=TRUE)
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
filter.QseCB2_y<-which(qq3[,2]>528,arr.ind=TRUE)
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
quantile(MIp,p=c(0.25,0.5,0.75,0.80,0.90,0.95,1),na.rm=TRUE)
x11()
qqnorm(MIp,na.rm=TRUE)
qqline(MIp,col="red")

x11()
plot(MIp2,Dis2)
abline(v=0.0501920, col="red")
abline(v=0.057346, col="green")

x11()
plot(wMIp2,Dis2)
abline(v=0.0452415, col="red")
abline(v=0.04986200, col="green")

x11()
plot(sMIp2,Dis2)
abline(v=0.013875365, col="red")
abline(v=0.016360208, col="green")

x11()
plot(swMIp2,Dis2)
abline(v=0.015025222, col="red")
abline(v=0.018766703, col="green")
abline(v=0.031091147, col="yellow")
abline(v=0.041387259, col="purple")



MIp2[which(MIp2==0)] = NA
wMIp2[which(wMIp2==0)] = NA
sMIp2[which(sMIp2==0)] = NA
swMIp2[which(swMIp2==0)] = NA


x11()
hist(-log(MIp2))
x11()
boxplot(MIp2)
max(MIp2, na.rm = TRUE)
min(MIp2, na.rm = TRUE)
quantile(MIp2,p=c(0.25,0.5,0.75,0.80,0.90,0.95,1),na.rm=TRUE)
quantile(wMIp2,p=c(0.25,0.5,0.75,0.80,0.90,0.95,1),na.rm=TRUE)
quantile(sMIp2,p=c(0.25,0.5,0.75,0.80,0.90,0.95,1),na.rm=TRUE)
quantile(swMIp2,p=c(0.25,0.5,0.75,0.80,0.90,0.95,0.96,0.97,0.98,0.99,1),na.rm=TRUE)
x11()
qqnorm(MIp,na.rm=TRUE)
qqline(MIp,col="red")

filter1.MIp2 <- MIp2
filter2.MIp2 <- MIp2
filter1.wMIp2 <- wMIp2
filter2.wMIp2 <- wMIp2
filter1.sMIp2 <- sMIp2
filter2.sMIp2 <- sMIp2
filter1.swMIp2 <- swMIp2
filter2.swMIp2 <- swMIp2

filter1.MIp2[which(MIp2>0.0501920)]
filter2.MIp2[which(MIp2>0.057346)] 
filter1.wMIp2[which(wMIp2>0.0452415)]
filter2.wMIp2[which(wMIp2>0.04986200)] 
filter1.sMIp2[which(sMIp2>0.013875365)] 
filter2.sMIp2[which(sMIp2>0.016360208)] 
filter1.swMIp2[which(swMIp2>0.015025222)] 
filter2.swMIp2[which(swMIp2>0.018766703)] 

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

write.csv(scaPhoRBCpxAR2,file="C:\\Users\\faits\\Documents\\GitHub\\MIp new\\PhoRBCpxAR_sdwMIp.csv")
write.csv(scaPhoRBNarQP2,file="C:\\Users\\faits\\Documents\\GitHub\\MIp new\\PhoRBNarQP_sdwMIp.csv")
write.csv(scaPhoRBQseCB2,file="C:\\Users\\faits\\Documents\\GitHub\\MIp new\\PhoRBQseCB_sdwMIp.csv")
write.csv(scaCpxARNarQP2,file="C:\\Users\\faits\\Documents\\GitHub\\MIp new\\CpxARNarQP_sdwMIp.csv")
write.csv(scaCpxARQseCB2,file="C:\\Users\\faits\\Documents\\GitHub\\MIp new\\CpxARQseCB_sdwMIp.csv")
write.csv(scaNarQPQseCB2,file="C:\\Users\\faits\\Documents\\GitHub\\MIp new\\NarQPQseCB_sdwMIp.csv")


sdwMIp <- low_scaPhoRBCpxAR2
sdwMIp <- append(sdwMIp , low_scaPhoRBNarQP2 , after = length(sdwMIp))
sdwMIp <- append(sdwMIp , low_scaPhoRBQseCB2 , after = length(sdwMIp))
sdwMIp <- append(sdwMIp , low_scaCpxARNarQP2 , after = length(sdwMIp))
sdwMIp <- append(sdwMIp , low_scaCpxARQseCB2 , after = length(sdwMIp))
sdwMIp <- append(sdwMIp , low_scaNarQPQseCB2 , after = length(sdwMIp))

hist(sdwMIp)

quantile(sdwMIp,p=c(0.25,0.5,0.75,0.80,0.90,0.95,0.96,0.97,0.98,0.99,1),na.rm=TRUE)
min(sdwMIp)
max(sdwMIp)



low_swMIpQseCB2

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



filter.PhoRBCpxAR2 <- PhoRBCpxAR2
filter.PhoRBNarQP2 <- PhoRBNarQP2
filter.PhoRBQseCB2 <- PhoRBQseCB2
filter.CpxARNarQP2 <- CpxARNarQP2
filter.CpxARQseCB2 <- CpxARQseCB2

filter.low_scaPhoRBCpxAR2 <-which(low_scaPhoRBCpxAR2 > 0.071687722,arr.ind=TRUE)
grafo <- low_scaPhoRBCpxAR2 [filter.low_scaPhoRBCpxAR2 ]

filter.low_scaPhoRBNarQP2 <-which(low_scaPhoRBNarQP2 > 0.071687722,arr.ind=TRUE)
grafo2 <- low_scaPhoRBNarQP2 [filter.low_scaPhoRBNarQP2 ]

filter.low_scaPhoRBQseCB2 <-which(low_scaPhoRBQseCB2 > 0.071687722,arr.ind=TRUE)
grafo3 <- low_scaPhoRBQseCB2 [filter.low_scaPhoRBQseCB2 ]

filter.low_scaCpxARNarQP2 <-which(low_scaCpxARNarQP2 > 0.071687722,arr.ind=TRUE)
grafo4 <- low_scaCpxARNarQP2 [filter.low_scaCpxARNarQP2 ]

filter.low_scaCpxARQseCB2 <-which(low_scaCpxARQseCB2 > 0.071687722,arr.ind=TRUE)
grafo5 <- low_scaCpxARQseCB2 [filter.low_scaCpxARQseCB2 ]

filter.low_scaNarQPQseCB2 <-which(low_scaNarQPQseCB2 > 0.071687722,arr.ind=TRUE)
grafo6 <- low_scaNarQPQseCB2 [filter.low_scaNarQPQseCB2]

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
filter.QseCB2_y<-which(qq3[,2]>528,arr.ind=TRUE)
pp3 <- qq3[filter.QseCB2_y,1]
pp3 <- append(pp3, qq3[filter.QseCB2_y,2], after = length(pp3))
pp3 <- append(pp3, qq3[filter.QseCB2_y,3], after = length(pp3))
pp3 <- append(pp3, qq3[filter.QseCB2_y,4], after = length(pp3))
qq3 <- matrix(pp3,nrow=length(filter.QseCB2_y),4)
qq3



#Scalar distribution

CpxARNarQP<-read.csv("C:\\Users\\faits\\Documents\\GitHub\\kruskalpython\\CpxARNarQP_scalar.csv",header=TRUE)
CpxARNarQP
CpxARNarQP$MIp
HeatCpxARNarQP<-matrix(CpxARNarQP$MIp,nrow=40,ncol=40)
low_CpxARNarQP <- HeatCpxARNarQP[lower.tri(HeatCpxARNarQP)]
low_CpxARNarQP
#hist(low_CpxARNarQP)

scalar_MIp <- low_CpxARNarQP

CpxARPhoRB<-read.csv("C:\\Users\\faits\\Documents\\GitHub\\kruskalpython\\CpxARPhoRB_scalar.csv",header=TRUE)
CpxARPhoRB
CpxARPhoRB$MIp
HeatCpxARPhoRB<-matrix(CpxARPhoRB$MIp,nrow=40,ncol=40)
low_CpxARPhoRB<- HeatCpxARPhoRB[lower.tri(HeatCpxARPhoRB)]
low_CpxARPhoRB
#hist(low_CpxARPhoRB)

scalar_MIp <- append(scalar_MIp, low_CpxARPhoRB, after = length(scalar_MIp))

CpxARQseCB<-read.csv("C:\\Users\\faits\\Documents\\GitHub\\kruskalpython\\CpxARQseCB_scalar.csv",header=TRUE)
CpxARQseCB
CpxARQseCB$MIp
HeatCpxARQseCB<-matrix(CpxARQseCB$MIp,nrow=40,ncol=40)
low_CpxARNarQP <- HeatCpxARQseCB[lower.tri(HeatCpxARQseCB)]
low_CpxARNarQP
#hist(low_CpxARNarQP)

scalar_MIp <- append(scalar_MIp, low_CpxARNarQP, after = length(scalar_MIp))

NarQPCpxAR<-read.csv("C:\\Users\\faits\\Documents\\GitHub\\kruskalpython\\NarQPCpxAR_scalar.csv",header=TRUE)
NarQPCpxAR
NarQPCpxAR$MIp
HeatNarQPCpxAR<-matrix(NarQPCpxAR$MIp,nrow=40,ncol=40)
low_NarQPCpxAR<- HeatNarQPCpxAR[lower.tri(HeatNarQPCpxAR)]
low_NarQPCpxAR
#hist(low_NarQPCpxAR)

scalar_MIp <- append(scalar_MIp, low_NarQPCpxAR, after = length(scalar_MIp))

NarQPPhoRB<-read.csv("C:\\Users\\faits\\Documents\\GitHub\\kruskalpython\\NarQPPhoRB_scalar.csv",header=TRUE)
NarQPPhoRB
NarQPPhoRB$MIp
HeatNarQPPhoRB<-matrix(NarQPPhoRB$MIp,nrow=40,ncol=40)
low_NarQPPhoRB<- HeatNarQPPhoRB[lower.tri(HeatNarQPPhoRB)]
low_NarQPPhoRB
#hist(low_NarQPPhoRB)

scalar_MIp <- append(scalar_MIp, low_NarQPPhoRB, after = length(scalar_MIp))

NarQPQseCB<-read.csv("C:\\Users\\faits\\Documents\\GitHub\\kruskalpython\\NarQPQseCB_scalar.csv",header=TRUE)
NarQPQseCB
NarQPQseCB$MIp
HeatNarQPQseCB<-matrix(NarQPQseCB$MIp,nrow=40,ncol=40)
low_NarQPQseCB<- HeatNarQPQseCB[lower.tri(HeatNarQPQseCB)]
low_NarQPQseCB
#hist(low_NarQPQseCB)

scalar_MIp <- append(scalar_MIp, low_NarQPQseCB, after = length(scalar_MIp))

PhoRBCpxAR<-read.csv("C:\\Users\\faits\\Documents\\GitHub\\kruskalpython\\PhoRBCpxAR_scalar.csv",header=TRUE)
PhoRBCpxAR
PhoRBCpxAR$MIp
HeatPhoRBCpxAR<-matrix(PhoRBCpxAR$MIp,nrow=40,ncol=40)
low_PhoRBCpxAR<- HeatPhoRBCpxAR[lower.tri(HeatPhoRBCpxAR)]
low_PhoRBCpxAR
#hist(low_PhoRBCpxAR)

scalar_MIp <- append(scalar_MIp, low_PhoRBCpxAR, after = length(scalar_MIp))

PhoRBNarQP<-read.csv("C:\\Users\\faits\\Documents\\GitHub\\kruskalpython\\PhoRBNarQP_scalar.csv",header=TRUE)
PhoRBNarQP
PhoRBNarQP$MIp
HeatNarQPPhoRB<-matrix(PhoRBNarQP$MIp,nrow=40,ncol=40)
low_PhoRBNarQP<- HeatNarQPPhoRB[lower.tri(HeatNarQPPhoRB)]
low_PhoRBNarQP
#hist(low_PhoRBNarQP)

scalar_MIp <- append(scalar_MIp, low_PhoRBNarQP, after = length(scalar_MIp))

PhoRBQseCB<-read.csv("C:\\Users\\faits\\Documents\\GitHub\\kruskalpython\\PhoRBQseCB_scalar.csv",header=TRUE)
PhoRBQseCB
PhoRBQseCB$MIp
HeatPhoRBQseCB<-matrix(PhoRBQseCB$MIp,nrow=40,ncol=40)
low_PhoRBQseCB<- HeatPhoRBQseCB[lower.tri(HeatPhoRBQseCB)]
low_PhoRBQseCB
#hist(low_PhoRBQseCB)

scalar_MIp <- append(scalar_MIp, low_PhoRBQseCB, after = length(scalar_MIp))

QseCBCpxAR<-read.csv("C:\\Users\\faits\\Documents\\GitHub\\kruskalpython\\QseCBCpxAR_scalar.csv",header=TRUE)
QseCBCpxAR
QseCBCpxAR$MIp
HeatQseCBCpxAR<-matrix(QseCBCpxAR$MIp,nrow=40,ncol=40)
low_QseCBCpxAR<- HeatQseCBCpxAR[lower.tri(HeatQseCBCpxAR)]
low_QseCBCpxAR
#hist(low_QseCBCpxAR)

scalar_MIp <- append(scalar_MIp, low_QseCBCpxAR, after = length(scalar_MIp))

QseCBNarQP<-read.csv("C:\\Users\\faits\\Documents\\GitHub\\kruskalpython\\QseCBNarQP_scalar.csv",header=TRUE)
QseCBNarQP
QseCBNarQP$MIp
HeatQseCBNarQP<-matrix(QseCBNarQP$MIp,nrow=40,ncol=40)
low_QseCBNarQP<- HeatQseCBNarQP[lower.tri(HeatQseCBNarQP)]
low_QseCBNarQP
#hist(low_QseCBNarQP)

scalar_MIp <- append(scalar_MIp, low_QseCBNarQP, after = length(scalar_MIp))

QseCBPhoRB<-read.csv("C:\\Users\\faits\\Documents\\GitHub\\kruskalpython\\QseCBPhoRB_scalar.csv",header=TRUE)
QseCBPhoRB
QseCBPhoRB$MIp
HeatQseCBPhoRB<-matrix(QseCBPhoRB$MIp,nrow=40,ncol=40)
low_QseCBPhoRB<- HeatQseCBPhoRB[lower.tri(HeatQseCBPhoRB)]
low_QseCBPhoRB
#hist(low_QseCBPhoRB)

scalar_MIp <- append(scalar_MIp, low_QseCBPhoRB, after = length(scalar_MIp))

filter.scalar_MIp<-which(scalar_MIp>0.0555400,arr.ind=TRUE)
ss <- scalar_MIp [filter.scalar_MIp]
ss

x11()
hist(scalar_MIp)
x11()
boxplot(scalar_MIp)
max(scalar_MIp, na.rm = TRUE)
min(scalar_MIp, na.rm = TRUE)
quantile(scalar_MIp,p=c(0.25,0.5,0.75,0.80,0.90,0.95,1),na.rm=TRUE)
qqnorm(scalar_MIp,na.rm=TRUE)
qqline(scalar_MIp,col="red")

filter.scalar_MIp<-which(CpxAR$MIp>0.0529590,arr.ind=TRUE)


help("matrix")

#### MIp scalar

CpxAR<-read.csv("C:\\Users\\faits\\Documents\\GitHub\\kruskalpython\\CpxAR MIp_scalar.csv",header=TRUE)
CpxAR
CpxAR$s
HeatCpxAR<-matrix(CpxAR$s,nrow=40,ncol=40)
low_CpxAR <- HeatCpxAR[lower.tri(HeatCpxAR)]
low_CpxAR

MCpxAR<-matrix(CpxAR$d,nrow=40,ncol=40)
low_disCpxAR <- MCpxAR[lower.tri(MCpxAR)]
low_disCpxAR 

plot(CpxAR$s,CpxAR$d)
abline(v=0.022091, col="red")

plot(low_CpxAR)


hist(low_CpxAR)
x11()

MIp <- low_CpxAR
Dis <- low_disCpxAR


NarQP<-read.csv("C:\\Users\\faits\\Documents\\GitHub\\kruskalpython\\NarQP MIp_scalar.csv",header=TRUE)
NarQP
NarQP$s
HeatNarQP<-matrix(NarQP$s,nrow=40,ncol=40)
low_NarQP <- HeatNarQP[lower.tri(HeatNarQP)]

MNarQP<-matrix(NarQP$d,nrow=40,ncol=40)
low_disNarQP <- MNarQP[lower.tri(MNarQP)]
low_disNarQP 


plot(NarQP$s,NarQP$d)
abline(v=0.022091, col="red")
hist(low_NarQP)
x11()
plot(low_NarQP)

MIp <- append(MIp, low_NarQP, after = length(MIp))
Dis <- append(Dis, low_disNarQP, after = length(Dis))

PhoRB<-read.csv("C:\\Users\\faits\\Documents\\GitHub\\kruskalpython\\PhoRB MIp_scalar.csv",header=TRUE)
PhoRB
PhoRB$s
HeatPhoRB<-matrix(PhoRB$s,nrow=40,ncol=40)
low_PhoRB <- HeatPhoRB[lower.tri(HeatPhoRB)]

MPhoRB<-matrix(PhoRB$d,nrow=40,ncol=40)
low_disPhoRB <- MPhoRB[lower.tri(MPhoRB)]
low_disPhoRB 

plot(PhoRB$s,PhoRB$d)
abline(v=0.022091, col="red")
hist(low_PhoRB)
x11()
plot(low_PhoRB)



MIp <- append(MIp, low_PhoRB, after = length(MIp))
Dis <- append(Dis, low_disPhoRB, after = length(Dis))

QseCB<- read.csv("C:\\Users\\faits\\Documents\\GitHub\\kruskalpython\\QseCB MIp_scalar.csv",header=TRUE)
QseCB
QseCB$s
HeatQseCB<-matrix(QseCB$s,nrow=40,ncol=40)
low_QseCB <- HeatQseCB[lower.tri(HeatQseCB)]

MQseCB<-matrix(QseCB$d,nrow=40,ncol=40)
low_disQseCB <- MQseCB[lower.tri(MQseCB)]
low_disQseCB 

plot(QseCB$s,QseCB$d)
abline(v=0.022091, col="red")
hist(low_QseCB)
x11()
plot(low_QseCB)

MIp <- append(MIp, low_QseCB, after = length(MIp))
Dis <- append(Dis, low_disQseCB, after = length(Dis))


filter.CpxAR<-which(CpxAR$s>0.022091,arr.ind=TRUE)
pp <- CpxAR[filter.CpxAR,1]
pp <- append(pp, CpxAR[filter.CpxAR,2], after = length(pp))
pp <- append(pp, CpxAR[filter.CpxAR,3], after = length(pp))
pp <- append(pp, CpxAR[filter.CpxAR,4], after = length(pp))
qq <- matrix(pp,nrow=length(filter.CpxAR),4)
qq

filter.NarQP<-which(NarQP$s>0.022091,arr.ind=TRUE)
pp1 <- NarQP[filter.NarQP,1]
pp1 <- append(pp1, NarQP[filter.NarQP,2], after = length(pp1))
pp1 <- append(pp1, NarQP[filter.NarQP,3], after = length(pp1))
pp1 <- append(pp1, NarQP[filter.NarQP,4], after = length(pp1))
qq1 <- matrix(pp1,nrow=length(filter.NarQP),4)
qq1

filter.PhoRB<-which(PhoRB$s>0.022091,arr.ind=TRUE)
pp2 <- PhoRB[filter.PhoRB,1]
pp2 <- append(pp2, PhoRB[filter.PhoRB,2], after = length(pp2))
pp2 <- append(pp2, PhoRB[filter.PhoRB,3], after = length(pp2))
pp2 <- append(pp2, PhoRB[filter.PhoRB,4], after = length(pp2))
qq2 <- matrix(pp2,nrow=length(filter.PhoRB),4)
qq2

filter.QseCB<-which(QseCB$s>0.022091,arr.ind=TRUE)
pp3 <- QseCB[filter.QseCB,1]
pp3 <- append(pp3, QseCB[filter.QseCB,2], after = length(pp3))
pp3 <- append(pp3, QseCB[filter.QseCB,3], after = length(pp3))
pp3 <- append(pp3, QseCB[filter.QseCB,4], after = length(pp3))
qq3 <- matrix(pp3,nrow=length(filter.QseCB),4)
qq3

plot(MIp,Dis)
abline(v=0.022091, col="red")
hist(-log(MIp))
boxplot(MIp)
max(MIp, na.rm = TRUE)
min(MIp, na.rm = TRUE)
quantile(MIp,p=c(0.25,0.5,0.75,0.80,0.90,0.95,1),na.rm=TRUE)
qqnorm(MIp,na.rm=TRUE)
qqline(MIp,col="red")
