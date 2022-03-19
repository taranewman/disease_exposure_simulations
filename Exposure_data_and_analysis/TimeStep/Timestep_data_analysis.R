#set wd
setwd("~/Documents/CSC578A/FINAL_DATA_FOLDER/TimeStep")

#load libraries
library(ggplot2)

## SCENARIO 1

# base

base1_1 = read.csv("scenario1_timeStep_1_output.txt", header = TRUE, nrows = 1000)

base1_0.8 = read.csv("scenario1_timeStep_0.8_output.txt", header = TRUE, nrows = 1000)
base1_0.6 = read.csv("scenario1_timeStep_0.6_output.txt", header = TRUE, nrows = 1000)


base1_0.4 =  read.csv("baseScenario_output.txt", header = TRUE, nrows = 1000 )
base1_0.4$timestep <- 0.4

base1_0.2 = read.csv("scenario1_timeStep_0.2_output.txt", header = TRUE, nrows = 1000)

base1_0.1 = read.csv("scenario1_timeStep_0.1_output.txt", header = TRUE, nrows = 1000)





# cloth

cloth1_1= read.csv("cloth_scenario1_timeStep_1_output.txt", header = TRUE, nrows = 1000)

cloth1_0.8= read.csv("cloth_scenario1_timeStep_0.8_output.txt", header = TRUE, nrows = 1000)

cloth1_0.6= read.csv("cloth_scenario1_timeStep_0.6_output.txt", header = TRUE, nrows = 1000)

cloth1_0.4 = read.csv("cloth_noSD_Scenario_output.txt", header = TRUE, nrows = 1000)
cloth1_0.4$timestep <- 0.4

cloth1_0.2= read.csv("cloth_scenario1_timeStep_0.2_output.txt", header = TRUE, nrows = 1000)

cloth1_0.1= read.csv("cloth_scenario1_timeStep_0.1_output.txt", header = TRUE, nrows = 1000)



### SCENARIO 2

# base

base2_1 = read.csv("scenario2_timeStep_1_output.txt", header = TRUE, nrows = 1000)

base2_0.8 = read.csv("scenario2_timeStep_0.8_output.txt", header = TRUE, nrows = 1000)

base2_0.6 = read.csv("scenario2_timeStep_0.6_output.txt", header = TRUE, nrows = 1000)

base2_0.4 = read.csv("baseScenario2_output.txt", header = TRUE, nrows = 1000 )
base2_0.4$timestep <- 0.4

base2_0.2 = read.csv("scenario2_timeStep_0.2_output.txt", header = TRUE, nrows = 1000)

base2_0.1 = read.csv("scenario2_timeStep_0.1_output.txt", header = TRUE, nrows = 1000)






# cloth

cloth2_1= read.csv("cloth_scenario2_timeStep_1_output.txt", header = TRUE, nrows = 1000)

cloth2_0.8 = read.csv("cloth_scenario2_timeStep_0.8_output.txt", header = TRUE, nrows = 1000)

cloth2_0.6 = read.csv("cloth_scenario2_timeStep_0.6_output.txt", header = TRUE, nrows = 1000)

cloth2_0.4 = read.csv("clothMaskScenario2_output.txt", header = TRUE, nrows = 1000)
cloth2_0.4$timestep <- 0.4

cloth2_0.2= read.csv("cloth_scenario2_timeStep_0.2_output.txt", header = TRUE, nrows = 1000)

cloth2_0.1 = read.csv("cloth_scenario2_timeStep_0.1_output.txt", header = TRUE, nrows = 1000)







mydf <- data.frame(Number_Exposed=c(base1_1$Exposed, base1_0.8$Exposed,
                                    base1_0.6$Exposed, base1_0.4$Exposed,
                                    base1_0.2$Exposed),
                   
                   Health_Measures=c(base1_1$timestep, base1_0.8$timestep,
                                     base1_0.6$timestep, base1_0.4$timestep,
                                     base1_0.2$timestep))


myColours = c("cyan1", "cyan2", "cyan3", "darkcyan", "darkslategray")

boxplot(Number_Exposed~Health_Measures, data = mydf, main = "Control Scenario 1", xlab = "timestep (s)", ylab = "Number of exposed", col = myColours)



cloth1_df <- data.frame(Number_Exposed=c(cloth1_1$Exposed, cloth1_0.8$Exposed,
                                         cloth1_0.6$Exposed, cloth1_0.4$Exposed,
                                         cloth1_0.2$Exposed),
                   
                   Health_Measures=c(cloth1_1$timestep, cloth1_0.8$timestep,
                                     cloth1_0.6$timestep, cloth1_0.4$timestep,
                                     cloth1_0.2$timestep))


boxplot(Number_Exposed~Health_Measures, data = cloth1_df, main = "Cloth Mask Scenario 1", xlab = "timestep (s)", ylab = "Number of exposed", col = myColours)



base2_df <- data.frame(Number_Exposed=c(base2_1$Exposed, base2_0.8$Exposed,
                                    base2_0.6$Exposed, base2_0.4$Exposed,
                                    base2_0.2$Exposed, base2_0.1$Exposed),
                   
                   Health_Measures=c(base2_1$timestep, base2_0.8$timestep,
                                     base2_0.6$timestep, base2_0.4$timestep,
                                     base2_0.2$timestep, base2_0.1$timestep))

scn2_colours = c("darkslategray1","cyan1", "cyan2", "cyan3", "darkcyan", "darkslategray") 
boxplot(Number_Exposed~Health_Measures, data = base2_df, main = "Control Scenario 2", xlab = "timestep (s)", ylab = "Number of exposed", col = scn2_colours)



cloth2_df <- data.frame(Number_Exposed=c(cloth2_1$Exposed, cloth2_0.8$Exposed,
                                         cloth2_0.6$Exposed, cloth2_0.4$Exposed,
                                         cloth2_0.2$Exposed, cloth2_0.1$Exposed),
                        
                        Health_Measures=c(cloth2_1$timestep, cloth2_0.8$timestep,
                                          cloth2_0.6$timestep, cloth2_0.4$timestep,
                                          cloth2_0.2$timestep, cloth2_0.1$timestep))


boxplot(Number_Exposed~Health_Measures, data = cloth2_df, main = "Cloth Mask Scenario 2", xlab = "timestep (s)", ylab = "Number of exposed", col = scn2_colours)







library("PMCMRplus") 


my_data <- cloth2_df
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








df = data.frame(Number_Exposed = c(base_dataset1000$Exposed, clothMask1000$Exposed), Health_Measures = c(base_dataset1000$Scenario, clothMask1000$Scenario))
t.test(df$Number_Exposed~df$Health_Measures,  mu = 0, alt = "two.sided", conf = 0.95, var.eq = F, paired = F)

res.aov <- aov(Number_Exposed ~ Health_Measures, data = mydf)
# Summary of the analysis
summary(res.aov)
TukeyHSD(aov(mydf$Number_Exposed ~ as.factor(mydf$Health_Measures)))