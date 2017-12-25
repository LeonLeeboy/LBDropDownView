
Pod::Spec.new do |s|
  s.name             = 'LBDropDownView'
  s.version          = '1.1.0'
  s.summary          = 'a drop down list'



  s.description      = <<-DESC
                            drop down list tool
                       DESC

  s.homepage         = 'https://github.com/LeonLeeboy/LBDropDownView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'j1103765636@iCloud.com' => '1103765636@qq.com' }
  s.source           = { :git => 'https://github.com/LeonLeeboy/LBDropDownView.git', :tag => s.version.to_s }


  s.ios.deployment_target = '8.0'

  s.source_files = 'LBDropDownView/Classes/**/*'
  

  s.frameworks = 'UIKit', 'Foundation'


end
