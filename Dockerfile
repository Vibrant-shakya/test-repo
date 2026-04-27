# --- Stage 1: Builder ---
FROM python:3.11-slim AS builder

WORKDIR /build

# Install build dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir --user -r requirements.txt


# --- Stage 2: Final Runtime ---
FROM python:3.11-slim AS runner

# Create a non-privileged user for security
RUN groupadd -g 999 python && \
    useradd -r -u 999 -g python python

WORKDIR /app

# Copy only the installed packages from the builder stage
COPY --from=builder /root/.local /home/python/.local
COPY ./app ./app

# Ensure the app code is owned by our new user
RUN chown -R python:python /app

# Set environment variables
ENV PATH=/home/python/.local/bin:$PATH
ENV PYTHONUNBUFFERED=1

# Switch to non-root user
USER python

# Expose port 8080 as per exercise requirements
EXPOSE 8080

# Run the application
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]