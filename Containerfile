FROM docker.io/library/python:3.12.4-slim
WORKDIR /usr/src/app/

RUN python -m venv ./venv
ENV PATH="/usr/src/app/venv/bin/:$PATH"
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .
EXPOSE 8080
CMD ["gunicorn", "--config", "gunicorn_config.py", "app:app"]
