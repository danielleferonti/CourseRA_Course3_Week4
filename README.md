# CourseRA_Course3_Week4
CourseRA Programming Assignment
Code designed to merge multiple data sets w/o headers, and create a single tiday data set with clearly descriptive headers
##reading data: this section is where we merge the two data sets (each has 3 pieces) into 3 data sets (subject, activity, feature).  We also assign column names to the data, though these column names are not descriptive and will later be updated.
##mean & SD: we will filter the columns to only show those with "Mean" or "STD" in the title (not case sensitive) and then append the "Activity" and "Subject" columns to this filtered data.
## descriptive activities: we take the data filtered in the prior step and will update the headers so they are a) shorter in length adn b) more descriptive of what the data in the columns contains
## summarize & make 2nd data set:  in this section we will summarize the data we've been working on and write it to a Text format.  We also include a final read.table function to read the table w/ headers back into R.
