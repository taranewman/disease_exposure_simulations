# Modelling the use of public health measures to reduce disease exposure using crowd simulation.


Below is a description on what is contained in each folder

## Scenarios-PubHlthMsr_Parameters 
This folder contains the Vadere project folders to re run the simulations described in "Modelling the use of public health measures to reduce disease
exposure using crowd simulation".
### Scenario1 and Scenario2
There are two scenarios, Scenario 1 and Scenario 2. For each scenario, there are simulations with modified parameters to model public health measures. 
For example to access the control scenario (no public health measures) for Scenario 1, in Vadere (https://www.vadere.org/download/) open the Scenario1/base:Control_scenario/ folder and open the vadere.project file. 
From there, the parameters and topography can be viewed or edited. 
Click "run simulation" to run and visualize the simulaiton. 

Once the simulation is complete, click on the output file in the bottom right corner of the VadereGUI and then on "Post Visualization" in the top right corner is visualize the simuation. 

### timestep

This folder contains the Vadere project files for the various timesteps tested for the control and cloth mask scenarios for Scenario 1 and Scenario 2. 
The simulations can be run in the same way described above (clicking on the vadere.project file etc.)


## Exposure_data_and_analysis

This folder contains the data output for Scenario1, Scenario2, and timestep analysis simulations. In each folder contains the output data for all variables with the number of Susceptible, Exposed, Infectious, and Recovered agents and scenario variable. The "*analysis.R" R file imports and plots the data as presented in Modelling the use of public health measures to reduce disease exposure using crowd simulation and includes the statistical tests used to analyze the significance of the results.

SIR_Models.ipynb contains the code to generate the SIR models from Scenario 1. 
