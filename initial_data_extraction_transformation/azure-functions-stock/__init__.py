import logging
import azure.functions as func
from azure.identity import DefaultAzureCredential
from azure.storage.blob import BlobServiceClient, BlobClient
import yfinance as yf
from datetime import datetime, timedelta
from io import StringIO
#import json
#import os

def main(req: func.HttpRequest) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')
    
    try:
        # Initialize DefaultAzureCredential for Managed Identity
        credential = DefaultAzureCredential()
        account_url = "https://storestockanalysis.blob.core.windows.net"
        blob_service_client = BlobServiceClient(account_url=account_url, credential=credential)
        
        # Specifing the container name here
        container_name = "cont-output"


        # Delete existing files in the container
        container_client = blob_service_client.get_container_client(container_name)
        blobs_list = container_client.list_blobs()
        for blob in blobs_list:
            if blob.name.startswith('function_'):  
                container_client.delete_blob(blob.name)
                logging.info(f"Deleted old CSV file: {blob.name}")

        # Define the indexes and time period
        indexes = ["^GSPC", "^DJI", "^IXIC", "^RUT", "^W5000"]
        companies = ["AAPL", "MSFT", "AMZN", "META"]

        today = datetime.today().date()
        ten_years_ago = today - timedelta(days=365*10)

        # Download data
        company_data = yf.download(companies, start=ten_years_ago, end=today)["Adj Close"]
        data = yf.download(indexes, start=ten_years_ago, end=today)["Adj Close"]
        volume_data = yf.download(companies, start=ten_years_ago, end=today)["Volume"]

        # Remove "^" from column names in data (indexes)
        data.columns = [col.lstrip("^") for col in data.columns]

        # Function to convert data to CSV and upload
        def convert_and_upload(data, blob_name_prefix):
            csv_output = StringIO()
            data.to_csv(csv_output, index=True)
            csv_output.seek(0)

            blob_name = f"function_{blob_name_prefix}.csv"
            blob_client = blob_service_client.get_blob_client(container=container_name, blob=blob_name)
            
            blob_client.upload_blob(csv_output.getvalue(), overwrite=True)
            logging.info(f"Uploaded new CSV file: {blob_name}")

        # Convert and upload index data
        convert_and_upload(data, "index_data")
        # Convert and upload company data
        convert_and_upload(company_data, "company_data")
        # Convert and upload volume data
        convert_and_upload(volume_data, "volume_data")


        return func.HttpResponse(f"CSV files uploaded successfully to container {container_name}.", status_code=200)

    except Exception as e:
        logging.error(f'Error: {e}')
        return func.HttpResponse(f"Error: {e}", status_code=500)
