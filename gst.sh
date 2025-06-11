#!/bin/bash
gst-launch-1.0 -v -e \
  nvstreammux name=mux batch-size=1 width=1280 height=720 live-source=0 ! \
  queue ! nvinfer config-file-path=/home/nghiado/Jobs/LabAI/Test_YOLO/config_infer_primary_V8.txt ! \
  queue ! nvdsosd ! \
  nvvideoconvert ! "video/x-raw, format=RGBA" ! \
  fpsdisplaysink video-sink=nveglglessink sync=false \
  filesrc location=/home/nghiado/Jobs/LabAI/Test_YOLO/e.mp4 ! \
  qtdemux name=demux0 demux0.video_0 ! \
  queue ! h264parse ! nvv4l2decoder ! \
  queue ! nvvideoconvert ! "video/x-raw(memory:NVMM), format=NV12, width=1280, height=720" ! mux.sink_0 &
gst-launch-1.0 -v -e \
  nvstreammux name=mux batch-size=1 width=1280 height=720 live-source=0 ! \
  queue ! nvinfer config-file-path=/home/nghiado/Jobs/LabAI/Test_YOLO/config_infer_primary_V8.txt ! \
  queue ! nvdsosd ! \
  nvvideoconvert ! "video/x-raw, format=RGBA" ! \
  fpsdisplaysink video-sink=nveglglessink sync=false \
  filesrc location=/home/nghiado/Jobs/LabAI/Test_YOLO/d.mp4 ! \
  qtdemux name=demux0 demux0.video_0 ! \
  queue ! h264parse ! nvv4l2decoder ! \
  queue ! nvvideoconvert ! "video/x-raw(memory:NVMM), format=NV12, width=1280, height=720" ! mux.sink_0 &
wait