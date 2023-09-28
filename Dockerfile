# Use nvcr.io/nvidia/tensorflow:23.08-tf2-py3 as base
FROM nvcr.io/nvidia/tensorflow:23.08-tf2-py3

# For Python packages, use pip:
RUN pip install --no-cache-dir numpy opencv-python-headless scikit-image pillow matplotlib
