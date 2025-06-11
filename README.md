YOLOv8 DeepStream Integration Guide
This guide provides a comprehensive walkthrough for integrating a YOLOv8 model (best.pt) with NVIDIA DeepStream 7.1 and GStreamer, leveraging TensorRT for optimized inference. Follow the steps to export the model, build necessary libraries, configure pipelines, and run inference on your system.

Prerequisites
Ensure your system meets the following requirements:

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
Latest (cloned from official repository)

OS
Ubuntu (22.04 recommended)

Dependencies
ultralytics, git, make, g++, DeepStream-Yolo repo


Installation and Setup
1. Clone Repositories and Prepare Model
Clone the required repositories and copy the export script to the ultralytics directory.
git clone https://github.com/marcoslucianops/DeepStream-Yolo.git
git clone https://github.com/ultralytics/ultralytics.git
cp DeepStream-Yolo/utils/export_yoloV8.py ultralytics/

Export the YOLOv8 model (best.pt) to ONNX format:
cd ultralytics
python3 export_yoloV8.py -w best.pt

Output: best.onnx will be generated in the current directory.
2. Build Custom Inference Library
Compile the custom YOLO inference plugin for DeepStream:
export CUDA_VER=12.6
make -C DeepStream-Yolo/nvdsinfer_custom_impl_Yolo

Output: libnvdsinfer_custom_impl_Yolo.so will be created in the DeepStream-Yolo/nvdsinfer_custom_impl_Yolo directory.
3. Configure DeepStream and GStreamer
Update the DeepStream configuration file (config_infer_primary_V8.txt) to point to the exported best.onnx model. This ensures the TensorRT engine is built automatically during runtime.


4. Run DeepStream
Execute the DeepStream application with the configuration file:
deepstream-app -c config.txt

Note: Ensure config.txt references config_infer_primary_V8.txt and other necessary pipeline settings.
5. Run GStreamer
Run the GStreamer pipeline using the provided script:
bash gst.sh

6. Triton Inference Server (Optional)
For advanced use cases, set up the Triton Inference Server:
git clone https://github.com/triton-inference-server/server.git
cd server
./build.py -v --enable-gpu --enable-logging --enable-metrics

References
YOLOv8 DeepStream TRT Jetson Wiki
DeepStream-Yolo GitHub
Triton Inference Server
