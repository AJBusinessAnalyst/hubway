getwd()
# [1] "/Users/alejandro/Desktop/My Studies/Practice 1"
read.csv("hubway_trips.csv")
ht <- read.csv("hubway_trips.csv")
head(ht)
summary(ht)
plot(ht$Female)
require(pacman)
plot(ht$"zip_code", ht$"Female")
# plot(dnorm, -5, +5,
# col = "#cc0000",
# lwd = 5,
# main = "Standard Normal Distribution",
# xlab = "z-scores",
# ylab = "Density")
plot(xlab = "female", ylab = "duration")
plot(ht$zip_code)
plot(ht$zip_code, ht$Male)
attributes(ht)
head(ht)
duplicated(ht)
summary(ht)
colnames(ht)
stations <- read.csv("hubway_stations.csv")
trips <- read.csv("hubway_trips.csv")
# 1. Column names
head(stations)
colnames(stations)
# id terminal station municipal      lat lng   status

# 2. How many stations are there? 
tail(stations)
# 137
length(unique(stations$station))
duplicated(stations$station)

# 3. Look at the summary of this data frame with Hubway station information.
# Some of these bike stations don't exist anymore; 
# create a data frame with only those that still exist. How many are left?
summary(stations)
read.csv("hubway_stations.csv")
stations <- ("hubway_stations.csv")
summary(stations)
head(stations)
# subsetting into a dataframe: [rows, columns]
# indexing  stations_e <- stations[stations$status == "Existing",]
stations_e <- stations[stations$status == "Existing",]
stations_e <- stations[stations$status == "Existing",]
summary(stations)
#ht <- read.csv("hubway_trips.csv")
stations <- read.csv("hubway_trips.csv")
summary(stations)
length(unique(stations$station))
p_unload(all)
# detach("package:datasets, unload = TRUE)
detach(package:datasets,unload = TRUE)
read.csv("hubway_stations.csv")
stations <-read.csv("hubway_stations.csv")
stations_e <- stations[stations$status == "Existing",]
