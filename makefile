# define commands to use for compilation
CXX = g++
CFLAGS = -g -w -Wall -Wpedantic -O0

OPENCV_LIB = -lopencv_ml -lopencv_objdetect -lopencv_shape -lopencv_stitching -lopencv_superres -lopencv_videostab -lopencv_calib3d -lopencv_features2d -lopencv_highgui -lopencv_videoio -lopencv_imgcodecs -lopencv_video -lopencv_photo -lopencv_imgproc -lopencv_flann -lopencv_core

# libraries
LIB = -L/usr/local/lib -lserial -L/usr/lib/x86_64-linux-gnu
# -lcgicc

# includes
INC = -I/usr/include -I/usr/local/include #-I/usr/local/include/opencv2 -I/usr/local/include/opencv


alignerd: src/alignerd.cpp
	$(CXX) $(CFLAGS) src/alignerd.cpp $(LIB) $(OPENCV_LIB) -o bin/alignerd

controller: src/controller.cpp
	$(CXX) $(CFLAGS) src/controller.cpp $(LIB) $(OPENCV_LIB) -o bin/controller

controllerd: src/controllerd.cpp
	$(CXX) $(CFLAGS) src/controllerd.cpp $(LIB) $(OPENCV_LIB) -o bin/controllerd

experimentbrowser: src/experimentbrowser.cpp
	$(CXX) $(CFLAGS) src/experimentbrowser.cpp -lcgicc -o bin/experimentbrowser

marker: src/marker.cpp
	$(CXX) $(CFLAGS) src/marker.cpp $(OPENCV_LIB) -lcgicc -o bin/marker

scheduler: src/scheduler.cpp
	$(CXX) $(CFLAGS) src/scheduler.cpp -lcgicc -o bin/scheduler

cgiccretro: src/cgiccretro.cpp
	$(CXX) $(CFLAGS) src/cgiccretro.cpp $(LIB) $(OPENCV_LIB) -lcgicc -o bin/cgiccretro

wormlistupdater: src/wormlistupdater.cpp
	$(CXX) $(CFLAGS) src/wormlistupdater.cpp $(LIB) $(OPENCV_LIB) -lcgicc -o bin/wormlistupdater

all: alignerd controller controllerd experimentbrowser marker scheduler cgiccretro wormlistupdater

clean:
	rm bin/*


%.o: %.cpp
	echo heyo
	cd src
	$(CXX) $(CFLAGS) -c $(INC) $<
