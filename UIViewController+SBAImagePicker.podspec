Pod::Spec.new do |s|
  s.name         = "UIViewController+SBAImagePicker"
  s.version      = "1.0"
  s.summary      = "SBAImagePicker is light weight extension of UIViewController. With the help of SBAImagePicker you can now easily capture image from camera or gallery in a simple block based implementation."
  s.homepage     = "https://github.com/shoaib-akhtar/UIViewController-SBAImagePicker"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Shoaib Akhtar" => "shoaib.akhtar1@live.com" }
  s.source       = { :git => "https://github.com/shoaib-akhtar/UIViewController-SBAImagePicker.git", :branch => "master",
                     :tag => s.version.to_s }
  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.source_files = 'Classes/*.{h,m}'
  s.frameworks   = 'Foundation', 'UIKit'
end
