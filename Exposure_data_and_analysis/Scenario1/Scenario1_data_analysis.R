# import libraries 
library(ggplot2)
library(tidyverse)
library(dplyr)
library("PMCMRplus") 

# set working directory
setwd("~/Documents/Git/disease_exposure_simulations/Exposure_data_and_analysis/Scenario1")

# read in data 
base_dataset = read.csv("baseScenario_output.txt", header = TRUE, nrows = 1000 )

base_dataset$Scenario <- gsub("base", "Control", base_dataset$Scenario)



base_vaccinated = read.csv("baseScenario1_vaccinated_output.txt", header = TRUE, nrows = 1000 )

base_vaccinated$Scenario <- gsub("base/Vaccinated", "Vaccinated", base_vaccinated$Scenario)

clothMask_SD = read.csv("clothMask_Social_Distancing_output.txt", header = TRUE, nrows = 1000)



clothMask_SD_vaccinated = read.csv("clothMask_SD_Scenario_vaccinated_output.txt", header = TRUE, nrows = 1000)




clothMask = read.csv("cloth_noSD_Scenario_output.txt", header = TRUE, nrows = 1000)


clothMask_vaccinated = read.csv("cloth_noSD_vaccinated_Scenario_output.txt", header = TRUE, nrows = 1000)

n95_SD = read.csv("n95_SD_output.txt", header = TRUE, nrows = 1000)

n95_SD_vaccinated = read.csv("n95_SD_vaccinated_output.txt", header = TRUE, nrows = 1000)

n95 = read.csv("n95_noSD_Scenario_output.txt", header = TRUE, nrows = 1000)

n95_vaccinated = read.csv("n95_noSD_vaccinated_Scenario_output.txt", header = TRUE, nrows = 1000)

social_distancing = read.csv("socialDistancingScenario_output.txt", header = TRUE, nrows = 1000)

social_distancing_vaccinated = read.csv("socialDistancing_vaccinatedScenario_output.txt", header = TRUE, nrows = 1000)




# create combined data frame

mydf <- data.frame(Number_Exposed=c(base_dataset$Exposed,base_vaccinated$Exposed,clothMask_SD$Exposed, clothMask_SD_vaccinated$Exposed, 
                       clothMask$Exposed, clothMask_vaccinated$Exposed, n95_SD$Exposed,n95_SD_vaccinated$Exposed,
                       n95$Exposed, n95_vaccinated$Exposed, social_distancing$Exposed, social_distancing_vaccinated$Exposed),
                   
                   Health_Measures=c(base_dataset$Scenario,base_vaccinated$Scenario,clothMask_SD$Scenario, clothMask_SD_vaccinated$Scenario, 
                       clothMask$Scenario, clothMask_vaccinated$Scenario, n95_SD$Scenario, n95_SD_vaccinated$Scenario,
                       n95$Scenario, n95_vaccinated$Scenario, social_distancing$Scenario, social_distancing_vaccinated$Scenario))


# split into two for easier visualization 
# second half contains all social distancing variables

first_half_mydf <- data.frame(Number_Exposed=c(base_dataset$Exposed,base_vaccinated$Exposed, 
                                    clothMask$Exposed, clothMask_vaccinated$Exposed, 
                                    n95$Exposed, n95_vaccinated$Exposed),
                   
                   Health_Measures=c(base_dataset$Scenario,base_vaccinated$Scenario, 
                                     clothMask$Scenario, clothMask_vaccinated$Scenario,
                                     n95$Scenario, n95_vaccinated$Scenario))



second_half_mydf <- data.frame(Number_Exposed=c(social_distancing$Exposed, social_distancing_vaccinated$Exposed,
                                                clothMask_SD$Exposed, clothMask_SD_vaccinated$Exposed, 
                                     n95_SD$Exposed,n95_SD_vaccinated$Exposed),
                   
                   Health_Measures=c(social_distancing$Scenario, social_distancing_vaccinated$Scenario,
                                     clothMask_SD$Scenario, clothMask_SD_vaccinated$Scenario, 
                                      n95_SD$Scenario, n95_SD_vaccinated$Scenario))



# set order so graph labeled appropriately 
second_half_mydf$Health_Measures <- factor(second_half_mydf$Health_Measures , levels=c("SD", "SD/Vaccinated", "ClothMask/SD", "ClothMask/SD/Vaccinated", "N95/SD", "N95/SD/Vaccinated"))

first_half_mydf$Health_Measures <- factor(first_half_mydf$Health_Measures , levels=c("Control", "Vaccinated", "ClothMask", "ClothMask/Vaccinated", "N95", "N95/Vaccinated"))

# add graph colours
myColours = c("cyan1", "darkcyan", "lightpink", "lightpink3", "chartreuse", "chartreuse4")



# plot graphs 
boxplot(Number_Exposed~Health_Measures, data = first_half_mydf, main = "Scenario 1", xlab = "Public Health Measure(s)", ylab = "Number of exposed agents", col = myColours, par(cex.axis=1.5), par(cex.lab=1.6), cex.main=2.0)

boxplot(Number_Exposed~Health_Measures, data = second_half_mydf, main = "Scenario 1 - Social Distancing", xlab = "Public Health Measures(s)", ylab = "Number of exposed agents", col = myColours, par(cex.axis=1.4), par(cex.lab=1.6), cex.main=2.0, ylim = c(0,60))





######## Statistical tests ######### 
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




