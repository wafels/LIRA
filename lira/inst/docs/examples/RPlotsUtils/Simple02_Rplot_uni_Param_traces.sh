
r --vanilla <<EOF >  Simpl02_run_Rplot_Param_traces.100719b.log
##
#####    Making and pdf files of the specified data
##

#### Data runs first:

infileImgDat1 = '../outputs/PoisDatons32x32EEMC2vsNullModel_Strt1.00_viaFits.param'

ImgDat1 <- read.table(infileImgDat1, header = TRUE, sep = "", quote = "\"'",
           na.strings = "NA", colClasses = NA, nrows = -1,
           skip = 0, check.names = TRUE,
           comment.char = "#",
           allowEscapes = FALSE, flush = FALSE,
           encoding = "unknown")

I1Iter <- ImgDat1[[1]]
I1LogProb <- ImgDat1[[2]]
I1ProbStep <- ImgDat1[[3]]
I1SpinRow <- ImgDat1[[4]]
I1SpinCol <- ImgDat1[[5]]
I1Hyp0 <- ImgDat1[[6]]
I1Hyp1 <- ImgDat1[[7]]
I1Hyp2 <- ImgDat1[[8]]
I1Hyp3 <- ImgDat1[[9]]
I1Hyp4 <- ImgDat1[[10]]
I1ExpMSCnts <- ImgDat1[[11]]
I1BkgPrefactor <- ImgDat1[[12]]

infileImgDat2 = '../outputs/PoisDatons32x32EEMC2vsNullModel_Strt0.01_viaFits.param'

ImgDat2 <- read.table(infileImgDat2, header = TRUE, sep = "", quote = "\"'",
           na.strings = "NA", colClasses = NA, nrows = -1,
           skip = 0, check.names = TRUE,
           comment.char = "#",
           allowEscapes = FALSE, flush = FALSE,
           encoding = "unknown")

I2Iter <- ImgDat2[[1]]
I2LogProb <- ImgDat2[[2]]
I2ProbStep <- ImgDat2[[3]]
I2SpinRow <- ImgDat2[[4]]
I2SpinCol <- ImgDat2[[5]]
I2Hyp0 <- ImgDat2[[6]]
I2Hyp1 <- ImgDat2[[7]]
I2Hyp2 <- ImgDat2[[8]]
I2Hyp3 <- ImgDat2[[9]]
I2Hyp4 <- ImgDat2[[10]]
I2ExpMSCnts <- ImgDat2[[11]]
I2BkgPrefactor <- ImgDat2[[12]]

xrangeImg <- numeric(2)
yrangeImg <- numeric(2)
xrangeImg[1] = 0.
xrangeImg[2] = 0.4
yrangeImg[1] = 0.
yrangeImg[2] = 0.4


rangeLog10MSCnts <- numeric(2)
rangeLog10MSCnts[1] = 2.2
rangeLog10MSCnts[2] = 3.4

## No Background for this one:
#rangeLog10BkgScale <- numeric(2)
#rangeLog10BkgScale[1] = 0.38
#rangeLog10BkgScale[2] = 0.42

rangeLog10Prob <- numeric(2)
rangeLog10Prob[1] = -800.
rangeLog10Prob[2] = -600.

## Each trace or 'time-series' (statistics jargon) plot
## 

## Next File: NOTICE THIS ONE IS OVER-PLOTTED:# 

png("Img02DataLogProbTimeTrace_1_2.png", height=320, width=320, units="px" )

log10euler = log10(exp(1.000000000000))

plot(I1Iter,(I1LogProb*log10euler),type="o",
xlab='Iteration Number',
ylab=' Log10 Post Prob',
ylim=rangeLog10Prob,
pch='.',col="blue",
cex.main=1.4,cex.lab=1.4)
lines(I2Iter,(I2LogProb*log10euler),col="black")

dev.off()

## Next File:
##

png("Img02DataHyp0TimeTrace_1_2.png", height=320, width=320, units="px" )

plot(I1Iter,I1Hyp0,type="o",
xlab='Iteration Number',
ylab='Smoothing Hyper-Param 0',
pch='.',col="blue",
cex.main=1.4,cex.lab=1.4)
lines(I2Iter,I2Hyp0,col="black")


dev.off()

## Next File:
##

png("Img02DataHyp1TimeTrace_1_2.png", height=320, width=320, units="px" )

plot(I1Iter,I1Hyp1,type="o",
xlab='Iteration Number',
ylab='Smoothing Hyper-Param 1',
pch='.',col="blue",
cex.main=1.4,cex.lab=1.4)
lines(I2Iter,I2Hyp1,col="black")


dev.off()

## Next File:
##

png("Img02DataHyp2TimeTrace_1_2.png", height=320, width=320, units="px" )

plot(I1Iter,I1Hyp2,type="o",
xlab='Iteration Number',
ylab='Smoothing Hyper-Param 2',
pch='.',col="blue",
cex.main=1.4,cex.lab=1.4)
lines(I2Iter,I2Hyp2,col="black")


dev.off()

## Next File:
##

png("Img02DataHyp3TimeTrace_1_2.png", height=320, width=320, units="px" )


plot(I1Iter,I1Hyp3,type="o",
xlab='Iteration Number',
ylab='Smoothing Hyper-Param 3',
pch='.',col="blue",
cex.main=1.4,cex.lab=1.4)
lines(I2Iter,I2Hyp3,col="black")

dev.off()


## Next File:
##

png("Img02DataHyp4TimeTrace_1_2.png", height=320, width=320, units="px" )

plot(I1Iter,I1Hyp4,type="o",
xlab='Iteration Number',
ylab='Smoothing Hyper-Param 4',
pch='.',col="blue",
cex.main=1.4,cex.lab=1.4)
lines(I2Iter,I2Hyp4,col="black")

dev.off()


## Next File:
##

png("Img02DataMSCntsTimeTrace_1_2.png", height=320, width=320, units="px" )

plot(I1Iter,log10(I1ExpMSCnts),type="o",
xlab='Iteration Number',
ylab='Log10(Expected MS Counts)',
main='Data (.)',
pch='.',col="blue",
cex.main=1.4,cex.lab=1.4)
lines(I2Iter,log10(I2ExpMSCnts),col="black")
dev.off()


## Next File:
##

png("Img02DataBkgPrefactorTimeTrace_1_2.png", height=320, width=320, units="px" )

plot(I1Iter,log10(I1BkgPrefactor),type="o",
xlab='Iteration Number',
ylab='Log10(Background Pre-Factor)',
main='Data (.)',
pch='.',col="blue",
cex.main=1.4,cex.lab=1.4)
lines(I2Iter,log10(I2BkgPrefactor),col="black")
dev.off()


##################################################################################
#### Now the Null or Baseline runs:

infileImgNul0 = '../outputs/PoisNulDat032x32EEMC2vsNullModel_Strt1.00_viaFits.param'

ImgNul0 <- read.table(infileImgNul0, header = TRUE, sep = "", quote = "\"'",
           na.strings = "NA", colClasses = NA, nrows = -1,
           skip = 0, check.names = TRUE,
           comment.char = "#",
           allowEscapes = FALSE, flush = FALSE,
           encoding = "unknown")

N0Iter <- ImgNul0[[1]]
N0LogProb <- ImgNul0[[2]]
N0ProbStep <- ImgNul0[[3]]
N0SpinRow <- ImgNul0[[4]]
N0SpinCol <- ImgNul0[[5]]
N0Hyp0 <- ImgNul0[[6]]
N0Hyp1 <- ImgNul0[[7]]
N0Hyp2 <- ImgNul0[[8]]
N0Hyp3 <- ImgNul0[[9]]
N0Hyp4 <- ImgNul0[[10]]
N0ExpMSCnts <- ImgNul0[[11]]
N0BkgPrefactor <- ImgNul0[[12]]


infileImgNul1 = '../outputs/PoisNulDat132x32EEMC2vsNullModel_Strt0.01_viaFits.param'

ImgNul1 <- read.table(infileImgNul1, header = TRUE, sep = "", quote = "\"'",
           na.strings = "NA", colClasses = NA, nrows = -1,
           skip = 0, check.names = TRUE,
           comment.char = "#",
           allowEscapes = FALSE, flush = FALSE,
           encoding = "unknown")

N1Iter <- ImgNul1[[1]]
N1LogProb <- ImgNul1[[2]]
N1ProbStep <- ImgNul1[[3]]
N1SpinRow <- ImgNul1[[4]]
N1SpinCol <- ImgNul1[[5]]
N1Hyp0 <- ImgNul1[[6]]
N1Hyp1 <- ImgNul1[[7]]
N1Hyp2 <- ImgNul1[[8]]
N1Hyp3 <- ImgNul1[[9]]
N1Hyp4 <- ImgNul1[[10]]
N1ExpMSCnts <- ImgNul1[[11]]
N1BkgPrefactor <- ImgNul1[[12]]


infileImgNul2 = '../outputs/PoisNulDat232x32EEMC2vsNullModel_Strt1.00_viaFits.param'

ImgNul2 <- read.table(infileImgNul2, header = TRUE, sep = "", quote = "\"'",
           na.strings = "NA", colClasses = NA, nrows = -1,
           skip = 0, check.names = TRUE,
           comment.char = "#",
           allowEscapes = FALSE, flush = FALSE,
           encoding = "unknown")

N2Iter <- ImgNul2[[1]]
N2LogProb <- ImgNul2[[2]]
N2ProbStep <- ImgNul2[[3]]
N2SpinRow <- ImgNul2[[4]]
N2SpinCol <- ImgNul2[[5]]
N2Hyp0 <- ImgNul2[[6]]
N2Hyp1 <- ImgNul2[[7]]
N2Hyp2 <- ImgNul2[[8]]
N2Hyp3 <- ImgNul2[[9]]
N2Hyp4 <- ImgNul2[[10]]
N2ExpMSCnts <- ImgNul2[[11]]
N2BkgPrefactor <- ImgNul2[[12]]


infileImgNul3 = '../outputs/PoisNulDat332x32EEMC2vsNullModel_Strt0.01_viaFits.param'

ImgNul3 <- read.table(infileImgNul3, header = TRUE, sep = "", quote = "\"'",
           na.strings = "NA", colClasses = NA, nrows = -1,
           skip = 0, check.names = TRUE,
           comment.char = "#",
           allowEscapes = FALSE, flush = FALSE,
           encoding = "unknown")

N3Iter <- ImgNul3[[1]]
N3LogProb <- ImgNul3[[2]]
N3ProbStep <- ImgNul3[[3]]
N3SpinRow <- ImgNul3[[4]]
N3SpinCol <- ImgNul3[[5]]
N3Hyp0 <- ImgNul3[[6]]
N3Hyp1 <- ImgNul3[[7]]
N3Hyp2 <- ImgNul3[[8]]
N3Hyp3 <- ImgNul3[[9]]
N3Hyp4 <- ImgNul3[[10]]
N3ExpMSCnts <- ImgNul3[[11]]
N3BkgPrefactor <- ImgNul3[[12]]


infileImgNul4 = '../outputs/PoisNulDat432x32EEMC2vsNullModel_Strt1.00_viaFits.param'

ImgNul4 <- read.table(infileImgNul4, header = TRUE, sep = "", quote = "\"'",
           na.strings = "NA", colClasses = NA, nrows = -1,
           skip = 0, check.names = TRUE,
           comment.char = "#",
           allowEscapes = FALSE, flush = FALSE,
           encoding = "unknown")

N4Iter <- ImgNul4[[1]]
N4LogProb <- ImgNul4[[2]]
N4ProbStep <- ImgNul4[[3]]
N4SpinRow <- ImgNul4[[4]]
N4SpinCol <- ImgNul4[[5]]
N4Hyp0 <- ImgNul4[[6]]
N4Hyp1 <- ImgNul4[[7]]
N4Hyp2 <- ImgNul4[[8]]
N4Hyp3 <- ImgNul4[[9]]
N4Hyp4 <- ImgNul4[[10]]
N4ExpMSCnts <- ImgNul4[[11]]
N4BkgPrefactor <- ImgNul4[[12]]


infileImgNul5 = '../outputs/PoisNulDat532x32EEMC2vsNullModel_Strt0.01_viaFits.param'

ImgNul5 <- read.table(infileImgNul5, header = TRUE, sep = "", quote = "\"'",
           na.strings = "NA", colClasses = NA, nrows = -1,
           skip = 0, check.names = TRUE,
           comment.char = "#",
           allowEscapes = FALSE, flush = FALSE,
           encoding = "unknown")

N5Iter <- ImgNul5[[1]]
N5LogProb <- ImgNul5[[2]]
N5ProbStep <- ImgNul5[[3]]
N5SpinRow <- ImgNul5[[4]]
N5SpinCol <- ImgNul5[[5]]
N5Hyp0 <- ImgNul5[[6]]
N5Hyp1 <- ImgNul5[[7]]
N5Hyp2 <- ImgNul5[[8]]
N5Hyp3 <- ImgNul5[[9]]
N5Hyp4 <- ImgNul5[[10]]
N5ExpMSCnts <- ImgNul5[[11]]
N5BkgPrefactor <- ImgNul5[[12]]


xrangeImg <- numeric(2)
yrangeImg <- numeric(2)
xrangeImg[1] = 0.
xrangeImg[2] = 0.4
yrangeImg[1] = 0.
yrangeImg[2] = 0.4


rangeLog10MSCnts <- numeric(2)
raBkgPrefactor <- numeric(2)
rangeLog10MSCnts[1] = 2.2
rangeLog10MSCnts[2] = 3.4

## No Background for this one:
#rangeLog10BkgScale <- numeric(2)
#rangeLog10BkgScale[1] = 0.38
#rangeLog10BkgScale[2] = 0.42

rangeLog10Prob <- numeric(2)
rangeLog10Prob[1] = -800.
rangeLog10Prob[2] = -600.

## Each trace or 'time-series' (statistics jargon) plot
## 

## Next File: NOTICE THIS ONE IS OVER-PLOTTED:# 

png("Img02NullLogProbTimeTrace_0to5.png", height=320, width=320, units="px" )

log10euler = log10(exp(1.000000000000))

plot(N0Iter,(N0LogProb*log10euler),type="o",
xlab='Iteration Number',
ylab=' Log10 Post Prob',
ylim=rangeLog10Prob,
pch='.',col="yellow",
cex.main=1.4,cex.lab=1.4)
lines(N1Iter,(N1LogProb*log10euler),col="orange")
lines(N2Iter,(N2LogProb*log10euler),col="green")
lines(N3Iter,(N3LogProb*log10euler),col="purple")
lines(N4Iter,(N4LogProb*log10euler),col="red")
lines(N5Iter,(N5LogProb*log10euler),col="magenta")

dev.off()

## Next File:
##

png("Img02NullHyp0TimeTrace_0to5.png", height=320, width=320, units="px" )

plot(N0Iter,N0Hyp0,type="o",
xlab='Iteration Number',
ylab='Smoothing Hyper-Param 0',
pch='.',col="yellow",
cex.main=1.4,cex.lab=1.4)
lines(N1Iter,N1Hyp0,col="orange")
lines(N2Iter,N2Hyp0,col="green")
lines(N3Iter,N3Hyp0,col="purple")
lines(N4Iter,N4Hyp0,col="red")
lines(N5Iter,N5Hyp0,col="magenta")


dev.off()

## Next File:
##

png("Img02NullHyp1TimeTrace_0to5.png", height=320, width=320, units="px" )

plot(N0Iter,N0Hyp1,type="o",
xlab='Iteration Number',
ylab='Smoothing Hyper-Param 1',
pch='.',col="yellow",
cex.main=1.4,cex.lab=1.4)
lines(N1Iter,N1Hyp1,col="orange")
lines(N2Iter,N2Hyp1,col="green")
lines(N3Iter,N3Hyp1,col="purple")
lines(N4Iter,N4Hyp1,col="red")
lines(N5Iter,N5Hyp1,col="magenta")


dev.off()

## Next File:
##

png("Img02NullHyp2TimeTrace_0to5.png", height=320, width=320, units="px" )

plot(N0Iter,N0Hyp2,type="o",
xlab='Iteration Number',
ylab='Smoothing Hyper-Param 2',
pch='.',col="yellow",
cex.main=1.4,cex.lab=1.4)
lines(N1Iter,N1Hyp2,col="orange")
lines(N2Iter,N2Hyp2,col="green")
lines(N3Iter,N3Hyp2,col="purple")
lines(N4Iter,N4Hyp2,col="red")
lines(N5Iter,N5Hyp2,col="magenta")


dev.off()

## Next File:
##

png("Img02NullHyp3TimeTrace_0to5.png", height=320, width=320, units="px" )


plot(N0Iter,N0Hyp3,type="o",
xlab='Iteration Number',
ylab='Smoothing Hyper-Param 3',
pch='.',col="yellow",
cex.main=1.4,cex.lab=1.4)
lines(N1Iter,N1Hyp3,col="orange")
lines(N2Iter,N2Hyp3,col="green")
lines(N3Iter,N3Hyp3,col="purple")
lines(N4Iter,N4Hyp3,col="red")
lines(N5Iter,N5Hyp3,col="magenta")

dev.off()


## Next File:
##

png("Img02NullHyp4TimeTrace_0to5.png", height=320, width=320, units="px" )

plot(N0Iter,N0Hyp4,type="o",
xlab='Iteration Number',
ylab='Smoothing Hyper-Param 4',
pch='.',col="yellow",
cex.main=1.4,cex.lab=1.4)
lines(N1Iter,N1Hyp4,col="orange")
lines(N2Iter,N2Hyp4,col="green")
lines(N3Iter,N3Hyp4,col="purple")
lines(N4Iter,N4Hyp4,col="red")
lines(N5Iter,N5Hyp4,col="magenta")

dev.off()


## Next File:
##

png("Img02NullMSCntsTimeTrace_0to5.png", height=320, width=320, units="px" )

plot(N0Iter,log10(N0ExpMSCnts),type="o",
xlab='Iteration Number',
ylab='Log10(Expected MS Counts)',
main='Data (.)',
pch='.',col="yellow",
cex.main=1.4,cex.lab=1.4)
lines(N1Iter,log10(N1ExpMSCnts),col="orange")
lines(N2Iter,log10(N2ExpMSCnts),col="green")
lines(N3Iter,log10(N3ExpMSCnts),col="purple")
lines(N4Iter,log10(N4ExpMSCnts),col="red")
lines(N5Iter,log10(N5ExpMSCnts),col="magenta")
dev.off()


## Next File:
##

png("Img02NullBkgPrefactorTimeTrace_0to5.png", height=320, width=320, units="px" )

plot(log10(I1BkgPrefactor),type="o",
xlab='Iteration Number',
ylab='Log10(Background Pre-Factor)',
main='Data (.)',
pch='.',col="yellow",
cex.main=1.4,cex.lab=1.4)
lines(log10(I2BkgPrefactor),col="black")
lines(N1Iter,log10(N1BkgPrefactor),col="orange")
lines(N2Iter,log10(N2BkgPrefactor),col="green")
lines(N3Iter,log10(N3BkgPrefactor),col="purple")
lines(N4Iter,log10(N4BkgPrefactor),col="red")
lines(N5Iter,log10(N5BkgPrefactor),col="magenta")
dev.off()
