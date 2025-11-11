FROM python:3.10-slim

WORKDIR /root/

RUN apt-get update && apt-get install -y --no-install-recommends gcc build-essential 

COPY requirements.txt .

RUN pip install -U pip && pip install -U -r requirements.txt

COPY . .

CMD gunicorn app:app & python3 bot.py
