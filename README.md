## **Dataset Context**
The dataset used in this application is about mental health, a critical aspect of well-being. It highlights survey-based data about mental health conditions and their prevalence in different locations over time. The data is presented with standardized age-specific prevalence rates for both sexes combined. The analysis of this dataset can provide insights into mental health trends and public health interventions.

The data includes the following variables:
•	Entity (Country/Region): Identifies the country or region being analyzed (e.g., Afghanistan, Albania, Algeria).
•	Code: An abbreviation for the country (e.g., AFG for Afghanistan).
•	Year: The year of data collection, ranging from 1990 to 2019.
•	Prevalence of 5 Mental Health issues (Schizophrenia, Depression, Anxiety, Bipolar, and Eating Disorders)

Persona:
The users of this data set can be public health researchers, policymakers, and the healthcare professionals who work on mental health issues globally. The users may be conducting comparative analyses, epidemiological studies, or interventions to address mental health issues based on the provided data.


Code Description and Analysis
This Shiny application “Mental Health”, is designed to clean and visualize mental health survey data. The code includes three components: the user interface (UI), server logic, and the Shiny app execution. 

1. User Interface (UI)
•	Title Panel: Displays the application title.
•	Sidebar Panel:
•	A fileInput widget to upload a CSV file.
•	Two selectInput widgets to choose the X and Y variables for plotting.
•	A checkboxInput lets users toggle the visibility of the data table.
•	A sliderInput adjusts the sample size displayed and plotted.
•	Main Panel: Contains a tabsetPanel with two tabs:
•	Plot Tab: Displays a scatter plot.
•	Data Table Tab: Displays a cleaned data table.

2. Server Logic
The server logic includes data cleaning, visualization, and user interactions.
Data Cleaning Function
The clean_data function ensures the uploaded dataset is accurate. 
Key cleaning steps include:
•	Missing Value Removal (na.omit.)
•	Duplicate Removal (!duplicated.)
•	Numeric Conversion
•	Outlier Removal

Reactive Dataset
A reactive expression processes the uploaded data file, applying the cleaning function and updating the UI elements. It can ensure that users can immediately work with their dataset after they upload it.
Scatter Plot Generation
The renderPlot function creates a scatter plot using ggplot2. The plot updates based on the user's selected X and Y variables and the sample size. This lets users find relationships between variables visually.
Data Table Rendering
The renderTable function shows a table with the cleaned dataset. Users can change its visibility and the limitation of sample size.

3. Shiny App Execution
At the end, the shinyApp function integrates the UI and server components and launches the interactive application.



