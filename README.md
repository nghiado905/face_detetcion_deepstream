# 🦾 YOLOv8 + DeepStream 7.1 Integration Guide

This guide provides a comprehensive walkthrough to integrate a YOLOv8 model (`best.pt`) with **NVIDIA DeepStream 7.1**, **GStreamer**, and **TensorRT** for high-performance inference on **Ubuntu 22.04**.

---

## 📋 Prerequisites

| Component             | Version/Requirement         |
|-----------------------|-----------------------------|
| Python                | 3.10.12                     |
| DeepStream SDK        | 7.1                         |
| TensorRT              | 10.11.0.33                  |
| CUDA                  | 12.6                        |
| Triton Inference Server | Latest (from official repo) |
| OS                    | Ubuntu 22.04 (Recommended)  |

### Required Dependencies:
- `ultralytics`
- `git`, `make`, `g++`
- [DeepStream-Yolo](https://github.com/marcoslucianops/DeepStream-Yolo)

---

## 🚀 Installation & Setup

### 1️⃣ Clone Repositories and Export YOLOv8 to ONNX


git clone https://github.com/marcoslucianops/DeepStream-Yolo.git
git clone https://github.com/ultralytics/ultralytics.git
cp DeepStream-Yolo/utils/export_yoloV8.py ultralytics/

2️⃣ Build Custom YOLO Inference Plugin
Sao chép
Chỉnh sửa
export CUDA_VER=12.6
make -C DeepStream-Yolo/nvdsinfer_custom_impl_Yolo

3️⃣ Run with DeepStream
bash
Sao chép
Chỉnh sửa
deepstream-app -c config.txt

4️⃣ Run with GStreamer (Optional)
bash
Sao chép
Chỉnh sửa
bash gst.sh

5️⃣ (Optional) Triton Inference Server
bash
Sao chép
Chỉnh sửa
git clone https://github.com/triton-inference-server/server.git
cd server
./build.py -v --enable-gpu --enable-logging --enable-metrics



📚 References
🔗 DeepStream-Yolo GitHub

🔗 YOLOv8 (Ultralytics)

🔗 Triton Inference Server

🔗 NVIDIA DeepStream Documentation
📦 Output Files Structure
├── ultralytics/
├── DeepStream-Yolo/
├── config_infer_primary_V8.txtgst.sh
└── deepstream_config.txt
└── labels.txt
└── libnvdsinfer_custom_impl_Yolo.so
└── model_b1_gpu0_fp32.engine
└── best.pt
└── best.pt.onnx
└── best.pt.onnx


