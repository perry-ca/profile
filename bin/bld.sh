#!/usr/env bash
base=/data/perry/llvm
#comp_dir=/usr/lpp/IBM/oelcpp/v2r0
comp_dir=/usr/lpp/IBM/cnw/v2r1/openxl
rm -rf $base/build
[[ -d $base/build ]] || mkdir -p $base/build
cd $base/build
cmake --trace -G Ninja -DCMAKE_BUILD_TYPE=Release \
 -DCMAKE_C_COMPILER=$comp_dir/bin/ibm-clang \
 -DCMAKE_CXX_COMPILER=$comp_dir/bin/ibm-clang++ \
 -DCMAKE_INSTALL_PREFIX=$base/install \
 -DLLVM_ENABLE_PROJECTS="clang;llvm" \
 -DLLVM_ENABLE_ASSERTIONS=On \
 -DLLVM_ENABLE_RUNTIMES=compiler-rt \
 -DLLVM_TARGET_TRIPLE_ENV=LLVM_DEFAULT_TARGET_TRIPLE \
 -DLLVM_APPEND_VC_REV=OFF \
 -DLLVM_TOOL_GOLD_BUILD=0 \
 -DLLVM_ENABLE_WERROR=On \
 $base/llvm-project/llvm

