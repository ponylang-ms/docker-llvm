#!/usr/bin/env bash

# Stop script if any individual command fails.
set -e

# Define LLVM version.
llvm_version=$1
echo "Building LLVM ${llvm_version}"

# Define dependencies.
ponyc_deps="make g++ git zlib1g-dev libncurses5-dev libssl-dev libpcre2-dev"
build_deps="wget xz-utils cmake python"

# Fetch dependencies.
apt-get update
apt-get install -y $build_deps $ponyc_deps

# Fetch and extract LLVM source.
mkdir /src && pushd /src
wget "http://llvm.org/releases/${llvm_version}/llvm-${llvm_version}.src.tar.xz"
tar xvf "llvm-${llvm_version}.src.tar.xz"
cd "llvm-${llvm_version}.src"

# Build and install LLVM from source.
mkdir build && cd build
cmake .. && cmake --build .
cmake --build . --target install

# Cleanup LLVM source directory.
rm -rf /src

# Cleanup build dependencies and apt cache.
apt-get remove -y $build_deps
apt autoremove -y
rm -rf /var/lib/apt/lists/*
