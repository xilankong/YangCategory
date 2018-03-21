Pod::Spec.new do |s|
  s.name             = 'YangCategory'
  s.version          = '0.1.0'
  s.summary          = 'A short description of YangCategory.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/xilankong/YangCategory'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'xilankong' => 'young.huang@jfz.com' }
  s.source           = { :git => 'https://github.com/xilankong/YangCategory.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.subspec 'UIKit' do |ss|
    ss.source_files = 'YangCategory/Classes/UIKit/**/*'
  end

  s.subspec 'Foundation' do |ss|
    ss.source_files = 'YangCategory/Classes/Foundation/**/*'
  end

end
