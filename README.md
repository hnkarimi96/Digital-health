# **Mental Health Data Shiny App**

This repository contains a Shiny app for visualizing and analyzing mental health survey data. It provides tools to clean the data, generate scatter plots, and display a cleaned data table.

## **Dataset Context**
The dataset used in this application is about mental health, a critical aspect of well-being. It highlights survey-based data about mental health conditions and their prevalence in different locations over time. The data is presented with standardized age-specific prevalence rates for both sexes combined. The analysis of this dataset can provide insights into mental health trends and public health interventions.

The data includes the following variables:
- **Entity (Country/Region)**: Identifies the country or region being analyzed (e.g., Afghanistan, Albania, Algeria).
- **Code**: An abbreviation for the country (e.g., AFG for Afghanistan).
- **Year**: The year of data collection, ranging from 1990 to 2019.
- **Prevalence of 5 Mental Health issues**: (Schizophrenia, Depression, Anxiety, Bipolar, and Eating Disorders).

## **Persona**
The users of this dataset can be public health researchers, policymakers, and healthcare professionals who work on mental health issues globally. They may be conducting comparative analyses, epidemiological studies, or interventions to address mental health issues based on the provided data.

## **Code Description and Analysis**
# Mental Health Shiny Application

This Shiny application, **Mental Health**, is designed to clean and visualize mental health survey data.

## 1. User Interface (UI)

The User Interface (UI) includes the following elements:

- **Title Panel:** Displays the application title.
- **Sidebar Panel:**
  - A `selectInput` dropdown for filtering data by **Country**.
  - Two `selectInput` widgets to choose the X and Y variables for plotting.
  - A `checkboxInput` that lets users toggle the visibility of the data table.
  - A `sliderInput` to adjust the sample size displayed and plotted.
- **Main Panel:** Contains a `tabsetPanel` with two tabs:
  - **Plot Tab:** Displays a scatter plot.
  - **Data Table Tab:** Displays a cleaned data table.

## 2. Server Logic

The server logic includes data cleaning, visualization, and user interactions.

### Data Cleaning Function

The `clean_data` function ensures the uploaded dataset is accurate. Key cleaning steps include:

- **Missing Value Removal** (`na.omit.`)
- **Duplicate Removal** (`!duplicated.`)
- **Numeric Conversion**
- **Outlier Removal**

### Reactive Dataset

A reactive expression loads and processes the preloaded dataset (`default_data.csv`), applying the cleaning function and updating the UI elements. It also filters the dataset based on the selected country, ensuring that the user can immediately work with relevant data.

### Scatter Plot Generation

The `renderPlot` function creates a scatter plot using `ggplot2`. The plot updates based on the user's selected X and Y variables, country selection, and the sample size. This allows users to find relationships between variables visually.

### Data Table Rendering

The `renderTable` function shows a table with the cleaned and filtered dataset based on the selected country. Users can toggle its visibility and limit the sample size displayed.

## 3. Shiny App Execution

At the end, the `shinyApp` function integrates the UI and server components and launches the interactive application.


## **🎉 The Shiny App Deployment**

The deployment of the Shiny app is accessible at the link below:

🔗 **[My Shiny App](https://haniehkarimi.shinyapps.io/mental_health/)**

## **Running the App**

Once the required libraries are installed, run the following code to launch the app:

```r
shinyApp(ui = ui, server = server)
