library(ggplot2)

setwd("~/Documents/CSC578A/FINAL_DATA_FOLDER/Scenario2")


base_dataset = read.csv("baseScenario2_output.txt", header = TRUE , nrows = 1000 )

base_vaccinated = read.csv("baseScenario2_vaccinated_output.txt", header = TRUE , nrows = 1000)

clothMask = read.csv("clothMaskScenario2_output.txt", header = TRUE, nrows = 1000)

clothMask_vaccinated = read.csv("clothMaskScenario2_vaccinated_output.txt", header = TRUE, nrows = 1000)

n95 = read.csv("n95Scenario2_output.txt", header = TRUE, nrows = 1000)

n95_vaccinated = read.csv("n95Scenario2_vaccinated_output.txt", header = TRUE, nrows = 1000)



mydf <- data.frame(Number_Exposed=c(base_dataset$Exposed, base_vaccinated$Exposed,
                                    clothMask$Exposed, clothMask_vaccinated$Exposed, 
                                    n95$Exposed, n95_vaccinated$Exposed),
                   
                   Health_Measures=c(base_dataset$Scenario, base_vaccinated$Scenario,
                                     clothMask$Scenario, clothMask_vaccinated$Scenario,
                                     n95$Scenario, n95_vaccinated$Scenario))



mydf <- data.frame(Number_Exposed=c(base_dataset$Exposed, base_vaccinated$Exposed, clothMask$Exposed, clothMask_vaccinated$Exposed, n95$Exposed, n95_vaccinated$Exposed), Health_Measures=c(base_dataset$Scenario, base_vaccinated$Scenario, clothMask$Scenario,clothMask_vaccinated$Scenario, n95$Scenario, n95_vaccinated$Scenario))


myColours = c("cyan1", "darkblue", "lightpink", "lightpink3", "chartreuse", "chartreuse4")

boxplot(Number_Exposed~Health_Measures, data = mydf, main = "Scenario 2", xlab = "Public Health Measure(s)", ylab = "Number of exposed", col = myColours)



boxplot(Number_Exposed~Health_Measures, data = mydf, main = "Scenario 2", xlab = "Public Health Measure(s)", ylab = "Number of exposed", col = myColours, ylim = c(0,60))

