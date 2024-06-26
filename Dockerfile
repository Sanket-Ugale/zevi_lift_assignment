# Use an official Python runtime as a parent image
FROM python:3.11

# Set the working directory in the container
WORKDIR /lift

# Copy the local requirements file to the container
COPY requirements.txt .
RUN pip install django
RUN pip install --no-cache-dir -r requirements.txt
COPY . /lift/
EXPOSE 80

# Define environment variable
ENV NAME World

# Start a new tmux session and run Django and Celery
CMD ["bash", "-c", "python manage.py runserver 0.0.0.0:80"]
