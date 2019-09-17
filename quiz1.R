##Download and assign csv file
fileUrlcsv<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrlcsv,'housingIdaho.csv')
filedata<-read.csv("./housingIdaho.csv")

##Download pdf file
fileurlcodeBook<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf"
download.file(fileurlcodeBook,'codeBook.pdf',mode = "wb")

##propmil=gives properties worth more than million dollar
valmil<-subset(filedata,VAL>23)
propmil<-length(valmil$VAL)

fileUrlxlsx<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrlxlsx,"NaturalGas.xlsx",mode = "wb")
wb <- loadWorkbook("NaturalGas.xlsx")
dat <- readWorksheet(wb, sheet = 1, startRow = 17, startCol = 7,
                     endRow = 23, endCol = 15,header = TRUE,forceConversion = TRUE)
names(dat)<-dat[1,]
dat<-dat[-1,]
dat$Zip<-as.numeric(dat$Zip)
dat$Ext<-as.numeric(dat$Ext)
sum(dat$Zip*dat$Ext,na.rm=T)

