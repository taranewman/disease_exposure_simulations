## Load libraries
library(ggplot2)

## Set working directory
setwd("~/Documents/Git/disease_exposure_simulations/Exposure_data_and_analysis/Scenario2")


##### Read in data
base_dataset = read.csv("baseScenario2_output.txt", header = TRUE , nrows = 1000 )

base_vaccinated = read.csv("baseScenario2_vaccinated_output.txt", header = TRUE , nrows = 1000)

clothMask = read.csv("clothMaskScenario2_output.txt", header = TRUE, nrows = 1000)

clothMask_vaccinated = read.csv("clothMaskScenario2_vaccinated_output.txt", header = TRUE, nrows = 1000)

n95 = read.csv("n95Scenario2_output.txt", header = TRUE, nrows = 1000)

n95_vaccinated = read.csv("n95Scenario2_vaccinated_output.txt", header = TRUE, nrows = 1000)



##### combine into data frame
mydf <- data.frame(Number_Exposed=c(base_dataset$Exposed, base_vaccinated$Exposed,
                                    clothMask$Exposed, clothMask_vaccinated$Exposed, 
                                    n95$Exposed, n95_vaccinated$Exposed),
                   
                   Health_Measures=c(base_dataset$Scenario, base_vaccinated$Scenario,
                                     clothMask$Scenario, clothMask_vaccinated$Scenario,
                                     n95$Scenario, n95_vaccinated$Scenario))



mydf <- data.frame(Number_Exposed=c(base_dataset$Exposed, base_vaccinated$Exposed, clothMask$Exposed, clothMask_vaccinated$Exposed, n95$Exposed, n95_vaccinated$Exposed), Health_Measures=c(base_dataset$Scenario, base_vaccinated$Scenario, clothMask$Scenario,clothMask_vaccinated$Scenario, n95$Scenario, n95_vaccinated$Scenario))

## set graph colours
myColours = c("cyan1", "darkblue", "lightpink", "lightpink3", "chartreuse", "chartreuse4")

## Plot cata
boxplot(Number_Exposed~Health_Measures, data = mydf, main = "Scenario 2", xlab = "Public Health Measure(s)", ylab = "Number of exposed", col = myColours)


############# Vary number of simulation runs by re reading in data with number of rows for simulations runs. 

#### 750


base_dataset = read.csv("baseScenario2_output.txt", header = TRUE , nrows = 750 )

base_vaccinated = read.csv("baseScenario2_vaccinated_output.txt", header = TRUE , nrows = 750)

clothMask = read.csv("clothMaskScenario2_output.txt", header = TRUE, nrows = 750)

clothMask_vaccinated = read.csv("clothMaskScenario2_vaccinated_output.txt", header = TRUE, nrows = 750)

n95 = read.csv("n95Scenario2_output.txt", header = TRUE, nrows = 750)

n95_vaccinated = read.csv("n95Scenario2_vaccinated_output.txt", header = TRUE, nrows = 750)



mydf <- data.frame(Number_Exposed=c(base_dataset$Exposed, base_vaccinated$Exposed,
                                    clothMask$Exposed, clothMask_vaccinated$Exposed, 
                                    n95$Exposed, n95_vaccinated$Exposed),
                   
                   Health_Measures=c(base_dataset$Scenario, base_vaccinated$Scenario,
                                     clothMask$Scenario, clothMask_vaccinated$Scenario,
                                     n95$Scenario, n95_vaccinated$Scenario))



mydf <- data.frame(Number_Exposed=c(base_dataset$Exposed, base_vaccinated$Exposed, clothMask$Exposed, clothMask_vaccinated$Exposed, n95$Exposed, n95_vaccinated$Exposed), Health_Measures=c(base_dataset$Scenario, base_vaccinated$Scenario, clothMask$Scenario,clothMask_vaccinated$Scenario, n95$Scenario, n95_vaccinated$Scenario))


myColours = c("cyan1", "darkblue", "lightpink", "lightpink3", "chartreuse", "chartreuse4")

boxplot(Number_Exposed~Health_Measures, data = mydf, main = "Scenario 2 (750)", xlab = "Public Health Measure(s)", ylab = "Number of exposed", col = myColours)



### 500


base_dataset = read.csv("baseScenario2_output.txt", header = TRUE , nrows = 500 )
base_dataset$Scenario <- gsub("base", "Control", base_dataset$Scenario)

base_vaccinated = read.csv("baseScenario2_vaccinated_output.txt", header = TRUE , nrows = 500)
base_vaccinated$Scenario <- gsub("base/Vaccinated", "Vaccinated", base_vaccinated$Scenario)


clothMask = read.csv("clothMaskScenario2_output.txt", header = TRUE, nrows = 500)

clothMask_vaccinated = read.csv("clothMaskScenario2_vaccinated_output.txt", header = TRUE, nrows = 500)

n95 = read.csv("n95Scenario2_output.txt", header = TRUE, nrows = 500)

n95_vaccinated = read.csv("n95Scenario2_vaccinated_output.txt", header = TRUE, nrows = 500)



mydf <- data.frame(Number_Exposed=c(base_dataset$Exposed, base_vaccinated$Exposed,
                                    clothMask$Exposed, clothMask_vaccinated$Exposed, 
                                    n95$Exposed, n95_vaccinated$Exposed),
                   
                   Health_Measures=c(base_dataset$Scenario, base_vaccinated$Scenario,
                                     clothMask$Scenario, clothMask_vaccinated$Scenario,
                                     n95$Scenario, n95_vaccinated$Scenario))



mydf <- data.frame(Number_Exposed=c(base_dataset$Exposed, base_vaccinated$Exposed, clothMask$Exposed, clothMask_vaccinated$Exposed, n95$Exposed, n95_vaccinated$Exposed), Health_Measures=c(base_dataset$Scenario, base_vaccinated$Scenario, clothMask$Scenario,clothMask_vaccinated$Scenario, n95$Scenario, n95_vaccinated$Scenario))

mydf$Health_Measures <- factor(mydf$Health_Measures , levels=c("Control", "Vaccinated", "ClothMask", "ClothMask/Vaccinated", "N95", "N95/Vaccinated"))
myColours = c("cyan1", "darkblue", "lightpink", "lightpink3", "chartreuse", "chartreuse4")

boxplot(Number_Exposed~Health_Measures, data = mydf, main = "Scenario 2 (500)", xlab = "Public Health Measure(s)", ylab = "Number of exposed", col = myColours)




### 150


base_dataset = read.csv("baseScenario2_output.txt", header = TRUE , nrows = 150 )
base_dataset$Scenario <- gsub("base", "Control", base_dataset$Scenario)

base_vaccinated = read.csv("baseScenario2_vaccinated_output.txt", header = TRUE , nrows = 150)
base_vaccinated$Scenario <- gsub("base/Vaccinated", "Vaccinated", base_vaccinated$Scenario)


clothMask = read.csv("clothMaskScenario2_output.txt", header = TRUE, nrows = 150)

clothMask_vaccinated = read.csv("clothMaskScenario2_vaccinated_output.txt", header = TRUE, nrows = 150)

n95 = read.csv("n95Scenario2_output.txt", header = TRUE, nrows = 150)

n95_vaccinated = read.csv("n95Scenario2_vaccinated_output.txt", header = TRUE, nrows = 150)



mydf <- data.frame(Number_Exposed=c(base_dataset$Exposed, base_vaccinated$Exposed,
                                    clothMask$Exposed, clothMask_vaccinated$Exposed, 
                                    n95$Exposed, n95_vaccinated$Exposed),
                   
                   Health_Measures=c(base_dataset$Scenario, base_vaccinated$Scenario,
                                     clothMask$Scenario, clothMask_vaccinated$Scenario,
                                     n95$Scenario, n95_vaccinated$Scenario))



mydf <- data.frame(Number_Exposed=c(base_dataset$Exposed, base_vaccinated$Exposed, clothMask$Exposed, clothMask_vaccinated$Exposed, n95$Exposed, n95_vaccinated$Exposed), Health_Measures=c(base_dataset$Scenario, base_vaccinated$Scenario, clothMask$Scenario,clothMask_vaccinated$Scenario, n95$Scenario, n95_vaccinated$Scenario))

mydf$Health_Measures <- factor(mydf$Health_Measures , levels=c("Control", "Vaccinated", "ClothMask", "ClothMask/Vaccinated", "N95", "N95/Vaccinated"))
myColours = c("cyan1", "darkblue", "lightpink", "lightpink3", "chartreuse", "chartreuse4")

boxplot(Number_Exposed~Health_Measures, data = mydf, main = "Scenario 2 (150)", xlab = "Public Health Measure(s)", ylab = "Number of exposed", col = myColours)



### 100
base_dataset = read.csv("baseScenario2_output.txt", header = TRUE , nrows = 100 )
base_dataset$Scenario <- gsub("base", "Control", base_dataset$Scenario)

base_vaccinated = read.csv("baseScenario2_vaccinated_output.txt", header = TRUE , nrows = 100)
base_vaccinated$Scenario <- gsub("base/Vaccinated", "Vaccinated", base_vaccinated$Scenario)

clothMask = read.csv("clothMaskScenario2_output.txt", header = TRUE, nrows = 100)

clothMask_vaccinated = read.csv("clothMaskScenario2_vaccinated_output.txt", header = TRUE, nrows = 100)

n95 = read.csv("n95Scenario2_output.txt", header = TRUE, nrows = 100)

n95_vaccinated = read.csv("n95Scenario2_vaccinated_output.txt", header = TRUE, nrows = 100)



mydf <- data.frame(Number_Exposed=c(base_dataset$Exposed, base_vaccinated$Exposed,
                                    clothMask$Exposed, clothMask_vaccinated$Exposed, 
                                    n95$Exposed, n95_vaccinated$Exposed),
                   
                   Health_Measures=c(base_dataset$Scenario, base_vaccinated$Scenario,
                                     clothMask$Scenario, clothMask_vaccinated$Scenario,
                                     n95$Scenario, n95_vaccinated$Scenario))



mydf <- data.frame(Number_Exposed=c(base_dataset$Exposed, base_vaccinated$Exposed, clothMask$Exposed, clothMask_vaccinated$Exposed, n95$Exposed, n95_vaccinated$Exposed), Health_Measures=c(base_dataset$Scenario, base_vaccinated$Scenario, clothMask$Scenario,clothMask_vaccinated$Scenario, n95$Scenario, n95_vaccinated$Scenario))

mydf$Health_Measures <- factor(mydf$Health_Measures , levels=c("Control", "Vaccinated", "ClothMask", "ClothMask/Vaccinated", "N95", "N95/Vaccinated"))
myColours = c("cyan1", "darkblue", "lightpink", "lightpink3", "chartreuse", "chartreuse4")

boxplot(Number_Exposed~Health_Measures, data = mydf, main = "Scenario 2 (100)", xlab = "Public Health Measure(s)", ylab = "Number of exposed", col = myColours)

## 50

base_dataset = read.csv("baseScenario2_output.txt", header = TRUE , nrows = 50 )

base_vaccinated = read.csv("baseScenario2_vaccinated_output.txt", header = TRUE , nrows = 50)

clothMask = read.csv("clothMaskScenario2_output.txt", header = TRUE, nrows = 50)

clothMask_vaccinated = read.csv("clothMaskScenario2_vaccinated_output.txt", header = TRUE, nrows = 50)

n95 = read.csv("n95Scenario2_output.txt", header = TRUE, nrows = 50)

n95_vaccinated = read.csv("n95Scenario2_vaccinated_output.txt", header = TRUE, nrows = 50)



mydf <- data.frame(Number_Exposed=c(base_dataset$Exposed, base_vaccinated$Exposed,
                                    clothMask$Exposed, clothMask_vaccinated$Exposed, 
                                    n95$Exposed, n95_vaccinated$Exposed),
                   
                   Health_Measures=c(base_dataset$Scenario, base_vaccinated$Scenario,
                                     clothMask$Scenario, clothMask_vaccinated$Scenario,
                                     n95$Scenario, n95_vaccinated$Scenario))



mydf <- data.frame(Number_Exposed=c(base_dataset$Exposed, base_vaccinated$Exposed, clothMask$Exposed, clothMask_vaccinated$Exposed, n95$Exposed, n95_vaccinated$Exposed), Health_Measures=c(base_dataset$Scenario, base_vaccinated$Scenario, clothMask$Scenario,clothMask_vaccinated$Scenario, n95$Scenario, n95_vaccinated$Scenario))


myColours = c("cyan1", "darkblue", "lightpink", "lightpink3", "chartreuse", "chartreuse4")

boxplot(Number_Exposed~Health_Measures, data = mydf, main = "Scenario 2 (50)", xlab = "Public Health Measure(s)", ylab = "Number of exposed", col = myColours)


