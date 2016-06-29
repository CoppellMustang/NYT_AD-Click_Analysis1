#fileLocation <- "http://stat.columbia.edu/~rachel/datasets/nyt1.csv"
data1 <- read.csv(url(fileLocation))
View(data1)
data1 <- read.csv("Analysis/Data/nyt1.csv",blank.lines.skip=TRUE,colClasses="character")

#-------------Start------------------------
data1 <- read.csv("Analysis/Data/nyt1.csv",blank.lines.skip=TRUE)
head(data1)
str(data1)



summary(data1)

# distribution of the Age column
hist(data1$Age, main="", xlab="Age")

range(data1$Age)


# distribution of the Impressions column
hist(data1$Impressions, main="", xlab="# of Impressions")

range(data1$Impressions)

# distribution of the Clicks column
hist(data1$Clicks, main="", xlab="# of Clicks")

range(data1$Clicks)

data1$Age_Group <- cut(data1$Age, c(-Inf, 18, 24, 34, 44, 54, 64, Inf))

levels(data1$Age_Group) <- c("<18", "18-24", "25-34", "35-44", "45-54", "55-64", "65+")
# Name the levels of 'Age_Group' for readability

d1 <- subset(data1, Impressions>0)

d1$CTR <- d1$Clicks/d1$Impressions
 
head(d1)


library(ggplot2) # used for visualizations
ggplot(subset(d1, Impressions>0), aes(x=Impressions, fill=Age_Group))+
  geom_histogram(binwidth=1)

ggplot(subset(d1, CTR>0), aes(x=CTR, fill=Age_Group))+
  labs(title="Click-through rate by age group (05/01/2012)")+
  geom_histogram(binwidth=.025)