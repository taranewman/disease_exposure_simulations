library(ggplot2)

setwd("~/Documents/CSC578A/FINAL_DATA_FOLDER/Scenario1")
base_dataset = read.csv("baseScenario_output.txt", header = TRUE, nrows = 1000 )



base_vaccinated = read.csv("baseScenario1_vaccinated_output.txt", header = TRUE, nrows = 1000 )


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



boxplot(Exposed~Scenario, data = base_dataset, main = "Infected people graph", xlab = "Scenario", ylab = "Number of exposed")


boxplot(Exposed~Scenario, data = base_vaccinated, main = "Infected people graph", xlab = "Scenario", ylab = "Number of exposed")



mydf <- data.frame(Number_Exposed=c(base_dataset$Exposed,base_vaccinated$Exposed,clothMask_SD$Exposed, clothMask_SD_vaccinated$Exposed, 
                       clothMask$Exposed, clothMask_vaccinated$Exposed, n95_SD$Exposed,n95_SD_vaccinated$Exposed,
                       n95$Exposed, n95_vaccinated$Exposed, social_distancing$Exposed, social_distancing_vaccinated$Exposed),
                   
                   Health_Measures=c(base_dataset$Scenario,base_vaccinated$Scenario,clothMask_SD$Scenario, clothMask_SD_vaccinated$Scenario, 
                       clothMask$Scenario, clothMask_vaccinated$Scenario, n95_SD$Scenario, n95_SD_vaccinated$Scenario,
                       n95$Scenario, n95_vaccinated$Scenario, social_distancing$Scenario, social_distancing_vaccinated$Scenario))


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


second_half_mydf$Health_Measures <- factor(second_half_mydf$Health_Measures , levels=c("SD", "SD/Vaccinated", "ClothMask/SD", "ClothMask/SD/Vaccinated", "N95/SD", "N95/SD/Vaccinated"))

boxplot(Number_Exposed~Health_Measures, data = mydf, main = "Infected people graph", xlab = "Scenario", ylab = "Number of exposed")

myColours = c("cyan1", "darkblue", "lightpink", "lightpink3", "chartreuse", "chartreuse4")

boxplot(Number_Exposed~Health_Measures, data = first_half_mydf, main = "Scenario 1", xlab = "Public Health Measure(s)", ylab = "Number of exposed", col = myColours)

boxplot(Number_Exposed~Health_Measures, data = second_half_mydf, main = "Scenario 1 - Social Distancing", xlab = "Public Health Measures(s)", ylab = "Number of exposed", col = myColours)


mean(base_dataset$Exposed)
mean(base_vaccinated$Exposed)








library("PMCMRplus") 


my_data <- first_half_mydf
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







histogramtest = data.frame(Exp = base_dataset1000$Exposed, Scn = base_dataset1000$Scenario)
hist(social_distancing$Exposed, prob = TRUE)

lm = (formula = mydf$Number_Exposed ~ mydf$Health_Measures)
lm

df = data.frame(Number_Exposed = c(base_dataset1000$Exposed, clothMask1000$Exposed), Health_Measures = c(base_dataset1000$Scenario, clothMask1000$Scenario))
t.test(df$Number_Exposed~df$Health_Measures,  mu = 0, alt = "two.sided", conf = 0.95, var.eq = F, paired = F)

res.aov <- aov(Number_Exposed ~ Health_Measures, data = mydf)
# Summary of the analysis
summary(res.aov)
TukeyHSD(aov(mydf$Number_Exposed ~ as.factor(mydf$Health_Measures)))

