# Use official Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app
COPY . .

# Expose port 8080 for DigitalOcean App Platform
EXPOSE 8080

# Set environment variable for production
ENV PYTHONUNBUFFERED=1

# Start FastAPI app with gunicorn
CMD ["gunicorn", "app:app", "-w", "4", "-k", "uvicorn.workers.UvicornWorker"]
