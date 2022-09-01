					#File routes
##############################################################################

CpxAR2<-read.csv("C:\\Users\\faits\\Documents\\GitHub\\MIp new\\CpxAR_wMIp_final_4.csv",header=TRUE)
NarQP2<-read.csv("C:\\Users\\faits\\Documents\\GitHub\\MIp new\\NarQP_wMIp_final_4.csv",header=TRUE)
PhoRB2<-read.csv("C:\\Users\\faits\\Documents\\GitHub\\MIp new\\PhoRB_wMIp_final_4.csv",header=TRUE)
QseCB2<- read.csv("C:\\Users\\faits\\Documents\\GitHub\\MIp new\\QseCB_wMIp_final_4.csv",header=TRUE)

				#CpxAR data acquisition
##############################################################################
HeatCpxAR2<-matrix(CpxAR2$MIp,nrow=40,ncol=40)
low_CpxAR2 <- HeatCpxAR2[lower.tri(HeatCpxAR2)]

MCpxAR2<-matrix(CpxAR2$dis,nrow=40,ncol=40)
low_disCpxAR2 <- MCpxAR2[lower.tri(MCpxAR2)]

sMIpCpxAR2<-matrix(CpxAR2$sMIp,nrow=40,ncol=40)
low_sMIpCpxAR2 <- sMIpCpxAR2[lower.tri(sMIpCpxAR2)]

wMIpCpxAR2<-matrix(CpxAR2$wMIp,nrow=40,ncol=40)
low_wMIpCpxAR2 <- wMIpCpxAR2[lower.tri(wMIpCpxAR2)]

ICICpxAR2<-matrix(CpxAR2$ICI,nrow=40,ncol=40)
low_ICICpxAR2<- ICICpxAR2[lower.tri(ICICpxAR2)]

MIp2 <- low_CpxAR2
Dis2 <- low_disCpxAR2
wMIp2 <- low_wMIpCpxAR2
sMIp2 <- low_sMIpCpxAR2
ICI2 <- low_ICICpxAR2

				#NarQP data acquisition
##############################################################################

HeatNarQP2<-matrix(NarQP2$MIp,nrow=40,ncol=40)
low_NarQP2 <- HeatNarQP2[lower.tri(HeatNarQP2)]

MNarQP2<-matrix(NarQP2$dis,nrow=40,ncol=40)
low_disNarQP2 <- MNarQP2[lower.tri(MNarQP2)]

sMIpNarQP2<-matrix(NarQP2$sMIp,nrow=40,ncol=40)
low_sMIpNarQP2 <- sMIpNarQP2[lower.tri(sMIpNarQP2)]

wMIpNarQP2<-matrix(NarQP2$wMIp,nrow=40,ncol=40)
low_wMIpNarQP2 <- wMIpNarQP2[lower.tri(wMIpNarQP2)]

ICINarQP2<-matrix(NarQP2$ICI,nrow=40,ncol=40)
low_ICINarQP2 <- ICINarQP2[lower.tri(ICINarQP2)]

MIp2 <- append(MIp2, low_NarQP2, after = length(MIp2))
Dis2 <- append(Dis2, low_disNarQP2, after = length(Dis2))
wMIp2 <- append(wMIp2, low_wMIpNarQP2, after = length(wMIp2))
sMIp2 <- append(sMIp2, low_sMIpNarQP2, after = length(sMIp2))
ICI2 <- append(ICI2, low_ICINarQP2, after = length(ICI2))

				#PhoRB data acquisition
##############################################################################

HeatPhoRB2<-matrix(PhoRB2$MIp,nrow=40,ncol=40)
low_PhoRB2 <- HeatPhoRB2[lower.tri(HeatPhoRB2)]

MPhoRB2<-matrix(PhoRB2$dis,nrow=40,ncol=40)
low_disPhoRB2 <- MPhoRB2[lower.tri(MPhoRB2)]

sMIpPhoRB2<-matrix(PhoRB2$sMIp,nrow=40,ncol=40)
low_sMIpPhoRB2 <- sMIpPhoRB2[lower.tri(sMIpPhoRB2)]

wMIpPhoRB2<-matrix(PhoRB2$wMIp,nrow=40,ncol=40)
low_wMIpPhoRB2 <- wMIpPhoRB2[lower.tri(wMIpPhoRB2)]

ICIPhoRB2<-matrix(PhoRB2$ICI,nrow=40,ncol=40)
low_ICIPhoRB2 <- ICIPhoRB2[lower.tri(ICIPhoRB2)]

MIp2 <- append(MIp2, low_PhoRB2, after = length(MIp2))
Dis2 <- append(Dis2, low_disPhoRB2, after = length(Dis2))
wMIp2 <- append(wMIp2, low_wMIpPhoRB2, after = length(wMIp2))
sMIp2 <- append(sMIp2, low_sMIpPhoRB2, after = length(sMIp2))
ICI2 <- append(ICI2, low_ICIPhoRB2, after = length(ICI2))

				#QseCB data acquisition
##############################################################################

HeatQseCB2<-matrix(QseCB2$MIp,nrow=40,ncol=40)
low_QseCB2 <- HeatQseCB2[lower.tri(HeatQseCB2)]

MQseCB2<-matrix(QseCB2$dis,nrow=40,ncol=40)
low_disQseCB2 <- MQseCB2[lower.tri(MQseCB2)]

sMIpQseCB2<-matrix(QseCB2$sMIp,nrow=40,ncol=40)
low_sMIpQseCB2 <- sMIpQseCB2[lower.tri(sMIpQseCB2)]

wMIpQseCB2<-matrix(QseCB2$wMIp,nrow=40,ncol=40)
low_wMIpQseCB2 <- wMIpQseCB2[lower.tri(wMIpQseCB2)]

ICIQseCB2<-matrix(QseCB2$ICI,nrow=40,ncol=40)
low_ICIQseCB2 <- ICIQseCB2[lower.tri(ICIQseCB2)]

MIp2 <- append(MIp2, low_QseCB2, after = length(MIp2))
Dis2 <- append(Dis2, low_disQseCB2, after = length(Dis2))
wMIp2 <- append(wMIp2, low_wMIpQseCB2, after = length(wMIp2))
sMIp2 <- append(sMIp2, low_sMIpQseCB2, after = length(sMIp2))
ICI2 <- append(ICI2, low_ICIQseCB2, after = length(ICI2))

				#MIp and wMIp plots
##############################################################################

x11()
par(mfrow=c(1,2))
plot(MIp2,Dis2, pch= 20, xlab='MIp', ylab='minimal backbone residue distance')
plot(wMIp2,Dis2, xlab='wMIp', ylab= NA, pch= 20, xlim=c(-0.2,0.2))

			#All datasets combined 99% percentile
##############################################################################

xx <- quantile(ICI2,p=c(0.99),na.rm=TRUE)

			#PhoRB dataset filtering with 99% threshold
##############################################################################

filter.CpxAR2<-which(CpxAR2$ICI>xx,arr.ind=TRUE)
pp <- CpxAR2[filter.CpxAR2,1]
pp <- append(pp, CpxAR2[filter.CpxAR2,2], after = length(pp))
pp <- append(pp, CpxAR2[filter.CpxAR2,14], after = length(pp))
pp <- append(pp, CpxAR2[filter.CpxAR2,11], after = length(pp))
qq <- matrix(pp,nrow=length(filter.CpxAR2),4)

filter.CpxAR2_x<-which(qq[,1]<579,arr.ind=TRUE)
pp <- qq[filter.CpxAR2_x,1]
pp <- append(pp, qq[filter.CpxAR2_x,2], after = length(pp))
pp <- append(pp, qq[filter.CpxAR2_x,3], after = length(pp))
pp <- append(pp, qq[filter.CpxAR2_x,4], after = length(pp))
qq <- matrix(pp,nrow=length(filter.CpxAR2_x),4)

filter.CpxAR2_y<-which(qq[,2]>683,arr.ind=TRUE)
pp <- qq[filter.CpxAR2_y,1]
pp <- append(pp, qq[filter.CpxAR2_y,2], after = length(pp))
pp <- append(pp, qq[filter.CpxAR2_y,3], after = length(pp))
pp <- append(pp, qq[filter.CpxAR2_y,4], after = length(pp))
qq <- matrix(pp,nrow=length(filter.CpxAR2_y),4)

			#NarQP dataset filtering with 99% threshold
##############################################################################


filter.NarQP2<-which(NarQP2$ICI>xx,arr.ind=TRUE)
pp1 <- NarQP2[filter.NarQP2,1]
pp1 <- append(pp1, NarQP2[filter.NarQP2,2], after = length(pp1))
pp1 <- append(pp1, NarQP2[filter.NarQP2,14], after = length(pp1))
pp1 <- append(pp1, NarQP2[filter.NarQP2,11], after = length(pp1))
qq1 <- matrix(pp1,nrow=length(filter.NarQP2),4)

filter.NarQP2_x<-which(qq1[,1]<907,arr.ind=TRUE)
pp1 <- qq1[filter.NarQP2_x,1]
pp1 <- append(pp1, qq1[filter.NarQP2_x,2], after = length(pp1))
pp1 <- append(pp1, qq1[filter.NarQP2_x,3], after = length(pp1))
pp1 <- append(pp1, qq1[filter.NarQP2_x,4], after = length(pp1))
qq1 <- matrix(pp1,nrow=length(filter.NarQP2_x),4)

filter.NarQP2_y<-which(qq1[,2]>1043,arr.ind=TRUE)
pp1 <- qq1[filter.NarQP2_y,1]
pp1 <- append(pp1, qq1[filter.NarQP2_y,2], after = length(pp1))
pp1 <- append(pp1, qq1[filter.NarQP2_y,3], after = length(pp1))
pp1 <- append(pp1, qq1[filter.NarQP2_y,4], after = length(pp1))
qq1 <- matrix(pp1,nrow=length(filter.NarQP2_y),4)
qq1

			#PhoRB dataset filtering with 99% threshold
##############################################################################

filter.PhoRB2<-which(PhoRB2$ICI>xx,arr.ind=TRUE)
pp2 <- PhoRB2[filter.PhoRB2,1]
pp2 <- append(pp2, PhoRB2[filter.PhoRB2,2], after = length(pp2))
pp2 <- append(pp2, PhoRB2[filter.PhoRB2,14], after = length(pp2))
pp2 <- append(pp2, PhoRB2[filter.PhoRB2,11], after = length(pp2))
qq2 <- matrix(pp2,nrow=length(filter.PhoRB2),4)

filter.PhoRB2_x<-which(qq2[,1]<780,arr.ind=TRUE)
pp2 <- qq2[filter.PhoRB2_x,1]
pp2 <- append(pp2, qq2[filter.PhoRB2_x,2], after = length(pp2))
pp2 <- append(pp2, qq2[filter.PhoRB2_x,3], after = length(pp2))
pp2 <- append(pp2, qq2[filter.PhoRB2_x,4], after = length(pp2))
qq2 <- matrix(pp2,nrow=length(filter.PhoRB2_x),4)

filter.PhoRB2_y<-which(qq2[,2]>935,arr.ind=TRUE)
pp2 <- qq2[filter.PhoRB2_y,1]
pp2 <- append(pp2, qq2[filter.PhoRB2_y,2], after = length(pp2))
pp2 <- append(pp2, qq2[filter.PhoRB2_y,3], after = length(pp2))
pp2 <- append(pp2, qq2[filter.PhoRB2_y,4], after = length(pp2))
qq2 <- matrix(pp2,nrow=length(filter.PhoRB2_y),4)

			#QseCB dataset filtering with 99% threshold
##############################################################################

filter.QseCB2<-which(QseCB2$ICI>xx,arr.ind=TRUE)
pp3 <- QseCB2[filter.QseCB2,1]
pp3 <- append(pp3, QseCB2[filter.QseCB2,2], after = length(pp3))
pp3 <- append(pp3, QseCB2[filter.QseCB2,14], after = length(pp3))
pp3 <- append(pp3, QseCB2[filter.QseCB2,11], after = length(pp3))
qq3 <- matrix(pp3,nrow=length(filter.QseCB2),4)

filter.QseCB2_x<-which(qq3[,1]<529,arr.ind=TRUE)
pp3 <- qq3[filter.QseCB2_x,1]
pp3 <- append(pp3, qq3[filter.QseCB2_x,2], after = length(pp3))
pp3 <- append(pp3, qq3[filter.QseCB2_x,3], after = length(pp3))
pp3 <- append(pp3, qq3[filter.QseCB2_x,4], after = length(pp3))
qq3 <- matrix(pp3,nrow=length(filter.QseCB2_x),4)

filter.QseCB2_y<-which(qq3[,2]>628,arr.ind=TRUE)
pp3 <- qq3[filter.QseCB2_y,1]
pp3 <- append(pp3, qq3[filter.QseCB2_y,2], after = length(pp3))
pp3 <- append(pp3, qq3[filter.QseCB2_y,3], after = length(pp3))
pp3 <- append(pp3, qq3[filter.QseCB2_y,4], after = length(pp3))
qq3 <- matrix(pp3,nrow=length(filter.QseCB2_y),4)

				#ICI plot aa pairs colored by system
##############################################################################

x11()
plot(ICI2,Dis2, ylab='minimal backbone residue distance', xlab='Interface coupling index', pch= 20)
abline(v=xx, col="red")
points(qq[,3],qq[,4], col="red", pch = 20)
points(qq1[,3],qq1[,4], col="green", pch = 20)
points(qq2[,3],qq2[,4], col="cyan", pch = 20)
points(qq3[,3],qq3[,4], col="purple", pch = 20)




