
#!/bin/sh

# 项目配置
PROJECT_NAME=PPLSShareFont
framework_name=$PROJECT_NAME
output_path=$HOME/build/XCFramework

# 模拟器和真机的存档位置
simulator_archive_path=$output_path/simulator.xcarchive
iOS_device_archive_path=$output_path/iOS.xcarchive

# 清理并创建输出目录
rm -rf $output_path
mkdir -p $output_path

# 编译真机版本
xcodebuild archive \
    -scheme $framework_name \
    -configuration Release \
    -destination "generic/platform=iOS" \
    -archivePath $iOS_device_archive_path \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
    ENABLE_BITCODE=NO \
    MACH_O_TYPE=staticlib \
    COPY_RESOURCES_FROM_STATIC_FRAMEWORKS=YES

# 编译模拟器版本
xcodebuild archive \
    -scheme $framework_name \
    -configuration Release \
    -destination "generic/platform=iOS Simulator" \
    -archivePath $simulator_archive_path \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
    ENABLE_BITCODE=NO \
    MACH_O_TYPE=staticlib \
    COPY_RESOURCES_FROM_STATIC_FRAMEWORKS=YES

# 创建 XCFramework
xcodebuild -create-xcframework \
    -framework $simulator_archive_path/Products/Library/Frameworks/$framework_name.framework \
    -framework $iOS_device_archive_path/Products/Library/Frameworks/$framework_name.framework \
    -output $output_path/$framework_name.xcframework

# 清理中间文件
rm -rf $simulator_archive_path $iOS_device_archive_path

# 打开输出目录
open $output_path
