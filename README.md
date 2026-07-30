# Automated VGG Image Annotator (VIA)

## Overview
This project is a backend implementation that automates the annotation function of VGG Image Annotator (VIA). It uses a trained neural network for inference, which significantly reduces the manual effort required in image annotation.

## Features
- **Automated Annotation**: The main feature of this project is to automate the process of image annotation. It uses a trained neural network model to predict annotations for a given image.
- **Integration with VIA**: This project is designed and tested to work with VGG Image Annotator (VIA).
- **Specific domains**: Currently only the heart slices dataset is supported shown in the demo.
- **Client side**: VIA run entirely on the clients browser. This makes deployment very easily manageable with serverless architecture. An inference server is needed for VIA-Auto to work.
  
## Getting Started

### Using Docker

A Dockerfile is provided with Python 3.12 and PyTorch:

```bash
docker build -t via-auto .
docker run -it --rm -p 8888:8888 via-auto
```

This launches a Jupyter notebook server on port 8888. For GPU support, add `--gpus all`.

For the TensorFlow variant, install with `uv sync --extra tensorflow` instead.

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
uv sync --extra pytorch
```

Or with TensorFlow:

```bash
uv sync --extra tensorflow
```

This creates a `.venv/` with all dependencies locked in `uv.lock`. Activate it with `source .venv/bin/activate` or run commands directly via `uv run` (e.g. `uv run jupyter notebook`).

### Training

Two notebooks are provided:

- `notebooks/pytorch_training_showcase.ipynb` — recommended, optimized PyTorch implementation with mixed precision, proper IoU metric, and 3-way data split
- `notebooks/simplified_model_training_showcase.ipynb` — original TensorFlow/Keras implementation

Update the data path in either notebook to point to your local copy of the dataset.

## Contributing
Contributions are welcome! Feel free to open issues or pull requests.

## Disclaimer
Since the original dataset seen in the demo was produced by [SOTE](https://semmelweis.hu/english/) researchers I wont release it. The documentation will contain everything you need to train your datasets besides bundled ones that are coming later.

## Plans
- **Full client side**: VIA-Auto to run entirely on the client with WASM Tensorflow.js integration thus becoming part of the VIA package.
- **VIA enhancements**: VIA will be extended by some simple quality of life features that are deemed necessary.

## License
This project is licensed under the terms of the GPLv3 license.