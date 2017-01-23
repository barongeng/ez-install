#!/bin/bash
git clone https://github.com/xianyi/OpenBLAS.git /tmp/OpenBLAS
cd /tmp/OpenBLAS 
if [ $(getconf _NPROCESSORS_CONF) == 1 ]; then
  make NO_AFFINITY=1 USE_OPENMP=0 USE_THREAD=0 -j32
else
  make NO_AFFINITY=1 USE_OPENMP=1 -j32
fi
sudo make PREFIX=/usr install
if [ $? -ne 0 ]; then
  echo "Error: OpenBLAS could not be installed"
  exit 1
fi
# clone caffe source code
cd ~/ && git clone https://github.com/BVLC/caffe
cd caffe
# install deps and build caffe
curl https://bootstrap.pypa.io/get-pip.py | python
bash scripts/travis/install-deps.sh
bash scripts/travis/install-python-deps.sh
bash scripts/travis/configure.sh
bash scripts/travis/setup-venv.sh
bash scripts/travis/configure.sh
bash scripts/travis/build.sh
bash scripts/travis/test.sh

echo "Done!"
