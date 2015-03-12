Pod::Spec.new do |s|
  s.name         = "RFKit"
  s.version      = "1.4"
  s.summary      = "Tool kit for daily iOS development."
  s.homepage     = "https://github.com/BB9z/RFKit"
  s.license      = { :type => "MIT", :file => "LICENSE_RFKit" }
  s.authors      = { "BB9z" => "BB9z@me.com" }
  s.source       = { :git => "https://github.com/BB9z/RFKit.git", :tag => s.version.to_s }
  
  s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"

  s.source_files  = "RFKit.h"
  s.exclude_files = "UnitTest"

  s.public_header_files =
    '*.h',
    'extobjc/*.h',
    'category/**/*.h'

  # Resources
  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"
  s.preserve_paths = "doc"

  s.requires_arc = true
  
  s.subspec 'performance' do |ss|
    ss.public_header_files =
      'RFPerformance.h',
      'doutkit/*.h'

    ss.source_files =
      'RFPerformance.{h,m}',
      'doutkit/*.{h,m}'
  end
  
  s.subspec 'UncaughtExceptionHandler' do |ss|
    ss.public_header_files = 'external/UncaughtExceptionHandler/*.h'
    ss.source_files = 'external/UncaughtExceptionHandler/*.{h,m}'
  end
end
