# LSE Data Analytics Online Career Accelerator
# DA301: Advanced Analytics for Organisational Impact

# Week 4: Getting started with using R to visualise data

###############################################################################

# The focus this week will be on wrangling, analysing, and visualising data
# using the popular programming language R. Due to its unmatched packages for
# data exploration and experimentation, R is favoured by statisticians,
# academics, and data analysts. R can be leveraged as a statistical and
# analytical tool without needing to have in-depth programming skills. 
# R's packages are also ideal for visualising data in beautiful, interactive,
# and accessible plots and charts. See for example the following visualisation 
# that was built in R. 

# This is your R script. Use it to follow along with the demonstrations, 
# to test ideas, and to explore what is possible. The hands-on experience of
# writing your own code will accelarate your learning!

# 4.1.8 Basics in R -------------------------------------------------------------

# Practical activity: Creating and querying a data frame

###############################################################################
# This is the solution to the practical activity

# We have spent some time exploring the basic data types and structures of R. 
# First, we identified data types in R, including numeric, integer, character, 
# complex, logical, and raw. Second, we explored some of R's data structures, 
# starting with vectors and then moving to lists, matrices, and data frames. 
# In this practical activity, you will create your own lists and data frames
# in R, and then use functions on these data structures to help answer business
# questions.

# Your objective is to create a data frame in R containing the information that
# Tini provided, and then use functions to extract data from the table.

###############################################################################

# 1. Open RStudio and create a new R script.

##############################################################################

# 2. Create a data frame containing the customer info from the table

# Create a vector/list representing each column.
Name <- c('Donna', 'Anthea', 'Yusuf', 'Bongile', 'Abe', 'Quentin',
          'Tracy', 'Bilal', 'Victoria', 'Indira')

Last_Name <- c('Watusi', 'Smits', 'Zayeed', 'Maleson', 'Dawidowitz',
               'Ng', 'Jacks', 'Ghani', 'LeGrande', 'De Silva')

Gender <- c('F', 'F', 'M', 'F', 'M', 'N', 'F', 'M', 'F', 'F')

Age <- c(38, 29, 44, 24, 66, 34, 55, 40, 38, 29)

Email <- c('donnaw@gotmail.co.uk', 'as@workmail.co.nz', 'yusufzz@glammail.com',
           'bongi1@workmail.co.uk', 'papabe@oldmail.com', 'qng7@mailio.com',
           'tracy@blurredv.co.uk', 'bghani2@mailio.com', 'beachh@glammail.com',
           'indigirl@workmail.com')

Purchases <- c(24, 16, 28, 33, 21, 30, 28, 21, 22, 32)


# Combine vectors into a data frame.
book_df <- data.frame(Name, Last_Name, Gender, Age, Email, Purchases)

# Print data frame.
book_df

View(book_df)

###############################################################################

# 3. Check the data type of your data frame

# Determine the typeof() of the data frame.
typeof(book_df)

# Determine the class() of the data frame.
class(book_df)

# Check the dimensions of the data frame.
dim(book_df)

###############################################################################

# 4. Change the column names to all caps

# Specify the columns as names and the data frame.
names(book_df) <- c('NAME', 'LAST NAME', 'GENDER', 'AGE',
                    'EMAIL', 'PURCHASES')

# Print the data frame.
book_df

###############################################################################

# 5. Add a column to the data frame containing the customer IDs

# Here an operator was used to create a sequence of numbers. 
ID <- c(2101:2110) 

# add the new column to the current data frame.
book_df$ID <- ID

# Print data frame.
book_df

# Return the structure of the data frame.
str(book_df)

###############################################################################

# 6. Subset the data frame

# Extract only female customers.
subset(book_df, Gender=='F')

# Extract all customers over the age of 50.
subset(book_df, AGE>50)

# Extract all customers with less than 20 purchases in 2021.
subset(book_df, PURCHASES<20)

###############################################################################

# 7. Save your R script


# 4.2.3 Importing/Exporting data in R ------------------------------------------

# 1. Prepare your workstation.

# Determine your working directory
getwd()

# Change your current directory.
setwd() 


###############################################################################

# 2. Import the data set


# Install the tidyverse library.
install.packages('tidyverse')


# Import the tidyverse library.
library(tidyverse)


# Import a CSV file.
data <- read.csv(file.choose(), header=T)

# Print the data frame.
data

View(data)


# alternative method
# data2 <- read.table(file.choose(), header = TRUE, sep=',')
# data2


# Sense-check the data set
# Return the structure of the data frame.
str(data)

# Check the type of the data frame.
typeof(data)

# Check the class of the data frame.
class(data)

# Check the dimensions of the data frame
dim(data)


###############################################################################

# 3. Export the data set

# Export the data as a CSV file.
write_csv (data, file='bikes_data.csv')


# 4.2.7 Practical activity: Visualise data with qplot -------------------------

# 1. Prepare your workstation

# Import tidyverse library.
library(tidyverse)

# Import the wages data set.
wages <- read.csv(file.choose(), header=T)

# Print the data frame.
wages

# View the data frame.
View(wages)

# Summarise the data set.
summary(wages)


##############################################################################

# 2. Do age, job class, and education level influences job class?

# View the first plot.
qplot(age, jobclass, colour=education, data=wages)

# You could swap axes and add jitter to make this clearer.
qplot(jobclass, age, colour=education, 
      data=wages, geom=c('point', 'jitter'))


# Or you could switch variables around and use a boxplot.
qplot(education, age, colour=jobclass, data=wages,
      geom='boxplot')


##############################################################################

# 3. Any relationship between age, education level, and race?

# View the second plot.
qplot(age, education, colour=race, data=wages, geom='col')

# You could add jitter for more subtlety.
qplot(age, education, colour=race, 
      data=wages, geom=c('point', 'jitter'))


###############################################################################

# 4. Any relationship between education level, wage, and race?


# View the third plot.
qplot(education, wage, shape=race, data=wages, geom='boxplot')

# Here you could change variables around, making wage the x-axis and race the 
# y-axis, and change colour to fill.
qplot(wage, race, colour=education, data=wages, geom='boxplot')


###############################################################################


# 5. Save your R script


