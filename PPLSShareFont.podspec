#
# Be sure to run `pod lib lint PPLSShareFont.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PPLSShareFont'
  s.version          = '0.1.0'
  s.summary          = 'PPLSShareFont 字体共享'
  s.swift_version    = '5.0'
  #
  s.description      = '一个用于iOS应用程序的字体管理库，支持动态注册和使用自定义字体'
  s.homepage         = 'https://github.com/shuaikel/ShareFontLib'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hushuaike' => 'hushuaike@163.com' }
  s.source           = { :git => 'https://github.com/shuaikel/ShareFontLib.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '14.0'

  s.source_files = 'PPLSShareFont/Classes/**/*'
  
   s.resource_bundles = {
     'PPLSShareFont' => ['PPLSShareFont/Assets/**/*']
   }

   # 指定使用 XCFramework
#   s.vendored_frameworks = 'PPLSShareFont.xcframework'
   
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
