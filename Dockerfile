# Pull base image 
FROM python:3.11.4-alpine

# Set work directory 
WORKDIR /usr/src/app

# Set environment variables 
# prevent pip to check its version for upgrade
# ENV PIP_DISABLE_PIP_VERSION_CHECK 1 
# prevent python from writing .pyc files
ENV PYTHONDONTWRITEBYTECODE 1 
# ensure python output is sent directly to the terminal without buffering
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip

# Install dependencies 
COPY ./requirements.txt /usr/src/app/requirements.txt

RUN pip install -r requirements.txt



COPY ./entrypoint.sh /usr/src/app/entrypoint.sh

# Copy project 
COPY . /usr/src/app/

ENTRYPOINT [ "/usr/src/app/entrypoint.sh" ]