package(default_visibility=['//visibility:public'])

load("@rules_foreign_cc//tools/build_defs:cmake.bzl", "cmake_external")

filegroup(
    name="all",
    srcs=glob(["**"]),
    visibility=["//visibility:public"]
)

cmake_external(
    name="my_realsense",
    lib_source="@my_realsense//:all",
    env_vars = {
        "CXXFLAGS":
        "-fno-canonical-system-headers -w -Wno-error" ,
        "CFLAGS":
        "-fno-canonical-system-headers -w -Wno-error" ,
    },
    # defines = [
    #     "RS2_USE_V4L2_BACKEND",
    #     "HWM_OVER_XU",
    # ],
    make_commands=[
        "make -j 24 install",
    ],
    cache_entries={
        "ENABLE_CCACHE": "OFF",
    },
    deps = [
        "@libusb",
    ],
    shared_libraries=[
        # "librealsense2-gl.so",
    # currently, the link is not well supported in cmake_external
    # I have already raised an issue. 
    # the result is that i have to specify the library version in this file
    # xx.so.2.31 instead of xx.so
        "librealsense2.so.2.31"
        # "librealsense2.so.2.34"
    ],
    # binaries=[
    #     "realsense-viewer",
    #     "rs-align",
    #     "rs-align-advanced",
    #     "rs-ar-advanced",
    #     "rs-ar-basic",
    #     "rs-benchmark",
    #     "rs-callback",
    #     "rs-capture",
    #     "rs-color",
    #     "rs-convert",
    #     "rs-data-collect",
    #     "rs-depth",
    #     "rs-depth-quality",
    #     "rs-distance",
    #     "rs-enumerate-devices",
    #     "rs-fw-logger",
    #     "rs-fw-update",
    #     "rs-gl",
    #     "rs-hello-realsense",
    #     "rs-measure",
    #     "rs-motion",
    #     "rs-multicam",
    #     "rs-pointcloud",
    #     "rs-pose",
    #     "rs-pose-and-image",
    #     "rs-pose-predict",
    #     "rs-post-processing",
    #     "rs-record",
    #     "rs-record-playback",
    #     "rs-rosbag-inspector",
    #     "rs-save-to-disk",
    #     "rs-sensor-control",
    #     "rs-software-device",
    #     "rs-terminal",
    #     "rs-tracking-and-depth",
    #     "rs-trajectory"
    # ],
)