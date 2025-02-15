# git checkout e758b77161a7

if [ ! -d "build" ]; then
  mkdir build
fi

cd build

cmake -DLLVM_TARGET_ARCH="AArch64" \
  -DLLVM_TARGETS_TO_BUILD="ARM;X86;AArch64" \
  -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=WebAssembly \
  -DCMAKE_BUILD_TYPE=Release \
  -DLLVM_ENABLE_PROJECTS="clang;lld" \
  -G "Unix Makefiles" \
  ../llvm

make -j$(nproc)
