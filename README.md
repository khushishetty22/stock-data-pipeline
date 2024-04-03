# stock-data-pipeline
This project develops an automated ELT pipeline using Python, Alteryx, and Azure services for daily stock data processing. It ensures efficient data flow to Power BI for in-depth analysis and reporting.

This project integrates various Azure cloud services and data processing tools to establish an automated pipeline for the extraction, loading, transforming (ELT), and visualization of financial data. The project's objective is to streamline the monitoring and analysis of stock market trends and company financials over a ten-year period.

The project leverages several technologies and platforms to construct the ELT pipeline:
Azure Functions were implemented to automate the retrieval of historical stock data, sourced from the yfinance library, for indexes and companies over the previous decade. This Python-based function is scheduled to run daily and stores the extracted data in CSV format on Azure Blob Storage within a container named 'cont-output'.
Alteryx is utilized for data cleansing and transformation. Financial data files for four major companies such as Apple, Microsoft, Amazon, and META were processed. These files, represent annual and quarterly balance sheets and income statements and were sourced from Yahoo Finance Plus. The Alteryx workflows, specifically tailored for each financial statement type, were designed to ensure accurate data structuring.
Logic Apps orchestrates the workflow, scheduling the Azure Functions and managing data updates. With its configuration, it monitors the modifications in the dataset, triggering notifications upon successful updates.
The data are persisted in Blob Storage, which acts as a data lake, holding the CSV files. Daily data is managed by Azure Functions, and Alteryx manages quarterly and annual updates.
Azure Synapse Analytics plays a pivotal role in loading the CSV files from blob storage into SQL tables. Through a dedicated SQL pool, the data undergoes further transformations, ensuring it is primed for analysis.



