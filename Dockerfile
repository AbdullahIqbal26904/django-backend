FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
RUN pip3 install --upgrade pip && pip3 install -r requirements.txt

COPY . .

ENV PYTHONUNBUFFERED=1

# Make the entrypoint script executable
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

# Run collectstatic during build time
RUN python3 manage.py collectstatic --noinput

ENTRYPOINT ["./entrypoint.sh"]
CMD ["python3", "-m", "gunicorn", "myproject.wsgi:application", "--bind", "0.0.0.0:8080"]
