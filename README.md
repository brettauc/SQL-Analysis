# SQL-Analysis

## Background

Apply SQL skills to analyze historical credit card transactions and consumption patterns in order to identify possible fraudulent transactions.

Three main tasks:

1. [Data Modeling](#Data-Modeling):
Define a database model to store the credit card transactions data and create a new PostgreSQL database using the model.

2. [Data Engineering](#Data-Engineering): Create a database schema on PostgreSQL and populate the database from the CSV files provided.

3. [Data Analysis](#Data-Analysis): Analyze the data to identify possible fraudulent transactions.

---
### Data Modeling

Create an entity relationship diagram (ERD) by inspecting the provided CSV files.

Figure out how many tables to create, as well as what kind of relationships are needed to be defined among the tables.

Use [Quick Database Diagrams](https://app.quickdatabasediagrams.com/#/) to create the model.

### Data Engineering

Using the previously created database model as a blueprint, create a database schema for each of the tables and relationships. Specify data types, primary keys, foreign keys, and any other defined constraints.

After creating the database schema, import the data from the corresponding CSV files.

### Data Analysis

Identify fraudulent transactions using SQL and Pandas DataFrames. Analyze the data and then create a report within a Jupyter Notebook file to present findings. THe report should answer the following questions:

* How can you isolate (or group) the transactions of each cardholder?

* Consider the time period 7:00 a.m. to 9:00 a.m.

  * What are the 100 highest transactions during this time period?

  * Do you see any fraudulent or anomalous transactions?

  * If you answered yes to the previous question, explain why you think there might be fraudulent transactions during this time frame.

* Some fraudsters hack a credit card by making several small payments (generally less than $\$$2.00), which are typically ignored by cardholders. Count the transactions that are less than $2.00 per cardholder. Is there any evidence to suggest that a credit card has been hacked? Explain your rationale.

* What are the top five merchants prone to being hacked using small transactions?

* Once you have a query that can be reused, create a view for each of the previous queries.

Create a report for fraudulent transactions of some top customers of the firm. Perform a visual data analysis of fraudulent transactions using Pandas, Plotly Express, hvPlot, and SQLAlchemy to create the visualizations.

* Verify if there are any fraudulent transactions in the history of two of the most important customers of the firm. For privacy reasons, you only know that their cardholders' IDs are 18 and 2.

  * Using hvPlot, create a line plot representing the time series of transactions over the course of the year for each cardholder. In order to compare the patterns of both cardholders, create a line plot containing both lines.

  * What difference do you observe between the consumption patterns? Does the difference suggest a fraudulent transaction? Explain your rationale.

* The CEO of the firm's biggest customer suspects that someone has used her corporate credit card without authorization in the first quarter of 2018 to pay for several expensive restaurant bills. Find any anomalous transactions during that period.

  * Using Plotly Express, create a series of six box plots, one for each month, in order to identify how many outliers there are per month for cardholder ID 25.

  * Do you notice any anomalies? Describe your observations and conclusions.

### Project Outputs

* Create an image file of your ERD.

* Create a `.sql` file of your table schemata.

* Create a `.sql` file of your queries.

* Create a Jupyter Notebook for the visual data analysis.

---
