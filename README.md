Created by: Katy Christensen</br>
Created on: September 26, 2022 <br>
Created for: BrainStation Data Science Bootcamp<br>
Contact Me via: LinkedIn (https://www.linkedin.com/in/katychristensen/)</br>

# BrainStation Data Science Capstone: 
## Predicting Fatality of Aviation Accidents

## INTRODUCTION
---
The US National Transportation Safety Board (NTSB) is the federal investigation agency for these accidents and reported that in 
2020, 18% of all aviation accidents in the US were fatal and of those fatal accident, 97% of them involved general aviation. 
General aviation is defined by the International Civil Aviation Organization as “all civil aviation (not operated by the Government or 
military) aircraft operations with the exception of commercial air transport or aerial work.” Or more simply put, aviation for private and 
recreational purposes. <br>
This capstone for BrainStation applies supervised madchine learning models and techniuqest to classify aviation accidents as fatal or 
non-fatal.  <br>


FILE LIST
---------------
|File Name                          | Description                                               | 
|:----------------------------------|:----------------------------------------------------------|
|*Data Files*                       |                                                           |
|Data/Raw (folder)                  | Contains all original data from the NTSB                  |
|flight_crew_hours_08.csv           | Dataset of total flight hours by crew member              |
|ntsb_08_final.csv                  | Dataset exported from mySQL join                          |
|ntsb08_clean.csv                   | Cleaned dataset exported from the Part 1 Capstone Notebook|
|ntsb08_model.csv                   | Cleaned dataset exported after dummy variable encoding    |
|*Jupyter Notebooks*                |                                                           |
|BrainStation_Capstone_Pt1of6.ipynb | Jupyter notebook detailing initial cleaning               |
|BrainStation_Capstone_Pt2of6.ipynb | Jupyter notebook for dummy variable encoding              |
|BrainStation_Capstone_Pt3of6.ipynb | Jupyter notebook for Logistic Regression modeling         |
|BrainStation_Capstone_Pt4of6.ipynb | Jupyter notebook for Decision Tree modeling               |
|BrainStation_Capstone_Pt5of6.ipynb | Jupyter notebook for KNN modeling                         |
|BrainStation_Capstone_Pt6of6.ipynb | Jupyter notebook for model selection & evaluation         |
|*Other Files*                      |                                                           |
|admspub_datadictionary.csv         | NTSB provided data dictionary                             |


DATA SOURCE
---------------
Link to NTSB Aviation Acccident Data: 
- https://data.ntsb.gov/avdata


ENVIRONMENT
---------------
- python3


HOUSEKEEPING NOTES
---------------
- Make sure all files are stored in a subfolder named 'data' within the same folder as the working Jupyter notebooks.
- The raw files exported from the NTSB dataset is located in the Data/Raw folder and are not needed to run the notebooks
- 'Capstone Project - Pt1of6.ipynb' will require the 'ntsb_08_final.csv' file. You can export the ntsb08_clean.csv from the notebook if you so choose.
- 'Capstone Project - Pt2of6.ipynb' will require the 'ntsb08_clean.csv' file, which you either exported from the previous notebook or can be downloaded. The code from noetbook 2 must be run and the CSV ('ntsb08_model.csv') must be exported. It is too large to host on GitHub and is required for the remaining notebooks. 
- Use the 'ntsb08_model.csv' file for all remaining Jupyter notebooks. 
