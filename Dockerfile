# Use an ultra-lightweight Python base image
FROM python:3.12-slim

# Set system environment paths
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

# Establish a secure app directory
WORKDIR /app

# Copy dependency files and install them
RUN pip install --no-cache-dir uv
COPY pyproject.toml uv.lock ./
RUN python -m uv pip install --system pyyaml streamlit pandas

# Copy your source application code
COPY . .

# Expose the default Streamlit visual interface port
EXPOSE 8501

# Run the UI on launch
CMD ["python", "-m", "uv", "run", "streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]