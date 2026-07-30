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

A Dockerfile is provided based on the NVIDIA TensorFlow container:

```bash
docker build -t via-auto .
docker run -it --rm --gpus all -v $(pwd):/workspace -w /workspace via-auto
```

Alternatively, pull the base image directly:

```bash
docker pull nvcr.io/nvidia/tensorflow:23.08-tf2-py3
```

### Using a virtual environment

Clone this repo (with submodules):

```bash
git clone --recurse-submodules https://github.com/bkutasi/VIA-Auto
```

Create and activate a virtual environment:

```bash
python3 -m venv env
source env/bin/activate  # Linux/macOS
# .\env\Scripts\activate  # Windows
```

Install dependencies:

```bash
pip install -r requirements.txt
```

### Training

See `notebooks/simplified_model_training_showcase.ipynb` for a walkthrough of training a U-Net model on the heart slices dataset. Update the data path in the notebook to point to your local copy of the dataset.

## Contributing
Contributions are welcome! Please read our contributing guidelines before starting.

## Disclaimer
Since the original dataset seen in the demo was produced by [SOTE](https://semmelweis.hu/english/) researchers I wont release it. The documentation will contain everything you need to train your datasets besides bundled ones that are coming later.

## Plans
- **Full client side**: VIA-Auto to run entirely on the client with WASM Tensorflow.js integration thus becoming part of the VIA package.
- **VIA enhancements**: VIA will be extended by some simple quality of life features that are deemed necessary.

## License
This project is licensed under the terms of the GPLv3 license.