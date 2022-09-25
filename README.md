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

REQUIREMENTS
---------------
requirements.txt                                    set up conda environment with necessary packages installed
requirements_manual.txt                             list of packages to install individually (same output as requirements.txt)


FILE LIST
---------------
|File Name                          | Description|
|:----------------------------------|:-----------|
|*Data Files*                       |         |
|castpone_dataset_raw.csv           |Raw dataset after merging NTSB data (available: |
|capstone_dataset_clean.csv         | Clean dataset with Billboard and Spotify data|
|capstone_dataset_artists.csv       | Dataset of artists information|
|capstone_dataset_genre.csv         | Dataset of artists and music genre|
|capstone_dataset_lyrics.csv        | Dataset of song lyrics|
|dataset_webscrape.csv              | Raw data from webscraping billboard.com|
|dataset_kaggle.csv                 | Raw dataset from Kaggle that contains Spotify information and lyrics|
|dataset_dataworld.csv              | Raw dataset from data.world that contains songs with Spotify Track URI|
|*Jupyter Notebooks*                |         |
|BrainStation_Capstone_Pt1of6.ipynb | Jupyter notebook detailing data acquisition|
|BrainStation_Capstone_Pt2of6.ipynb | Jupyter notebook for EDA, Data Transformation, and Feature Engineering|
|BrainStation_Capstone_Pt3of6.ipynb | Jupyter notebook for Logistic Regression modeling|
|BrainStation_Capstone_Pt4of6.ipynb | Jupyter notebook for Decision Tree modeling|
|BrainStation_Capstone_Pt5of6.ipynb | Jupyter notebook for NLP analysis on song lyrics|
|BrainStation_Capstone_Pt6of6.ipynb | Jupyter notebook with various data visualization and analyses|
|*Other Files*                      |
|glossary.pdf                       | Explanation of each feature in the dataset|


DATA SOURCE
---------------
Link to NTSB Aviation Acccident Data: 
- https://data.ntsb.gov/avdata


ENVIRONMENT
---------------
Special packages were installed in order to run queries for this project. Refer to requirements.txt or requirements_manual.txt files 
for instructions on how to install.

- python3


HOUSEKEEPING NOTES
---------------
- Make sure all files are stored in a subfolder named 'data' within the same folder as the working Jupyter notebooks.
- The three files that start with "dataset_" are not needed nor will they be produced from any of the code. They are the raw files 
   before being merged to 'capstone_dataset_raw.csv'. Is is there for reference or verification.
- The code from 'Capstone Project - 2. Data Transformation.ipynb' will require the 'capstone_dataset_raw.csv' file. Once the code runs, 
  the following files will be generated: 'capstone_dataset_clean.csv' and 'capstone_dataset_artists.csv'and 'capstone_dataset_genre.csv'
- The last section of 'Capstone Project - 5. Text Analysis with NLP.ipynb' will save a .pkl file whhich will then be used in the 'Capstone Project - 6. Data Visualization.ipynb' workbook
