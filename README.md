# Automated VGG Image Annotator (VIA)

## Overview
This project is a backend implementation that automates the annotation function of VGG Image Annotator (VIA). It uses a trained neural network for inference, which significantly reduces the manual effort required in image annotation.

## Features
- **Automated Annotation**: The main feature of this project is to automate the process of image annotation. It uses a trained neural network model to predict annotations for a given image.
- **Integration with VIA**: This project is designed and tested to work with VGG Image Annotator (VIA).
- **Specific domains**: Currently only the heart slices dataset is supported shown in the demo.
- **Client side**: VIA run entirely on the clients browser. This makes deployment very easily manageable with serverless architecture. An inference server is needed for VIA-Auto to work.
  
## Getting Started
To get started with this project, clone the repository and install the necessary dependencies.

Clone this repo
```bash
git clone https://github.com/bkutasi/VIA-Auto
```
Create an environment folder.
```bash
python3 -m venv env
```

Activate it
```bash
.\env\Scripts\activate
```

Install dependencies
```bash
pip install -r requirements.txt
```
## Contributing
Contributions are welcome! Please read our contributing guidelines before starting.

## Disclaimer
Since the original dataset seen in the demo was produced by [SOTE](https://semmelweis.hu/english/) researchers I wont release it. The documentation will contain everything you need to train your datasets besides bundled ones that are coming later.

## Plans
- **Full client side**: VIA-Auto to run entirely on the client with WASM Tensorflow.js integration thus becoming part of the VIA package.
- **VIA enhancements**: VIA will be extended by some simple quality of life features that are deemed necessary.

## License
This project is licensed under the terms of the GPLv3 license.