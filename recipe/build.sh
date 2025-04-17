#!/bin/sh

# Required by apple SDK symbol check: https://conda-forge.org/docs/maintainer/knowledge_base/#newer-c-features-with-old-sdk
CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"

cmake -S . -B build ${CMAKE_ARGS} \
  -DCMAKE_PREFIX_PATH=$PREFIX \
  -DCMAKE_BUILD_TYPE=Release \
  -DBUILD_PINOCCHIO_VISUALIZER=ON \
  -DBUILD_PYTHON_BINDINGS=ON \
  -DBUILD_EXAMPLES=OFF \
  -DBUILD_TESTING=OFF

cmake --build build --config Release -j${CPU_COUNT}

cmake --install build --config Release
