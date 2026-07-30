# Automated VGG Image Annotator (VIA)

## Overview
This project is a backend implementation that automates the annotation function of VGG Image Annotator (VIA). It uses a trained neural network for inference, which significantly reduces the manual effort required in image annotation.

## Features
- **Automated Annotation**: Uses a trained neural network model to predict annotations for a given image.
- **Integration with VIA**: Designed and tested to work with VGG Image Annotator (VIA).
- **Specific domains**: Currently only the heart slices dataset is supported (shown in the demo).
- **Client side**: VIA runs entirely in the browser. An inference server is needed for VIA-Auto to work.
  
## Prerequisites
- Python 3.11+
- For GPU training: an NVIDIA GPU with CUDA support
- For the PyTorch notebook: mixed precision (AMP) requires a CUDA-capable GPU

## Getting Started

### Using Docker

A Dockerfile is provided with Python 3.12 and PyTorch (CPU). For GPU, use `--gpus all` with an NVIDIA Container Toolkit-equipped Docker:

```bash
docker build -t via-auto .
docker run -it --rm -p 8888:8888 via-auto          # CPU
docker run -it --rm --gpus all -p 8888:8888 via-auto  # GPU
```

This launches a Jupyter notebook server on port 8888.

For the TensorFlow variant, modify the Dockerfile to use `--extra tensorflow` instead.

### Local setup (uv)

[uv](https://docs.astral.sh/uv/) is used for dependency management. Install it if you don't have it:

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

Clone this repo (with submodules):

```bash
git clone --recurse-submodules https://github.com/bkutasi/VIA-Auto
cd VIA-Auto
```

Install dependencies with the PyTorch stack (default):

```bash
uv sync --extra pytorch --extra dev
```

Or with TensorFlow:

```bash
uv sync --extra tensorflow --extra dev
```

This creates a `.venv/` with all dependencies locked in `uv.lock`. Activate it with `source .venv/bin/activate` or run commands directly via `uv run` (e.g. `uv run jupyter notebook`).

### Training

Two notebooks are provided:

- `notebooks/pytorch_training_showcase.ipynb` — recommended, optimized PyTorch implementation with mixed precision, proper IoU metric, and 3-way data split
- `notebooks/simplified_model_training_showcase.ipynb` — original TensorFlow/Keras implementation

Update the `DATA_PATH` variable in either notebook to point to your local copy of the dataset. The dataset is a NumPy array of shape `(N, 224, 224, 7)`: channels 0-2 are the RGB image, channels 3-6 are the segmentation masks.

## Contributing
Contributions are welcome! Feel free to open issues or pull requests.

## Disclaimer
The original heart slices dataset was produced by [SOTE](https://semmelweis.hu/english/) researchers and is not publicly released. Use your own dataset in the same format, or wait for bundled sample datasets.

## License
This project is licensed under the terms of the GPLv3 license. The bundled [VIA](https://github.com/ox-vgg/via) submodule is BSD-licensed.