# Use a base Python image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Install dependencies for mysqlclient and others
RUN apt-get update && \
    apt-get install -y \
    libmariadb-dev \
    pkg-config \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy the Flask app code to the container
COPY . /app

# Install necessary Python dependencies
RUN pip install -r requirements.txt

# Expose the port that Flask will run on
EXPOSE 5000

# Set the environment variables for Flask
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Run the Flask app
CMD ["flask", "run"]
