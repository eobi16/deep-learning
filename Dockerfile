# Use an official Python runtime as a parent image
FROM python:3.9-slim-buster

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
# This includes fastapi, uvicorn, pandas, joblib, and xgboost
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port your app runs on
EXPOSE 8000

# Define environment variable for the FastAPI app
ENV PYTHONPATH=/app

# Run the Uvicorn server when the container launches
# Assuming your FastAPI app instance is named 'app' in 'main.py'
# You might need to change 'main:app' to 'your_app_file_name:app' if different
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
