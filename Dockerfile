FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libsndfile1 \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Poetry
RUN pip install --no-cache-dir poetry==1.7.1

# Copy only requirements files first for better layer caching
COPY pyproject.toml poetry.toml ./
COPY install_git_deps.sh ./

# Install Python dependencies
RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction \
    && chmod +x ./install_git_deps.sh \
    && ./install_git_deps.sh

# Copy application code
COPY . .

# Set environment variables
ENV PYTHONPATH=/app

CMD ["bash"] 