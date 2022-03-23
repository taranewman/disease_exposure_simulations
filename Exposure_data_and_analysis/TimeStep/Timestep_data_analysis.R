#load libraries
library(ggplot2)
library("PMCMRplus") 

#set working directory
setwd("~/Documents/Git/disease_exposure_simulations/Exposure_data_and_analysis/TimeStep")


##### read in data #####

## SCENARIO 1

# base

base1_1 = read.csv("scenario1_timeStep_1_output.txt", header = TRUE, nrows = 1000)

base1_0.8 = read.csv("scenario1_timeStep_0.8_output.txt", header = TRUE, nrows = 1000)
base1_0.6 = read.csv("scenario1_timeStep_0.6_output.txt", header = TRUE, nrows = 1000)


base1_0.4 =  read.csv("baseScenario_output.txt", header = TRUE, nrows = 1000 )
base1_0.4$timestep <- 0.4

base1_0.2 = read.csv("scenario1_timeStep_0.2_output.txt", header = TRUE, nrows = 1000)

base1_0.1 = read.csv("scenario1_timeStep_0.1_output.txt", header = TRUE, nrows = 1000)





# cloth1

cloth1_1= read.csv("cloth_scenario1_timeStep_1_output.txt", header = TRUE, nrows = 1000)

cloth1_0.8= read.csv("cloth_scenario1_timeStep_0.8_output.txt", header = TRUE, nrows = 1000)

cloth1_0.6= read.csv("cloth_scenario1_timeStep_0.6_output.txt", header = TRUE, nrows = 1000)

cloth1_0.4 = read.csv("cloth_noSD_Scenario_output.txt", header = TRUE, nrows = 1000)
cloth1_0.4$timestep <- 0.4

cloth1_0.2= read.csv("cloth_scenario1_timeStep_0.2_output.txt", header = TRUE, nrows = 1000)

cloth1_0.1= read.csv("cloth_scenario1_timeStep_0.1_output.txt", header = TRUE, nrows = 1000)



### SCENARIO 2

# base/ control

base2_1 = read.csv("scenario2_timeStep_1_output.txt", header = TRUE, nrows = 1000)

base2_0.8 = read.csv("scenario2_timeStep_0.8_output.txt", header = TRUE, nrows = 1000)

base2_0.6 = read.csv("scenario2_timeStep_0.6_output.txt", header = TRUE, nrows = 1000)

base2_0.4 = read.csv("baseScenario2_output.txt", header = TRUE, nrows = 1000 )
base2_0.4$timestep <- 0.4

base2_0.2 = read.csv("scenario2_timeStep_0.2_output.txt", header = TRUE, nrows = 1000)

base2_0.1 = read.csv("scenario2_timeStep_0.1_output.txt", header = TRUE, nrows = 1000)






# cloth2

cloth2_1= read.csv("cloth_scenario2_timeStep_1_output.txt", header = TRUE, nrows = 1000)

cloth2_0.8 = read.csv("cloth_scenario2_timeStep_0.8_output.txt", header = TRUE, nrows = 1000)

cloth2_0.6 = read.csv("cloth_scenario2_timeStep_0.6_output.txt", header = TRUE, nrows = 1000)

cloth2_0.4 = read.csv("clothMaskScenario2_output.txt", header = TRUE, nrows = 1000)
cloth2_0.4$timestep <- 0.4

cloth2_0.2= read.csv("cloth_scenario2_timeStep_0.2_output.txt", header = TRUE, nrows = 1000)

cloth2_0.1 = read.csv("cloth_scenario2_timeStep_0.1_output.txt", header = TRUE, nrows = 1000)






###### Combine and plot data 


## Scenario 1###

# Control 1 ###
mydf <- data.frame(Number_Exposed=c(base1_1$Exposed, base1_0.8$Exposed,
                                    base1_0.6$Exposed, base1_0.4$Exposed,
                                    base1_0.2$Exposed),
                   
                   Health_Measures=c(base1_1$timestep, base1_0.8$timestep,
                                     base1_0.6$timestep, base1_0.4$timestep,
                                     base1_0.2$timestep))


myColours = c("cyan1", "cyan2", "cyan3", "darkcyan", "darkslategray")

boxplot(Number_Exposed~Health_Measures, data = mydf, main = "Control Scenario 1", xlab = "timestep (s)", ylab = "Number of exposed agents", col = myColours, par(cex.axis=1.2), par(cex.lab=1.5), cex.main=1.5)


### Cloth Mask 1 ###
cloth1_df <- data.frame(Number_Exposed=c(cloth1_1$Exposed, cloth1_0.8$Exposed,
                                         cloth1_0.6$Exposed, cloth1_0.4$Exposed,
                                         cloth1_0.2$Exposed),
                   
                   Health_Measures=c(cloth1_1$timestep, cloth1_0.8$timestep,
                                     cloth1_0.6$timestep, cloth1_0.4$timestep,
                                     cloth1_0.2$timestep))


boxplot(Number_Exposed~Health_Measures, data = cloth1_df, main = "Cloth Mask Scenario 1", xlab = "timestep (s)", ylab = "Number of exposed agents", col = myColours, par(cex.axis=1.2), par(cex.lab=1.5), cex.main=1.5)



##### Scenario 2 ###

# control 2 ####
base2_df <- data.frame(Number_Exposed=c(base2_1$Exposed, base2_0.8$Exposed,
                                    base2_0.6$Exposed, base2_0.4$Exposed,
                                    base2_0.2$Exposed, base2_0.1$Exposed),
                   
                   Health_Measures=c(base2_1$timestep, base2_0.8$timestep,
                                     base2_0.6$timestep, base2_0.4$timestep,
                                     base2_0.2$timestep, base2_0.1$timestep))

scn2_colours = c("darkslategray1","cyan1", "cyan2", "cyan3", "darkcyan", "darkslategray") 
boxplot(Number_Exposed~Health_Measures, data = base2_df, main = "Control Scenario 2", xlab = "timestep (s)", ylab = "Number of exposed agents", col = scn2_colours, par(cex.axis=1.2), par(cex.lab=1.5), cex.main=1.5)


#### Cloth 2 ####
cloth2_df <- data.frame(Number_Exposed=c(cloth2_1$Exposed, cloth2_0.8$Exposed,
                                         cloth2_0.6$Exposed, cloth2_0.4$Exposed,
                                         cloth2_0.2$Exposed, cloth2_0.1$Exposed),
                        
                        Health_Measures=c(cloth2_1$timestep, cloth2_0.8$timestep,
                                          cloth2_0.6$timestep, cloth2_0.4$timestep,
                                          cloth2_0.2$timestep, cloth2_0.1$timestep))


boxplot(Number_Exposed~Health_Measures, data = cloth2_df, main = "Cloth Mask Scenario 2", xlab = "timestep (s)", ylab = "Number of exposed agents", col = scn2_colours, par(cex.axis=1.2), par(cex.lab=1.5), cex.main=1.5)







####### Statistical Analysis #######

# Method:  HAWORTH M. B.: Biomechanical Locomotion Heterogeneity in Synthetic Crowds. PhD thesis, York University, November 2019.
# results considered significant when all tests have p < 0.01

## Control Scn1
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
boxplot(Number_Exposed~Health_Measures, data = mydf, main = "Control Scenario 1", xlab = "timestep (s)", ylab = "Number of exposed agents", col = myColours, par(cex.axis=1.2), par(cex.lab=1.5), cex.main=1.5)



### Cloth Scn1

my_data <- cloth1_df
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

boxplot(Number_Exposed~Health_Measures, data = cloth1_df, main = "Cloth Mask Scenario 1", xlab = "timestep (s)", ylab = "Number of exposed agents", col = myColours, par(cex.axis=1.2), par(cex.lab=1.5), cex.main=1.5)

#### Control Scn2

my_data <- base2_df
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

boxplot(Number_Exposed~Health_Measures, data = base2_df, main = "Control Scenario 2", xlab = "timestep (s)", ylab = "Number of exposed agents", col = scn2_colours, par(cex.axis=1.2), par(cex.lab=1.5), cex.main=1.5)

##### Cloth Scn 2

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


boxplot(Number_Exposed~Health_Measures, data = cloth2_df, main = "Cloth Mask Scenario 2", xlab = "timestep (s)", ylab = "Number of exposed agents", col = scn2_colours, par(cex.axis=1.2), par(cex.lab=1.5), cex.main=1.5)





