FROM continuumio/miniconda3:4.10.3 as test

# Install api requirements
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy required source files
COPY . .

CMD [ "gunicorn", "-c", "./gunicorn.conf.py", "app:app" ]
