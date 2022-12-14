FROM python:3.9

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install pip requirements
COPY requirements.txt .
RUN python -m pip install -r requirements.txt

WORKDIR /iot_sm
COPY . /iot_sm

EXPOSE 8000
EXPOSE 2022
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]