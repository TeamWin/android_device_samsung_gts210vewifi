TWRP device tree for Samsung Galaxy Tab S2 9.7 (gts210vewifi)
=====================================

# Informations

This repository contains configuration files for compiling TWRP for the Samsung Galaxy Tab S2 9.7 (gts210vewifi).
You can use the prebuilt kernel or compile it from LineageOS source.

# Device Configuration

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | Quad-core 1.4 GHz Cortex-A53 & Quad-core 1.8 GHz Cortex-A72
Chipset | Qualcomm MSM8976 Snapdragon 652
GPU     | Adreno 510
Memory  | 3 GB RAM
Shipped Android Version | 6.0.1
Storage | 32/64 GB
MicroSD | Up to 256 GB
Battery | Non-removable Li-Ion 5870 mAh battery
Display | 1536 x 2048 pixels (~264 ppi pixel density)
Camera  | Primary: 8 MP
Camera  | Secondary: 2.1 MP

![Samsung Galaxy Tab S2 9.7](http://cdn2.gsmarena.com/vv/pics/samsung/samsung-galaxy-tab-s2-97-2.jpg "Samsung Galaxy Tab S2 9.7")

# How to build

## Initialize TWRP

To begin initializing the TWRP project :
```
$ repo init -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-9.0
```

## Initialize device tree

### Use the default prebuilt kernel

You must add the manifest to retrieve the sources of the device tree :  
`.repo/local_manifests/twrp_samsung_gts210vewifi_android-9.0.xml`
```
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
    <project path="device/samsung/msm8976"
        name="Akipe/android_device_samsung_gts210vewifi"
        revision="android-9.0"
        remote="github"
    />
</manifest>
```

### Build kernel from source

Comment the ***Kernel from prebuilt*** lines and uncomment ***Kernel build from source*** lines from `BoardConfig.mk` and edit the manifest to retrieve the sources of the device tree and the kernel :  
`.repo/local_manifests/twrp_samsung_gts210vewifi_android-9.0.xml`
```
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
    <project path="device/samsung/msm8976"
        name="Akipe/android_device_samsung_gts210vewifi"
        revision="android-9.0"
        remote="github"
    />
    <project path="kernel/samsung/msm8976"
        name="LineageOS/android_kernel_samsung_msm8976"
        revision="lineage-16.0"
        remote="github"
    />
</manifest>
```

## Download and build

Then you have to download all the source codes :
```
$ repo sync
```

You can now compile TWRP :
```
$ source build/envsetup.sh
$ lunch omni_gts210vewifi-userdebug # for users
# Or
$ lunch omni_gts210vewifi-eng # for debug
$ mka -j$(nproc) recoveryimage
```

The image will be available at :  
`/out/target/product/gts210vewifi/recovery.img`

# Sources

- Kernel source from LineageOS :  
https://github.com/LineageOS/android_kernel_samsung_msm8976

- `mkbootimg.mk` from LineageOS/android_hardware_samsung :  
https://github.com/LineageOS/android_hardware_samsung

- Dtbtool from LineageOS/android_system_tools_dtbtool :  
https://github.com/LineageOS/android_system_tools_dtbtool

Inspired by the following devices tree :
- [TeamWin/android_device_coolpad_C106](https://github.com/TeamWin/android_device_coolpad_C106)
- [TeamWin/android_device_leeco_s2](https://github.com/TeamWin/android_device_leeco_s2)
- [oguzbakir/twrp_device_google_gm9pro_sprout](https://github.com/oguzbakir/twrp_device_google_gm9pro_sprout?files=1)
- [rk779/twrp_device_leeco_s2](https://github.com/rk779/twrp_device_leeco_s2)

# Contributor

- [luk1337](https://github.com/luk1337)
- [Akipe](https://github.com/akipe)
- and many others...