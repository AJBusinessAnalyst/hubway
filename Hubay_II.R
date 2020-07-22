
############    R – Hubway Lab – Part II


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

# 5. What is the name of the starting station with the longest average trip duration? Station #14, HMS / HSPH - Ave. Louis Pasteur at Longwood Ave.
#Hint: tapply or aggregate
most_used

station_duration <- aggregate(trips$duration, by = list(trips$strt_statn), FUN = mean)

station_duration[which.max(station_duration$x),1]

stations = subset(stations, id == "14")
stations


#another way : filename$ column which u want the name from [filename$columnwith the station id ==“14”]

stations$station[stations$id == '14']



#6. What is the name of the starting station with the shortest average trip duration? station 67, MIT at Mass Ave / Amherst St

station_duration <- aggregate(trips$duration, by = list(trips$strt_statn), FUN = mean)
station_duration[which.min(station_duration$x),1]


stations = subset(stations, id == "67")
stations

stations$station[stations$id == "67"]


#7. What is the name of the ending station with the longest and shortest average trip duration?


endstation_duration <- aggregate(start_end$duration,by = list(start_end$end_statn), FUN =mean)
endstation_duration[which.max(endstation_duration$x),1]
stations$station[stations$id == '63']

endstation_duration[which.min(endstation_duration$x),1]
stations$station[stations$id == '67']

#ending station with the longest =  Station 63, "Dorchester Ave. at Gillette Park"
#ending station with the shortest = Station 67, "MIT at Mass Ave / Amherst St"

# Complete the rest of the lab on your own, and turn it in Tuesday as your homework.

# 8. Which user zipcode is associated most frequently with 
#     trips ending at the station with the longest average trip duration? zip# = 02120 

## longest average duration: Station 63, "Dorchester Ave. at Gillette Park"

zip <- subset (start_end, end_statn == "63")
zip 

zip$zip_code[which.max(zip$duration)]


# 9. Create a table showing the number of trips by gender. Plot this table using barplot.
#     The argument for barplot is the table itself.
#       What percent of total trips were completed by males?


gender_table <- table(start_end$gender)
barplot(gender_table)
(gender_table)

total <-sum(gender_table$Percen)



# 10. Use hist with the vector for trip duration as the only argument to 
##   plot the histogram of trip durations. What do you notice?

hist(start_end$duration)

### Most of the trips took between 0 to 8677196 seconds.

# 11. Use hist with the vector for trip duration, 
#   considering only trips less than an hour to plot the histogram of 
##  trip duration under an hour.


hist(start_end$duration)

under_hour <- subset(start_end,duration<3600)
hist(under_hour$duration, main = "Histogram of Trips Under 1 Hour", xlab = "Time in Seconds")


# 12. Based on what you see in the data (and on any other analysis you want to try), 
###    make some recommendations for the following groups:



# The Hubway/Bluebike team: 
### # In order to avoid accidents, I'd say that the bikes found at Station 14 should be given maintenance on regular bases for it is the ending station and, 
###   apparently, it has a lot of bikes that have been ridden for log periods. 

# The MBTA (Boston’s public transportation authority)
#### Station #14, HMS / HSPH - Ave. Louis Pasteur at Longwood Ave and station 67, MIT at Mass Ave / Amherst St
###  Should be equipped with enough bike parks and space for pedestrians because these two stations appear to be quite busy places. 

# The Boston Public Health Commission
#### Station #14, HMS / HSPH - Ave. Louis Pasteur at Longwood Ave and station 67, MIT at Mass Ave / Amherst St
###  Should be monitored often and areas should be sanitized for there seams to be a big amount of bike users.

# A real estate developer looking to build a new apartment building
#### In case the real estate project is aimed to young and active people, building around Station #14, HMS / HSPH - Ave. Louis Pasteur at Longwood Ave and station 67, MIT at Mass Ave / Amherst St
###  might be appealing to those commuting by bicycle, on the other hand, if the project is focused on people looking for a quiet area, 
###  the stations above mentioned should be avoided.  

# Someone who lives near the Museum of Fine Arts (465 Huntington Avenue, Boston MA) 
## who just learned to ride a bike and wants to ride more frequently
### Make sure you use proper gear like helmet and knee pads, avoid riding on the street,
### Parks are safer places. 

# Think: what questions would this person or organization have about this data? 
# And what analysis can you do to give them insights about those questions? 
# These answers can just be typed out, no need for visualizations or slide decks yet.

