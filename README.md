# memory_santi
参考
https://mp.weixin.qq.com/s/0UPoLV3Ltp34yQJy5iUZbA 进行整理，添加了Makefile和 CMakeLists.txt

测试环境：
在本地用centos 8.4 + gcc 11.2 测试

理论上gcc 需要 >= 4.9.2

dnf -y install libasan    # 安装 libasan 依赖库

use gcc 11.2 and libasan to detect kinds of invalid pointer use

# 编译测试：

1. normally you can use make & make test  

2. If you prefer cmake, 
   mkdir build && cd build && cmake .. && make

