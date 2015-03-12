Pod::Spec.new do |s|
  s.name         = 'RFKit'
  s.version      = '1.5'
  s.summary      = 'Tool kit for daily iOS development.'
  s.homepage     = 'https://github.com/BB9z/RFKit'
  s.license      = { :type => 'MIT', :file => 'LICENSE_RFKit' }
  s.authors      = { 'BB9z' => 'BB9z@me.com' }
  s.social_media_url = 'https://twitter.com/bb9z'
  s.source       = {
    :git => 'https://github.com/BB9z/RFKit.git',
    :branch => 'develop'
  }
  
  s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'

  s.source_files  = 'RFKit.h'
  s.exclude_files = 'UnitTest'

  #s.public_header_files =
  #  '*.h',
  #  'extobjc/*.h',
  #  'category/**/*.h'

  # Resources
  # s.resource  = 'icon.png'
  # s.resources = 'Resources/*.png'
  s.preserve_paths = 'doc'

  s.requires_arc = true
  
  s.default_subspec = 'Default'
  
  s.subspec 'Default' do |ss|
    ss.dependency 'RFKit/Runtime'
    
    ss.source_files = 'RFKitDefaultCategories.h'
    ss.dependency 'RFKit/Category/NSArray'
    ss.dependency 'RFKit/Category/NSBundle'
    # ss.dependency 'RFKit/Category/NSDate'
    # ss.dependency 'RFKit/Category/NSDateFormatter'
    ss.dependency 'RFKit/Category/NSDictionary'
    # ss.dependency 'RFKit/Category/NSFileManager'
    # ss.dependency 'RFKit/Category/NSJSONSerialization'
    # ss.dependency 'RFKit/Category/NSNumberFormatter'
    ss.dependency 'RFKit/Category/NSObject'
    ss.dependency 'RFKit/Category/NSString'
    # ss.dependency 'RFKit/Category/NSURL'
    
    # ss.ios.dependency 'RFKit/Category/NSLayoutConstraint'
    ss.ios.dependency 'RFKit/Category/UIAlertView'
    ss.ios.dependency 'RFKit/Category/UIButton'
    ss.ios.dependency 'RFKit/Category/UIColor'
    ss.ios.dependency 'RFKit/Category/UIDevice'
    ss.ios.dependency 'RFKit/Category/UIImage'
    ss.ios.dependency 'RFKit/Category/UINavigationController'
    ss.ios.dependency 'RFKit/Category/UIResponder'
    # ss.ios.dependency 'RFKit/Category/UIScrollView+RFScrolling'
    # ss.ios.dependency 'RFKit/Category/UISearchBar'
    ss.ios.dependency 'RFKit/Category/UIStoryboard'
    ss.ios.dependency 'RFKit/Category/UITableView'
    # ss.ios.dependency 'RFKit/Category/UIView+RFAnimate'
    ss.ios.dependency 'RFKit/Category/UIView'
    ss.ios.dependency 'RFKit/Category/UIViewController'
    # ss.ios.dependency 'RFKit/Category/UIWebView'
  end
  
  s.subspec 'Runtime' do |ss|
    ss.dependency 'RFKit/dout'
    ss.source_files =
      'RFRuntime.*',
      'RFARC.h',
      'RFDispatch.*',
      'RFFeatureSupport.h',
      'extobjc/*'
  end
  
  s.subspec 'dout' do |ss|
    ss.ios.dependency 'RFKit/Category/UIDevice'
    ss.source_files = 'dout.{h,m}'
  end
  
  s.subspec 'RFGeometry' do |ss|
    ss.source_files = 'RFGeometry.{h,m}'
  end
  
  s.subspec 'Category' do |ss|
    # Foundation
    ss.subspec 'NSArray' do |ssp|
      ssp.source_files = 'category/Foundation/NSArray+*'
    end
    
    ss.subspec 'NSBundle' do |ssp|
      ssp.source_files = 'category/Foundation/NSBundle+*'
    end
    
    ss.subspec 'NSDate' do |ssp|
      ssp.dependency 'RFKit/Runtime'
      ssp.source_files = 'category/Foundation/NSDate+*'
    end
    
    ss.subspec 'NSDateFormatter' do |ssp|
      ssp.source_files = 'category/Foundation/NSDateFormatter+*'
    end
    
    ss.subspec 'NSDictionary' do |ssp|
      ssp.dependency 'RFKit/Category/NSObject'
      ssp.source_files = 'category/Foundation/NSDictionary+*'
    end
    
    ss.subspec 'NSFileManager' do |ssp|
      ssp.dependency 'RFKit/Runtime'
      ssp.source_files = 'category/Foundation/NSFileManager+*'
    end
    
    ss.subspec 'NSJSONSerialization' do |ssp|
      ssp.dependency 'RFKit/Runtime'
      ssp.source_files = 'category/Foundation/NSJSONSerialization+*'
    end
    
    ss.subspec 'NSNumberFormatter' do |ssp|
      ssp.dependency 'RFKit/Runtime'
      ssp.source_files = 'category/Foundation/NSNumberFormatter+*'
    end
    
    ss.subspec 'NSObject' do |ssp|
      ssp.dependency 'RFKit/Runtime'
      ssp.source_files = 'category/Foundation/NSObject+*'
    end
    
    ss.subspec 'NSString' do |ssp|
      ssp.dependency 'RFKit/Runtime'
      ssp.source_files = 'category/Foundation/NSString+*'
    end
    
    ss.subspec 'NSURL' do |ssp|
      ssp.source_files = 'category/Foundation/NSURL+*'
    end
    
    
    # UIKit
    ss.subspec 'NSLayoutConstraint' do |ssp|
      ssp.dependency 'RFKit/Category/UIView'
      ssp.source_files = 'category/UIKit/NSLayoutConstraint+*'
    end
    
    ss.subspec 'UIAlertView' do |ssp|
      ssp.source_files = 'category/UIKit/UIAlertView+*'
    end
    
    ss.subspec 'UIButton' do |ssp|
      ssp.source_files = 'category/UIKit/UIButton+*'
    end
    
    ss.subspec 'UIColor' do |ssp|
      ssp.source_files = 'category/UIKit/UIColor+*'
    end
    
    ss.subspec 'UIDevice' do |ssp|
      ssp.dependency 'RFKit/Runtime'
      ssp.source_files = 'category/UIKit/UIDevice+*'
    end
    
    ss.subspec 'UIImage' do |ssp|
      ssp.dependency 'RFKit/Runtime'
      ssp.source_files = 'category/UIKit/UIImage+*'
    end
    
    ss.subspec 'UINavigationController' do |ssp|
      ssp.dependency 'RFKit/Category/NSArray'
      ssp.source_files = 'category/UIKit/UINavigationController+*'
    end
    
    ss.subspec 'UIResponder' do |ssp|
      ssp.source_files = 'category/UIKit/UIResponder+*'
    end
    
    ss.subspec 'UIScrollView+RFScrolling' do |ssp|
      ssp.source_files = 'category/UIKit/UIScrollView+RFScrolling*'
    end
    
    ss.subspec 'UISearchBar' do |ssp|
      ssp.source_files = 'category/UIKit/UISearchBar+*'
    end
    
    ss.subspec 'UITableView' do |ssp|
      ssp.dependency 'RFKit/Category/UIView+RFAnimate'
      ssp.source_files = 'category/UIKit/UITableView+*'
    end
    
    ss.subspec 'UIView+RFAnimate' do |ssp|
      ssp.dependency 'RFKit/Runtime'
      ssp.source_files = 'category/UIKit/UIView+RFAnimate*'
    end
    
    ss.subspec 'UIView' do |ssp|
      ssp.dependency 'RFKit/RFGeometry'
      ssp.dependency 'RFKit/Category/UIResponder'
      ssp.framework    = 'QuartzCore'
      ssp.source_files = 'category/UIKit/UIView+RFKit*'
    end
    
    ss.subspec 'UIViewController' do |ssp|
      ssp.source_files = 'category/UIKit/UIViewController+*'
    end
    
    ss.subspec 'UIWebView' do |ssp|
      ssp.source_files = 'category/UIKit/UIWebView+*'
    end
  end
  
  s.subspec 'Performance' do |ss|
    ss.dependency 'RFKit/Runtime'
    ss.public_header_files =
      'RFPerformance.h',
      'doutkit/*.h'

    ss.source_files =
      'RFPerformance.{h,m}',
      'doutkit/*.{h,m}'
  end
  
  s.subspec 'UncaughtExceptionHandler' do |ss|
    ss.dependency 'RFKit/Runtime'
    ss.public_header_files = 'external/UncaughtExceptionHandler/*.h'
    ss.source_files = 'external/UncaughtExceptionHandler/*.{h,m}'
  end
end

# http://guides.cocoapods.org/syntax/podspec.html
