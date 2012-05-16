---
layout: post
title: "elua in fedora"
date: 2012-05-17 00:49
comments: true
categories: 
---

{% blockquote %}
太晚了，先暂时记录下，不准备写的很详细。
{% endblockquote %}

### elua编译环境
这个很简单，参考官方的[教程](http://www.eluaproject.net/doc/v0.8/en_building.html)即可。教程不是fedora的，但是都大同小异。toolchain使用的是官方推荐的版本，下载地址在[这里](https://sourcery.mentor.com/public/gnu_toolchain/arm-none-eabi/arm-2009q3-68-arm-none-eabi.bin)。

扒拉扒拉下载安装完毕后，要记得把toolchain的路径加入到path环境变量。下载最新的elua源码，直接进入就可以使用scons编译了，我是lm3s8962的demo板子，所以直接使用
```
scons cpu=lm3s8962 prog
```
会生成两个文件，一个是elf格式的；另一个是bin档，用来直接写入flash，ok，我们需要的就是这个。

### jlink下载
+ 首先是安装jlink驱动。上网一查，两中方式：其一使用openocd，我参考了好些人说的配置文件，始终有错误，果断放弃。其二是使用segger官方的linux驱动，在[这里](http://www.segger.com/cms/jlink-software.html?step=&file=JLinkLinux_441g&serial=)，选择linux版本即可，其中他会要求你输入序列号，随便写几个数就可以了，别当真：）。 下载后，安装之。插上你的jlink然后运行start文件。

+ 一切顺利的话，会进入jlink的shell，并有如下提示
```
SEGGER J-Link Commander V4.41g ('?' for help)
Compiled Jan 27 2012 19:11:22
DLL version V4.41g, compiled Jan 27 2012 19:11:21
Firmware: J-Link ARM V8 compiled Jan 12 2012 20:43:19
Hardware: V8.00
S/N: 20100214 
Feature(s): RDI,FlashDL,FlashBP,JFlash,GDBFull 
VTarget = 3.274V
Info: TotalIRLen = 4, IRPrint = 0x01
Info: Found Cortex-M3 r1p1, Little endian.
Info: TPIU fitted.
Info:   FPUnit: 6 code (BP) slots and 2 literal slots
Found 1 JTAG device, Total IRLen = 4:
 #0 Id: 0x3BA00477, IRLen: 04, IRPrint: 0x1, CoreSight JTAG-DP (ARM)
Cortex-M3 identified.
JTAG speed: 100 kHz
```
+ 下载bin档。 
```
h	--> hold住cpu
exec device lm3s8962   --> 选择cpu型号
loadbin bin/elua_lua_lm3s8962.bin 0x00  -->下载bin档，0x00为flash的起始位置
r   --> reset 
g   --> go
```

{% blockquote %}
另外记录一个还没解决的问题： 我的usb－> uart线(或者是驱动)貌似有点问题，用screen来terminal总是断断续续的，用minicom直接就没反应。待解决。
{% endblockquote %}

