## How to Build

For Mac OS X, before you do any coding, you must install command-line utilities (make, gcc, etc.). Install XCode from the Mac app store, then go to XCode, and use "Preferences/Download" to install the command line tools. Most students use a text editor of their choice, and the Terminal to compile the homework on Mac.

On Linux, you need the libjpeg library, which can be obtained by "sudo apt-get install libjpeg62-dev libglew-dev". For Windows and Mac OS X, the starter code contains a precompiled jpeg library. On Intel-based Apple chips, the jpeg library should work as is. On Apple M1/M2/M3 ARM chips, you need to take the following steps to get jpeg library to compile and link:

```
// Do this for Apple ARM chips ONLY. If you don't do it, you will
// get linker errors related to the libjpeg library.
// The below steps are not necessary for Windows, Linux or Intel-based Apple computers.
// Execute these commands only in a directory/path that does not contain any
// spaces, otherwise it might fail.

cd external/jpeg-9a-mac

chmod +x configure
./configure --prefix=$(pwd)

make clean

make
chmod +x install-sh
make install

cd ../../hw1
make
./hw1 heightmap/spiral.jpg
```

Here is a sample sequence of Ubuntu or Mac Terminal Shell commands that get everything compiled. Make sure that the directory/path you are working in does not contain any spaces, otherwise these commands might fail:

> unzip assign1_coreOpenGL_starterCode.zip
> cd hw1
> make
> ./hw1 heightmap/spiral.jpg

If your OpenGL version is too low, try updating your graphics card driver to a more recent version. Nvidia drivers have been supporting OpenGL 3.2 since 2009. On the Mac, OpenGL core profile 3.2 is supported since Mac OS X 10.7.5.

For the Windows platform, we provide the Visual Studio solution/project files in ./src. The files works on VS 2017, 2019 and 2022. This is not tested.

Credits:
- https://odedstein.com/teaching/hs-2024-csci-420/assign1/
