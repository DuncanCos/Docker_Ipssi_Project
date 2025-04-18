FROM alpine:3.19

RUN apk add --no-cache python3 py3-pip
WORKDIR /app
RUN python3 -m venv venv
RUN ./venv/bin/pip install --upgrade pip && ./venv/bin/pip install flask && ./venv/bin/pip install mysql-connector-python

COPY src/ /app/


EXPOSE 5000
CMD ["./venv/bin/python", "app.py"]
