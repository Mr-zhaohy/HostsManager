#
# Be sure to run `pod lib lint HostsManager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HostsManager'
  s.version          = '0.1.0'
  s.summary          = 'APP开发地址切换工具'

  s.description      = <<-DESC
    APP开发地址切换工具，可手动输入host，侧滑可进行更多操作.
                       DESC

  s.homepage         = 'https://github.com/Mr-zhaohy'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mr_zhaohy' => 'zhy1@erongdu.com' }
  s.source           = { :git => 'http://git.rd.com/mobility-ios/HostsManager.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'HostsManager/**/*'

  s.frameworks = 'CoreMotion', 'UIKit'
end
