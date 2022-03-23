# Load libraries
library(ggplot2)
library("PMCMRplus") 

# set working directory
setwd("~/Documents/Git/disease_exposure_simulations/Exposure_data_and_analysis/Scenario2")


# read in data 
base_dataset = read.csv("baseScenario2_output.txt", header = TRUE , nrows = 1000 )

base_dataset$Scenario <- gsub("base", "Control", base_dataset$Scenario)

base_vaccinated = read.csv("baseScenario2_vaccinated_output.txt", header = TRUE , nrows = 1000)

base_vaccinated$Scenario <- gsub("base/Vaccinated", "Vaccinated", base_vaccinated$Scenario)

clothMask = read.csv("clothMaskScenario2_output.txt", header = TRUE, nrows = 1000)

clothMask_vaccinated = read.csv("clothMaskScenario2_vaccinated_output.txt", header = TRUE, nrows = 1000)

n95 = read.csv("n95Scenario2_output.txt", header = TRUE, nrows = 1000)

n95_vaccinated = read.csv("n95Scenario2_vaccinated_output.txt", header = TRUE, nrows = 1000)



# combine all data into data frame
mydf <- data.frame(Number_Exposed=c(base_dataset$Exposed, base_vaccinated$Exposed,
                                    clothMask$Exposed, clothMask_vaccinated$Exposed, 
                                    n95$Exposed, n95_vaccinated$Exposed),
                   
                   Health_Measures=c(base_dataset$Scenario, base_vaccinated$Scenario,
                                     clothMask$Scenario, clothMask_vaccinated$Scenario,
                                     n95$Scenario, n95_vaccinated$Scenario))



mydf <- data.frame(Number_Exposed=c(base_dataset$Exposed, base_vaccinated$Exposed, clothMask$Exposed, clothMask_vaccinated$Exposed, n95$Exposed, n95_vaccinated$Exposed), Health_Measures=c(base_dataset$Scenario, base_vaccinated$Scenario, clothMask$Scenario,clothMask_vaccinated$Scenario, n95$Scenario, n95_vaccinated$Scenario))


# set order so graph labeled correctly
mydf$Health_Measures <- factor(mydf$Health_Measures , levels=c("Control", "Vaccinated", "ClothMask", "ClothMask/Vaccinated", "N95", "N95/Vaccinated"))
# set graph colours
myColours = c("cyan1", "darkblue", "lightpink", "lightpink3", "chartreuse", "chartreuse4")

# plot graph
boxplot(Number_Exposed~Health_Measures, data = mydf, main = "Scenario 2", xlab = "Public Health Measure(s)", ylab = "Number of exposed agents", col = myColours, par(cex.axis=1.5), par(cex.lab=1.5), cex.main=1.5)


# plot graph to same scale as scenario 1 for comparison
boxplot(Number_Exposed~Health_Measures, data = mydf, main = "Scenario 2", xlab = "Public Health Measure(s)", ylab = "Number of exposed agents", col = myColours, ylim = c(0,60), par(cex.axis=1.1), par(cex.lab=1.5), cex.main=1.5)



####### Statistical Analysis #######

# Method:  HAWORTH M. B.: Biomechanical Locomotion Heterogeneity in Synthetic Crowds. PhD thesis, York University, November 2019.
# results considered significant when all tests have p < 0.01


my_data <- mydf
Y <- my_data[,1] # y is actual data infected data
g <- as.factor(my_data[,2]) #group label  (separates a tab)
k1 <- kruskal.test( Y, g ) 
print (k1) 
# Post-hoc tests are conducted only if omnimus Kruskal-Wallis test p-value is 0.05 or less. 
if ( k1$p.value < 0.05 ) { 
  c1 <- kwAllPairsConoverTest(Y, g, p.adjust.method="holm") 
  c2 <- kwAllPairsConoverTest(Y, g, p.adjust.method="fdr") 
  c3 <- kwAllPairsConoverTest(Y, g, p.adjust.method="none") 
  d1 <- kwAllPairsDunnTest(Y, g, p.adjust.method="holm") 
  d2 <- kwAllPairsDunnTest(Y, g, p.adjust.method="fdr") 
  d3 <- kwAllPairsDunnTest(Y, g, p.adjust.method="none") 
  n1 <- kwAllPairsNemenyiTest(Y, g, dist="Tukey") 
  n2 <- kwAllPairsNemenyiTest(Y, g, dist="Chisquare") 
} 
c1; c2; c3; d1; d2; d3; n1; n2 
# alternate representation of post-hoc test results 
summary(c1); summary(c2); summary(c3); summary(d1); summary(d2); summary(d3); summary(n1); summary(n2)