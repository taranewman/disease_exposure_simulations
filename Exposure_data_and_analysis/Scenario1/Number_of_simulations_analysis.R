# load libraries
library(ggplot2)
library(tidyverse)
library(dplyr)

# Set working directory
setwd("~/Documents/Git/disease_exposure_simulations/Exposure_data_and_analysis/Scenario1")

######## 1000#######

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

# combine data (only considering variables without social distancing to comapre to scenario 2)
first_half_mydf <- data.frame(Number_Exposed=c(base_dataset$Exposed,base_vaccinated$Exposed, 
                                               clothMask$Exposed, clothMask_vaccinated$Exposed, 
                                               n95$Exposed, n95_vaccinated$Exposed),
                              
                              Health_Measures=c(base_dataset$Scenario,base_vaccinated$Scenario, 
                                                clothMask$Scenario, clothMask_vaccinated$Scenario,
                                                n95$Scenario, n95_vaccinated$Scenario))


first_half_mydf$Health_Measures <- factor(first_half_mydf$Health_Measures , levels=c("Control", "Vaccinated", "ClothMask", "ClothMask/Vaccinated", "N95", "N95/Vaccinated"))

# set grapth colours
myColours = c("cyan1", "darkblue", "lightpink", "lightpink3", "chartreuse", "chartreuse4")



# plot data
boxplot(Number_Exposed~Health_Measures, data = first_half_mydf, main = "Scenario 1 (1000)", xlab = "Public Health Measure(s)", ylab = "Number of exposed agents", col = myColours, par(cex.axis=1.5), par(cex.lab=1.6), cex.main=2.0)


############# Vary number of simulation runs by re reading in data with number of rows for simulations runs. 

########## 250 

setwd("~/Documents/CSC578A/FINAL_DATA_FOLDER/Scenario1")
base_dataset = read.csv("baseScenario_output.txt", header = TRUE, nrows = 250 )

base_dataset$Scenario <- gsub("base", "Control", base_dataset$Scenario)



base_vaccinated = read.csv("baseScenario1_vaccinated_output.txt", header = TRUE, nrows = 250 )

base_vaccinated$Scenario <- gsub("base/Vaccinated", "Vaccinated", base_vaccinated$Scenario)

clothMask_SD = read.csv("clothMask_Social_Distancing_output.txt", header = TRUE, nrows = 250)



clothMask_SD_vaccinated = read.csv("clothMask_SD_Scenario_vaccinated_output.txt", header = TRUE, nrows = 250)




clothMask = read.csv("cloth_noSD_Scenario_output.txt", header = TRUE, nrows = 250)


clothMask_vaccinated = read.csv("cloth_noSD_vaccinated_Scenario_output.txt", header = TRUE, nrows = 250)

n95_SD = read.csv("n95_SD_output.txt", header = TRUE, nrows = 250)

n95_SD_vaccinated = read.csv("n95_SD_vaccinated_output.txt", header = TRUE, nrows = 250)

n95 = read.csv("n95_noSD_Scenario_output.txt", header = TRUE, nrows = 250)

n95_vaccinated = read.csv("n95_noSD_vaccinated_Scenario_output.txt", header = TRUE, nrows = 250)

social_distancing = read.csv("socialDistancingScenario_output.txt", header = TRUE, nrows = 250)

social_distancing_vaccinated = read.csv("socialDistancing_vaccinatedScenario_output.txt", header = TRUE, nrows = 250)


first_half_mydf <- data.frame(Number_Exposed=c(base_dataset$Exposed,base_vaccinated$Exposed, 
                                               clothMask$Exposed, clothMask_vaccinated$Exposed, 
                                               n95$Exposed, n95_vaccinated$Exposed),
                              
                              Health_Measures=c(base_dataset$Scenario,base_vaccinated$Scenario, 
                                                clothMask$Scenario, clothMask_vaccinated$Scenario,
                                                n95$Scenario, n95_vaccinated$Scenario))


first_half_mydf$Health_Measures <- factor(first_half_mydf$Health_Measures , levels=c("Control", "Vaccinated", "ClothMask", "ClothMask/Vaccinated", "N95", "N95/Vaccinated"))


myColours = c("cyan1", "darkblue", "lightpink", "lightpink3", "chartreuse", "chartreuse4")




boxplot(Number_Exposed~Health_Measures, data = first_half_mydf, main = "Scenario 1 (250)", xlab = "Public Health Measure(s)", ylab = "Number of exposed agents", col = myColours, par(cex.axis=1.5), par(cex.lab=1.6), cex.main=2.0)







########## 200 

setwd("~/Documents/CSC578A/FINAL_DATA_FOLDER/Scenario1")
base_dataset = read.csv("baseScenario_output.txt", header = TRUE, nrows = 200 )

base_dataset$Scenario <- gsub("base", "Control", base_dataset$Scenario)



base_vaccinated = read.csv("baseScenario1_vaccinated_output.txt", header = TRUE, nrows = 200 )

base_vaccinated$Scenario <- gsub("base/Vaccinated", "Vaccinated", base_vaccinated$Scenario)

clothMask_SD = read.csv("clothMask_Social_Distancing_output.txt", header = TRUE, nrows = 200)



clothMask_SD_vaccinated = read.csv("clothMask_SD_Scenario_vaccinated_output.txt", header = TRUE, nrows = 200)




clothMask = read.csv("cloth_noSD_Scenario_output.txt", header = TRUE, nrows = 200)


clothMask_vaccinated = read.csv("cloth_noSD_vaccinated_Scenario_output.txt", header = TRUE, nrows = 200)

n95_SD = read.csv("n95_SD_output.txt", header = TRUE, nrows = 200)

n95_SD_vaccinated = read.csv("n95_SD_vaccinated_output.txt", header = TRUE, nrows = 200)

n95 = read.csv("n95_noSD_Scenario_output.txt", header = TRUE, nrows = 200)

n95_vaccinated = read.csv("n95_noSD_vaccinated_Scenario_output.txt", header = TRUE, nrows = 200)

social_distancing = read.csv("socialDistancingScenario_output.txt", header = TRUE, nrows = 200)

social_distancing_vaccinated = read.csv("socialDistancing_vaccinatedScenario_output.txt", header = TRUE, nrows = 200)


first_half_mydf <- data.frame(Number_Exposed=c(base_dataset$Exposed,base_vaccinated$Exposed, 
                                               clothMask$Exposed, clothMask_vaccinated$Exposed, 
                                               n95$Exposed, n95_vaccinated$Exposed),
                              
                              Health_Measures=c(base_dataset$Scenario,base_vaccinated$Scenario, 
                                                clothMask$Scenario, clothMask_vaccinated$Scenario,
                                                n95$Scenario, n95_vaccinated$Scenario))


first_half_mydf$Health_Measures <- factor(first_half_mydf$Health_Measures , levels=c("Control", "Vaccinated", "ClothMask", "ClothMask/Vaccinated", "N95", "N95/Vaccinated"))


myColours = c("cyan1", "darkblue", "lightpink", "lightpink3", "chartreuse", "chartreuse4")




boxplot(Number_Exposed~Health_Measures, data = first_half_mydf, main = "Scenario 1 (200)", xlab = "Public Health Measure(s)", ylab = "Number of exposed agents", col = myColours, par(cex.axis=1.5), par(cex.lab=1.6), cex.main=2.0)







########## 150 

setwd("~/Documents/CSC578A/FINAL_DATA_FOLDER/Scenario1")
base_dataset = read.csv("baseScenario_output.txt", header = TRUE, nrows = 150 )

base_dataset$Scenario <- gsub("base", "Control", base_dataset$Scenario)



base_vaccinated = read.csv("baseScenario1_vaccinated_output.txt", header = TRUE, nrows = 150 )

base_vaccinated$Scenario <- gsub("base/Vaccinated", "Vaccinated", base_vaccinated$Scenario)

clothMask_SD = read.csv("clothMask_Social_Distancing_output.txt", header = TRUE, nrows = 150)



clothMask_SD_vaccinated = read.csv("clothMask_SD_Scenario_vaccinated_output.txt", header = TRUE, nrows = 150)




clothMask = read.csv("cloth_noSD_Scenario_output.txt", header = TRUE, nrows = 150)


clothMask_vaccinated = read.csv("cloth_noSD_vaccinated_Scenario_output.txt", header = TRUE, nrows = 150)

n95_SD = read.csv("n95_SD_output.txt", header = TRUE, nrows = 150)

n95_SD_vaccinated = read.csv("n95_SD_vaccinated_output.txt", header = TRUE, nrows = 150)

n95 = read.csv("n95_noSD_Scenario_output.txt", header = TRUE, nrows = 150)

n95_vaccinated = read.csv("n95_noSD_vaccinated_Scenario_output.txt", header = TRUE, nrows = 150)

social_distancing = read.csv("socialDistancingScenario_output.txt", header = TRUE, nrows = 150)

social_distancing_vaccinated = read.csv("socialDistancing_vaccinatedScenario_output.txt", header = TRUE, nrows = 150)


first_half_mydf <- data.frame(Number_Exposed=c(base_dataset$Exposed,base_vaccinated$Exposed, 
                                               clothMask$Exposed, clothMask_vaccinated$Exposed, 
                                               n95$Exposed, n95_vaccinated$Exposed),
                              
                              Health_Measures=c(base_dataset$Scenario,base_vaccinated$Scenario, 
                                                clothMask$Scenario, clothMask_vaccinated$Scenario,
                                                n95$Scenario, n95_vaccinated$Scenario))


first_half_mydf$Health_Measures <- factor(first_half_mydf$Health_Measures , levels=c("Control", "Vaccinated", "ClothMask", "ClothMask/Vaccinated", "N95", "N95/Vaccinated"))


myColours = c("cyan1", "darkblue", "lightpink", "lightpink3", "chartreuse", "chartreuse4")




boxplot(Number_Exposed~Health_Measures, data = first_half_mydf, main = "Scenario 1 (150)", xlab = "Public Health Measure(s)", ylab = "Number of exposed agents", col = myColours, par(cex.axis=1.5), par(cex.lab=1.6), cex.main=2.0)




########### 100 

setwd("~/Documents/CSC578A/FINAL_DATA_FOLDER/Scenario1")
base_dataset = read.csv("baseScenario_output.txt", header = TRUE, nrows = 100 )

base_dataset$Scenario <- gsub("base", "Control", base_dataset$Scenario)



base_vaccinated = read.csv("baseScenario1_vaccinated_output.txt", header = TRUE, nrows = 100 )

base_vaccinated$Scenario <- gsub("base/Vaccinated", "Vaccinated", base_vaccinated$Scenario)

clothMask_SD = read.csv("clothMask_Social_Distancing_output.txt", header = TRUE, nrows = 100)



clothMask_SD_vaccinated = read.csv("clothMask_SD_Scenario_vaccinated_output.txt", header = TRUE, nrows = 100)




clothMask = read.csv("cloth_noSD_Scenario_output.txt", header = TRUE, nrows = 100)


clothMask_vaccinated = read.csv("cloth_noSD_vaccinated_Scenario_output.txt", header = TRUE, nrows = 100)

n95_SD = read.csv("n95_SD_output.txt", header = TRUE, nrows = 100)

n95_SD_vaccinated = read.csv("n95_SD_vaccinated_output.txt", header = TRUE, nrows = 100)

n95 = read.csv("n95_noSD_Scenario_output.txt", header = TRUE, nrows = 100)

n95_vaccinated = read.csv("n95_noSD_vaccinated_Scenario_output.txt", header = TRUE, nrows = 100)

social_distancing = read.csv("socialDistancingScenario_output.txt", header = TRUE, nrows = 100)

social_distancing_vaccinated = read.csv("socialDistancing_vaccinatedScenario_output.txt", header = TRUE, nrows = 100)


first_half_mydf <- data.frame(Number_Exposed=c(base_dataset$Exposed,base_vaccinated$Exposed, 
                                               clothMask$Exposed, clothMask_vaccinated$Exposed, 
                                               n95$Exposed, n95_vaccinated$Exposed),
                              
                              Health_Measures=c(base_dataset$Scenario,base_vaccinated$Scenario, 
                                                clothMask$Scenario, clothMask_vaccinated$Scenario,
                                                n95$Scenario, n95_vaccinated$Scenario))


first_half_mydf$Health_Measures <- factor(first_half_mydf$Health_Measures , levels=c("Control", "Vaccinated", "ClothMask", "ClothMask/Vaccinated", "N95", "N95/Vaccinated"))


myColours = c("cyan1", "darkblue", "lightpink", "lightpink3", "chartreuse", "chartreuse4")




boxplot(Number_Exposed~Health_Measures, data = first_half_mydf, main = "Scenario 1 (100)", xlab = "Public Health Measure(s)", ylab = "Number of exposed agents", col = myColours, par(cex.axis=1.5), par(cex.lab=1.6), cex.main=2.0)

