# Use official Python image
FROM python:3.11

# Set working directory inside the container (same as /opt/stayinclassy on host)
WORKDIR /opt/stayinclassy

# Copy requirements first to optimize caching
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the project files
COPY . .

# Expose Django's default port
EXPOSE 8000

# Default command to run Django server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
