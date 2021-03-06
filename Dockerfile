# Use the official lightweight Python image.
# https://hub.docker.com/_/python
FROM python:3.8-slim
# Allow statements and log messages to immediately appear in the Knative logs
ENV PYTHONUNBUFFERED True
# Copy local code to the container image.
ARG BUILD_ID
RUN echo $BUILD_ID
ENV BUILD_ID $BUILD_ID
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./

# RUN /bin/bash -c "source ./set_env.sh"
# Install production dependencies.
RUN pip install Flask gunicorn
RUN printenv
# Run the web service on container startup. Here we use the gunicorn
# webserver, with one worker process and 8 threads.
# For environments with multiple CPU cores, increase the number of workers
# to be equal to the cores available.
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 wsgi:app
