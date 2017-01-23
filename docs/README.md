# Easy Install

这个repo主要是帮助大家快速高效地安装常用库, 帮助大家节省时间. 有时候正事还没开始做安装一些工具弄得焦头烂额, 这样的体验简直不要太伤心.

## OpenCV
`install-opencv.sh`这个shell脚本用来从源码安装[OpenCV](http://opencv.org/)库. 主要前面一部分

    sudo apt-get install -y build-essential cmake
    sudo apt-get install -y libvtk6-dev qt5-default
    sudo apt-get install -y zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev libopenexr-dev libgdal-dev
    ...

这些是在安装opencv所需的一些依赖库和build OpenCV所需的一些工具.

然后`wget https://github.com/opencv/opencv/archive/3.2.0.zip`这里是在从github下载OpenCV源码, 国内的朋友们从github下载有点慢的话, 我有一个备选的源但是注释了, 你可以换上`wget http://data-10045577.cos.myqcloud.com/opencv-3.2.0.zip`.

最后在CMAKE的时候有很多选项:`cmake -DWITH_IPP=OFF -DWITH_CUDA=OFF -DWITH_QT=OFF -DWITH_OPENGL=ON -DFORCE_VTK=ON -DWITH_TBB=ON -DWITH_OPENMP=ON -DWITH_GDAL=OFF -DWITH_XINE=ON -DBUILD_EXAMPLES=OFF  BUILD_DOCS=OFF ..`, 这里我关了很多, 因为我发现平常不太用. 特别是`cuda`我建议关掉, 因为编译起来太慢而且平常也不太用, 另外这个`IPP`我发现打开之后CMAKE的时候有个东西老是下载不下来, 所以我也关了.

## Caffe
`install-caffe.sh`这个用来安装[caffe](http://caffe.berkeleyvision.org/), 其实大家看一下caffe源代码里`scripts/trivis/`里面已经写了脚本来安装caffe的依赖项和python依赖, 所以`install-caffe.sh`这个脚本主要负责下载caffe源码然后跑这些脚本.

当然前面帮你装了个OpenBLAS, 这个BLAS库我比较喜欢用, 而且是中国人写的.

最后`scripts/travis/install-python-deps.sh`这个脚本装python依赖的时候用的**pip**包管理器,所以还帮你装了个pip:

    wget https://bootstrap.pypa.io/get-pip.py
    python get-pip.py
    rm get-pip.py


欢迎大家提意见, 使用发现bug请提[issue](https://github.com/zeakey/ez-install/issues).


Best,
[Kai](http://zhaok.xyz/)
