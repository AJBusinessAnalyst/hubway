# hubway
Alejandro Jimenez
getwd()
setwd("Desktop/My Studies/Labs")
getwd()
setwd("My Studies/Labs")

trips <- read.csv("hubway_trips.csv")
trips
stations <- read.csv("hubway_stations.csv")
stations

# 1 Number of rows 350,615 and columns = 13
# ncol(x) ## nrow(x)
ncol(trips)
nrow(trips)

# 2 How many unique user zip codes are in this dataset?
#  375
# length(unique(stations$station))
length(trips$zip_code)
length(unique(trips$zip_code))

# 3 How many unique user bicycles are in this dataset?
# 882
length(trips$bike_nr)
length(unique(trips$bike_nr))
stations_existing <- stations[stations$status == "Existing",]
# 4. Calculate the count of rides for each unique bicycle.
table(trips$bike_nr)

bike_rides <- table(trips$bike_nr)
bike_rides <- as.data.frame(bike_rides)
# 5. Which bicycle is ridden most frequently?


max(bike_rides$Freq)

# bike_rides <- as.data.frame(table(trips$bike_rides))

max(bike_rides$Freq)
bike_rides[which.max(bike_rides$Freq),1]
bike_rides[which.max(bike_rides$Freq),1] #B00401

                          
# 6. Which bicycle is ridden least frequently? T01093
min(bike_rides$Freq)
bike_rides[which.min(bike_rides$Freq),1]
trips <- read.csv("hubway_trips.csv")

# 7. Calculate the total duration of all rides for each bicycle. Hint: tapply() or aggregate()

total_duration <- aggregate(trips$duration, by = list(trips$bike_nr), FUN = sum)

total_duration <- aggregate(trips$duration, by = list(trips$bike_nr), FUN = sum)
?aggregate

# 8. Which bicycle has been ridden for the longest total duration in this dataset? Shortest total duration?


bike_duration[which.max(bike_duration$x),1] 
# longest total duration = B00585

bike_duration[which.min(bike_duration$x),1] 
# longest total duration = T01380


sort(trips$duration)

min(trips[,4])
# 0


  
# 9. Consider only trips on the bicycle that has been ridden for the longest duration, 
max_tripsby <- subset(trips, bike_nr == "B00585")
maxtrips_table <- table(max_tripsby$end_statn)
which.max (maxtrips_table)

min_tripsby <- subset(trips, bike_nr == "B00585")
mintrips_table <- table(min_tripsby$end_statn)
which.max (mintrips_table)


end <- table(trips$end_statn)

# which station is its most frequent end station? 
# Which station is its most frequent start station? 
# Return the station ids.

# bicycle that has been ridden for the longest duration = bike_nr B00585
max(trips[,4])

sort(trips$bike_nr)

ranks <- order(trips$duration)
ranks
trips$duration

trips[order(trips$duration, decreasing = TRUE),]

trips[order(trips$duration, trips$bike_nr, decreasing = TRUE),]

trips[, c(4, 6, 8, 9)]
# create a sample data to subset columns 4, 6,8,9.
longest_trips <- trips[, c(4, 6, 8, 9)]

longest_trips
# organize data from longest duration to shortest. 
longest_trips[order(longest_trips$duration, longest_trips$strt_statn, longest_trips$end_statn, longest_trips$bike_nr, decreasing = TRUE),]

#bike ridden for the longest duration = bike_nr B00585,  duration = 8677196

# which station is its most frequent end station? = 22
which.max
ranks <- order(longest_trips$end_statn)
longest_trips[order(longest_trips$end_statn,decreasing = TRUE),]


# Which station is its most frequent start station? = 22
longest_trips[order(longest_trips$strt_statn,decreasing = TRUE),]

# 10. Look up the name of the above station ids in the stations data frame. 
#What are the names of the most frequent start and end stations for this bicycle?
stations <- read.csv('hubway_stations.csv')
stations = subset(stations, id == "22")
stations
stations = subset(stations, id == "22")
stations



# most frequent start station = South Station - 700 Atlantic Ave.


read.csv('hubway_stations.csv')
stations <- read.csv('hubway_stations.csv')
stations = subset(stations, id == "22")
stations
# Most Frequent end station = South Station - 700 Atlantic Ave.

# A. Merge the trip and station data



# 1. Use merge (twice) to append the appropriate station names to the trips data frame.

#merged_date <- merge(trips, stations,by.x = "id", by.y = "column_name)

merged_data <- merge(trips, stations_existing, by.x = "strt_statn", by.y = "id" )
merged_data
start_end <- merge(merged_data, stations_existing, by.x = "end_statn", by.y = "id" )
start_end
summary(start_end)

# Add a column for the starting station and the ending station. See ?merge.
summary(start_end)

#Look at the summary of this new data frame. Are all of the stations "existing"? Why is that? Did you merge using your hubway station data frame with only existing stations? Or the data frame with all stations?  Remove all trips to or from a "removed" station if necessary.



#2. Use names() or colnames() to clean up the column names in the merged data frame.
# to rename only oone column = colnames(start_end) [colnames(start_end) == ]
 head(start_end)

colnames(start_end) [colnames(start_end) == "end_statn"] <- "end_station"
head(start_end)

#3. Which station is most frequently used as a starting station? = Station 22


most_used <- table(start_end$strt_statn)
which.max (most_used)
  
  
#4. Which station is most frequently used as an ending station? Station 22
  
most_used_end <- table(start_end$end_station)
which.max (most_used_end)

# 5. What is the name of the starting station with the longest average trip duration? 
#Hint: tapply or aggregate
most_used
# total_duration <- aggregate(trips$duration, by = list(trips$bike_nr), FUN = sum)
# test 1
station_longduration <- aggregate(merged_data$duration, by = list(merged_data$strt_statn), FUN = sum)
summary(station_longduration)
