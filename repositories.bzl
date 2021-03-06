"""
Copyright (c) 2019, NVIDIA CORPORATION. All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:
 * Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
 * Neither the name of NVIDIA CORPORATION nor the names of its
   contributors may be used to endorse or promote products derived
   from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS ``AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
"""

load("@com_nvidia_isaac//engine/build:isaac.bzl", "isaac_http_archive", "isaac_new_local_repository", "isaac_new_git_repository")
load('@bazel_tools//tools/build_defs/repo:http.bzl', 'http_archive')

def clean_dep(dep):
    return str(Label(dep))

def unomove_workspace():

    isaac_http_archive(
        name = "com_google_absl",
        sha256 = "c8ba586a9ab12bc4a67bb419fc0d2146200942b072bac95f50490f977b7fb04f",
        strip_prefix = "abseil-cpp-5441bbe1db5d0f2ca24b5b60166367b0966790af",
        urls = ["https://github.com/abseil/abseil-cpp/archive/5441bbe1db5d0f2ca24b5b60166367b0966790af.tar.gz"],
        licenses = ["@com_google_absl//:COPYRIGHT"],
    )

    isaac_new_git_repository(
        name = "my_realsense",
        build_file = clean_dep("//third_party:my_realsense.BUILD"),
        remote = "https://github.com/IntelRealSense/librealsense.git",
        commit = "v2.31.0",
        licenses = ["//:LICENSE"],
    )
    
    isaac_http_archive(
        name = "libusb",
        build_file = clean_dep("//third_party:libusb.BUILD"),
        sha256 = "3500f7b182750cd9ccf9be8b1df998f83df56a39ab264976bdb3307773e16f48",
        url = "https://developer.nvidia.com/isaac/download/third_party/libusb-1-0-22-tar-gz",
        type = "tar.gz",
        strip_prefix = "libusb-1.0.22",
        licenses = ["@libusb//:COPYING"],
    )

    isaac_new_local_repository(
        name = "libudev",
        build_file = clean_dep("//third_party:libudev.BUILD"),
        path = "/lib",
        licenses = ["https://raw.githubusercontent.com/systemd/systemd/master/LICENSE.LGPL2.1"],
    )

    isaac_http_archive(
        name = "libudev_aarch64",
        build_file = clean_dep("//third_party:libudev_aarch64.BUILD"),
        sha256 = "19634360f2b305d4d4ea883650c8bb6f1622d0f129d807274354fe7fc4d4eb33",
        url = "https://developer.nvidia.com/isaac/download/third_party/libudev-aarch64-tar-xz",
        type = "tar.xz",
        licenses = ["https://raw.githubusercontent.com/systemd/systemd/master/LICENSE.LGPL2.1"],
    )

    # # Realsense
    # http_archive(
    #     name="my_realsense",
    #     url="https://github.com/IntelRealSense/librealsense/archive/v2.34.0.tar.gz",
    #     sha256="130e38f759dbe420ef531cf7c1587f50161f4f4de4d3b008f569abd6d404dc23",
    #     build_file="//third_party:my_realsense.BUILD",
    #     strip_prefix="librealsense-2.34.0",
    # )
