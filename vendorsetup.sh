#
#patch -Np1 < device/sprd/mVados/patch/init.c.patch
export ANDROID_SET_JAVA_HOME=true
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export LC_ALL=C
export ALLOW_MISSING_DEPENDENCIES=true
export TARGET_COMPILE_WITH_MSM_KERNEL=false

add_lunch_combo omni_mVados-eng
