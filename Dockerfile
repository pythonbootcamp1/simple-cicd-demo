FROM python:3.12-slim

WORKDIR /app
RUN apt-get update && apt-get install -y
RUN pip install streamlit
COPY . .
EXPOSE 8501
CMD ["streamlit", "run", "main.py"]