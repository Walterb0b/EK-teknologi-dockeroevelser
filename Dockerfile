FROM python:3.12-alpine
WORKDIR /app
COPY index.html .
CMD ["python", "-m", "httpserver", "8000"]
