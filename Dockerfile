FROM python:3.12-slim AS builder

WORKDIR /app
RUN pip install --no-cache-dir --user streamlit

FROM python:3.12-slim

WORKDIR /app
COPY --from=builder /root/.local /root/.local
COPY . .
ENV PATH=/root/.local/bin:$PATH
EXPOSE 8501
CMD ["streamlit", "run", "main.py"]