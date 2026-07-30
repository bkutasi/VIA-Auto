FROM nvcr.io/nvidia/tensorflow:23.08-tf2-py3

# Install uv and sync project dependencies
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv
COPY pyproject.toml uv.lock ./
RUN uv sync --frozen --no-dev
