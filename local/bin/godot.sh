#!/bin/sh
export LD_LIBRARY_PATH=/opt/mesa-master/x86_64:$LD_LIBRARY_PATH
export LIBGL_DRIVERS_PATH=/opt/mesa-master/x86_64
export EGL_DRIVERS_PATH=/opt/mesa-master/x86_64
export MESA_GLSL_TO_TGSI_NEW_MERGE=1
# export MESA_GLSL_CACHE_DISABLE=1
/mnt/work/software/godot/bin/godot.x11.tools.64 "$@"
