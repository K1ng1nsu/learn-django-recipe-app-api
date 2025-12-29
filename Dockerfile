FROM python:3.12-alpine3.23

ENV PYTHONUNBUFFERED=1

WORKDIR /app
EXPOSE 8000

COPY ./requirements.txt .
COPY ./requirements.dev.txt .

ARG DEV=false
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt && \
    if [ $DEV = "true" ] ; \
        then pip install --no-cache-dir -r requirements.dev.txt ; \
    fi 

COPY ./app /app