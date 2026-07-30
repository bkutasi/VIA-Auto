FROM python:3.12-slim

# System dependencies for torch and opencv
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgomp1 libgl1 libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

# Copy dependency files and install
COPY pyproject.toml uv.lock ./
RUN uv sync --frozen --extra pytorch --extra dev

# Copy project source
COPY . .

EXPOSE 8888

# Run jupyter by default
CMD ["uv", "run", "jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
