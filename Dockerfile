FROM python:3.12-alpine3.23

ENV PYTHONUNBUFFERED=1

WORKDIR /app
EXPOSE 8000

COPY ./requirements.txt .
COPY ./requirements.dev.txt .

ARG DEV=false
RUN pip install --upgrade pip && \
    apk add --update --no-cache postgresql-client && \
    apk add --update --no-cache --virtual .tmp-build-deps \
        build-base postgresql-dev musl-dev && \
    pip install --no-cache-dir -r requirements.txt && \
    if [ $DEV = "true" ] ; \
        then pip install --no-cache-dir -r requirements.dev.txt ; \
    fi && \
    apk del .tmp-build-deps




COPY ./app /app