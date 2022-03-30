# Modelling the use of public health measures to reduce disease exposure using crowd simulation.


Below is a description on what is contained in each folder

## Scenarios-PubHlthMsr_Parameters 
In this folder is the Vadere project folders to re run the simulations described in Modelling the use of public health measures to reduce disease
exposure using crowd simulation.
There are two scenarios, scenario 1 and scenario 2. For each there simulations with modified parameters to model public health measures. 
For example to access the control scenario (no public health measures) for scenario 1, in Vadere (https://www.vadere.org/download/) open the Scenario1/base:Control_scenario/ folder and open the vadere.project file. 
From there, the parameters and topography can be viewed or edited. 
Click "run simulation" to run and visualize the simulaiton. 

## Exposure_data_and_analysis

This folder contains the data output for Scenario1, Scenario2, and timestep analysis simulations. In each folder contains the output data for all variables with the number of Susceptible, Exposed, Infectious, and Recovered agents and scenario variable. The "*analysis.R" R file imports and plots the data as presented in Modelling the use of public health measures to reduce disease exposure using crowd simulation and includes the statistical tests used to analyze the significance of the results.
