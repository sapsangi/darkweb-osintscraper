FROM python:3.11-slim
RUN apt-get update && apt-get install -y curl git
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
# TorBot and Amass are lightweight enough to run here
RUN git clone https://github.com/DedSecInside/TorBot.git
