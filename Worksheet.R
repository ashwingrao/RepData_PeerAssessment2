setwd("~/Documents/DropBox-AGR/Dropbox/Git/coursera//Reproducible/RepData_PeerAssessment2/")
rm(list=ls())

download.file(url = "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2",destfile = "StormData.bzip2", method = "curl", mode = "wb")
# install.packages("R.utils")
bunzip2("StormData.bzip2")
dt <- read.table("StormData.bzip2",na.strings = "", sep = ",", header = TRUE)
# dt <- read.table(bzfile("StormData.bzip2","r"))
dtProcessed <- dt
#dtProcessed$EVTYPE <- sapply(X= dtProcessed$EVTYPE, FUN=tolower)
#dtProcessed$EVTYPE <- sapply(X= dtProcessed$EVTYPE, FUN=toString)

# From http://www.ncdc.noaa.gov/stormevents/ftp.jsp
eventsRead <- readLines("event.csv", n=1)
events <- strsplit(x = eventsRead, split = ",")

events <- sapply(X = events,FUN = tolower)
events

#EVTYPE.str <- unique(dtProcessed$EVTYPE)


#non.standard.EVTYPE.factor <- EVTYPE.factor[which(!EVTYPE.str %in% events)]





#dt$EVTYPE <- sapply(X= dt$EVTYPE, FUN=toString)



dtProcessed <- dt

origEVTYPE <- unique(factor(dtProcessed$EVTYPE))
origEVTYPE <- sapply(X = origEVTYPE,FUN = tolower)
origEVTYPE.unresolved <- origEVTYPE[!origEVTYPE %in% events]
dtProcessed[grep("*wind*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "thunderstorm wind"
dtProcessed[grep("*storm surge*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "thunderstorm wind"
dtProcessed[grep("*freez*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "ice storm"
dtProcessed[grep("*hail*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "ice storm"
dtProcessed[grep("*ice*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "ice storm"
dtProcessed[grep("*frost*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "ice storm"

dtProcessed[grep("*glaze*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "ice storm"
dtProcessed[grep("*coastal*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "marine strong wind"
dtProcessed[grep("*snow*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "heavy snow"
dtProcessed[grep("summary*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "summary"
#dtProcessed[grep("*hurricane*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "hurricane (typhoon)"
#dtProcessed[grep("*cold*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "frost/freeze"
dtProcessed[grep("*flash flooding*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "flash flood"
dtProcessed[grep("*lightning*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "lightning"
dtProcessed[grep("*ligntning*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "lightning"
dtProcessed[grep("*lighting*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "lightning"
#dtProcessed[grep("*cloud*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "funnel cloud"
dtProcessed[grep("*spout*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "funnel cloud"
#dtProcessed[grep("*microburst*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "heavy rain"
dtProcessed[grep("*mudslide*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "avalanche"
dtProcessed[grep("*mud slide*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "avalanche"
dtProcessed[grep("*mud*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "avalanche"
dtProcessed[grep("*landslide*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "avalanche"


dtProcessed[grep("*avalance*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "avalanche"

dtProcessed[grep("*fog*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "dense fog"


dtProcessed[grep("*tornado*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "tornado"
dtProcessed[grep("*gustnado*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "tornado"

dtProcessed[grep("*rains*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "heavy rain"
dtProcessed[grep("*downburst*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "heavy rain"
dtProcessed[grep("*wet*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "heavy rain"
dtProcessed[grep("*precipitation*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "heavy rain"
dtProcessed[grep("*dry*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "drought"
dtProcessed[grep("*funnel*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "tornado"
dtProcessed[grep("*torndao*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "tornado"
#dtProcessed[grep("*beach*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "coastal flood"

dtProcessed[grep("*thunder*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "thunderstorm wind"
dtProcessed[grep("*blizzard*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "blizzard"
dtProcessed[grep("*flood*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "flood"
dtProcessed[grep("*high*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "heat"
dtProcessed[grep("*heat*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "heat"
dtProcessed[grep("*hot*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "heat"
dtProcessed[grep("*excessive*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "heat"

dtProcessed[grep("*warm*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "heat"
dtProcessed[grep("*record*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "heat"
#dtProcessed[grep("*cold*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "extreme cold/wind chill"
dtProcessed[grep("*low*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "extreme cold/wind chill"
dtProcessed[grep("*fire*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "wildfire"
dtProcessed[grep("*turbulence*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "tornado"
dtProcessed[grep("*marine*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "marine thunderstorm wind"
dtProcessed[grep("*urban*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "misc"
dtProcessed[grep("*apache*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "misc"
dtProcessed[grep("*other*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "misc"
#dtProcessed[grep("*?*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "misc"

dtProcessed[grep("*rip*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "rip current"
#dtProcessed[grep("*dam*", tolower(dtProcessed$EVTYPE)),]$EVTYPE <- "flash flood"

# aggdata <- aggregate(dtProcessed, by=list(dtProcessed$EVTYPE, dtProcessed$BGN_DATE), FUN=sum, na.rm=TRUE)
## Population Health: Injuries & Fatalities
aggdata.injuries <- aggregate(INJURIES ~ EVTYPE, dtProcessed, sum,  na.rm=TRUE)
aggdata.injuries.sorted <- head(aggdata.injuries[order(-aggdata.injuries$INJURIES),],10)

library(ggplot2)
ggplot(data = aggdata.injuries.sorted, aes(x=EVTYPE, y=INJURIES, fill=EVTYPE)) + geom_bar(stat="identity")


## Fatalities
aggdata.fatalities <- aggregate(FATALITIES ~ EVTYPE, dtProcessed, sum,  na.rm=TRUE)
aggdata.fatalities.sorted <- head(aggdata.fatalities[order(-aggdata.fatalities$FATALITIES),],10)

library(ggplot2)
ggplot(data = aggdata.fatalities.sorted, aes(x=EVTYPE, y=FATALITIES, fill=EVTYPE)) + geom_bar(stat="identity")

## PROPDMG
aggdata.PROPDMG <- aggregate(PROPDMG ~ EVTYPE, dtProcessed, sum,  na.rm=TRUE)
aggdata.PROPDMG.sorted <- head(aggdata.PROPDMG[order(-aggdata.PROPDMG$PROPDMG),],10)

library(ggplot2)
ggplot(data = aggdata.PROPDMG.sorted, aes(x=EVTYPE, y=PROPDMG, fill=EVTYPE)) + geom_bar(stat="identity")


## CROPDMG
aggdata.CROPDMG <- aggregate(CROPDMG ~ EVTYPE, dtProcessed, sum,  na.rm=TRUE)
aggdata.CROPDMG.sorted <- head(aggdata.CROPDMG[order(-aggdata.CROPDMG$CROPDMG),],10)

library(ggplot2)
ggplot(data = aggdata.CROPDMG.sorted, aes(x=EVTYPE, y=CROPDMG, fill=EVTYPE)) + geom_bar(stat="identity")


summary(dt)
str(dt)



