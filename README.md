# This Repository
This repository is a minimal example of building onnxruntime as a static cmake config module with externally packaged dependencies. vcpkg is used for the dependencies. The code is from https://github.com/microsoft/onnxruntime-inference-examples.

Port notes:
- Need to use Onnx >= 1.16 which isn't currently on the vcpkg mainline so it's overriden here
- Need to use non-release version of eigen so it's overriden

# Build Commands
```
cmake . -B build -DCMAKE_TOOLCHAIN_FILE=YOUR_VCPKG_INSTALL/scripts/buildsystems/vcpkg.cmake
```
or, for windows,
```
cmake . -B build -DCMAKE_TOOLCHAIN_FILE=YOUR_VCPKG_INSTALL/scripts/buildsystems/vcpkg.cmake -DVCPKG_TARGET_TRIPLET=x64-windows-static
```
then
```
cmake --build build
```


The following is the README from the original candy style transfer demo....

# FNS Candy
FNS Candy is a style transfer model. In this sample application, we use the ONNX Runtime C API to process an image using the FNS Candy model in ONNX format.

# Build Instructions
See [../README.md](../README.md)

# Prepare data
First, download the FNS Candy ONNX model from [here](https://raw.githubusercontent.com/microsoft/Windows-Machine-Learning/master/Samples/FNSCandyStyleTransfer/UWP/cs/Assets/candy.onnx).

Then, prepare an image:
1. PNG format
2. Dimension of 720x720

# Run
Command to run the application:
```
fns_candy_style_transfer.exe <model_path> <input_image_path> <output_image_path> [cpu|cuda|dml]
```

To use the CUDA or DirectML execution providers, specify `cuda` or `dml` on the command line. `cpu` is the default.
