🦾 YOLOv8 + DeepStream 7.1 Integration Guide

This guide provides a step-by-step walkthrough for integrating a YOLOv8 model (best.pt) with NVIDIA DeepStream 7.1, GStreamer, and TensorRT for high-performance inference on Ubuntu 22.04.

📋 Prerequisites

Ensure the following components are installed and configured on your system:







Component



Version/Requirement





Python



3.10.12





DeepStream SDK



7.1





TensorRT



10.11.0.33





CUDA



12.6





Triton Inference Server



Latest (from official repo)





Operating System



Ubuntu 22.04 (Recommended)

🚀 Installation & Setup

Follow these steps to set up and run the YOLOv8 model with DeepStream 7.1.

1️⃣ Clone Repositories and Export YOLOv8 to ONNX

Clone the necessary repositories and copy the YOLOv8 export script to the Ultralytics directory:

# Clone required repositories
git clone https://github.com/marcoslucianops/DeepStream-Yolo.git
git clone https://github.com/ultralytics/ultralytics.git

# Copy the YOLOv8 export script to the Ultralytics directory
cp DeepStream-Yolo/utils/export_yoloV8.py ultralytics/

2️⃣ Build Custom YOLO Inference Plugin

Set the CUDA version and compile the custom DeepStream YOLO plugin:

# Set CUDA version environment variable
export CUDA_VER=12.6

# Compile the custom DeepStream YOLO plugin
make -C DeepStream-Yolo/nvdsinfer_custom_impl_Yolo

3️⃣ Run with DeepStream

Run the DeepStream pipeline using your configuration file:

# Run the DeepStream pipeline using your config file
deepstream-app -c config.txt

4️⃣ Run with GStreamer (Optional)

Execute the GStreamer pipeline script if needed:

# Run GStreamer pipeline script
bash gst.sh

5️⃣ Set Up Triton Inference Server (Optional)

Set up and build the Triton Inference Server for advanced inference needs:

# Clone Triton Inference Server repository
git clone https://github.com/triton-inference-server/server.git

# Navigate to the server directory
cd server

# Build Triton with GPU, logging, and metrics enabled
./build.py -v --enable-gpu --enable-logging --enable-metrics

📚 References





🔗 DeepStream-Yolo GitHub



🔗 YOLOv8 (Ultralytics)



🔗 Triton Inference Server



🔗 NVIDIA DeepStream Documentation

📝 Notes





Verify that all prerequisites are installed and compatible with your system before starting.



Replace config.txt with the actual path to your DeepStream configuration file.



The GStreamer and Triton Inference Server steps are optional and can be skipped if not required for your use case.



For additional support, consult the official documentation or open an issue in the respective repositories.
