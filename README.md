# 🦾 YOLOv8 + DeepStream 7.1 Integration Guide

This guide provides a comprehensive walkthrough to integrate a YOLOv8 model (`best.pt`) with **NVIDIA DeepStream 7.1**, **GStreamer**, and **TensorRT** for high-performance inference on **Ubuntu 22.04**.

---

📋 Prerequisites

| Component             | Version/Requirement         |
|-----------------------|-----------------------------|
| Python                | 3.10.12                     |
| DeepStream SDK        | 7.1                         |
| TensorRT              | 10.11.0.33                  |
| CUDA                  | 12.6                        |
| Triton Inference Server | Latest (from official repo) |
| OS                    | Ubuntu 22.04 (Recommended)  |

🚀 Installation & Setup

### 1️⃣ Clone Repositories and Export YOLOv8 to ONNX

git clone https://github.com/marcoslucianops/DeepStream-Yolo.git
git clone https://github.com/ultralytics/ultralytics.git
cp DeepStream-Yolo/utils/export_yoloV8.py ultralytics/

2️⃣ Build Custom YOLO Inference Plugin
## Set CUDA version environment variable
export CUDA_VER=12.6

## Compile the custom DeepStream YOLO plugin
make -C DeepStream-Yolo/nvdsinfer_custom_impl_Yolo


3️⃣ Run with DeepStream
## Run the DeepStream pipeline using your config file
deepstream-app -c config.txt


4️⃣ Run with GStreamer (Optional)
### Run GStreamer pipeline script
bash gst.sh



5️⃣ (Optional) Triton Inference Server
### Clone Triton Inference Server repository
git clone https://github.com/triton-inference-server/server.git

### Enter the server directory
cd server

### Build Triton with GPU, logging, and metrics enabled
./build.py -v --enable-gpu --enable-logging --enable-metrics





📚 References
🔗 DeepStream-Yolo GitHub

🔗 YOLOv8 (Ultralytics)

🔗 Triton Inference Server

🔗 NVIDIA DeepStream Documentation
