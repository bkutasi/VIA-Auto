FROM python:3.12-slim

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

# Copy dependency files and install
COPY pyproject.toml uv.lock ./
RUN uv sync --frozen --extra pytorch

# Copy project source
COPY . .

# Run jupyter by default
CMD ["uv", "run", "jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
