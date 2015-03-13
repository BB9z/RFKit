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
    ss.dependency 'RFKit/RFGeometry'
    
    ss.source_files = 'RFKit.h', 'RFKitDefaultCategories.h'
    ss.dependency 'RFKit/Category/Default'
  end
  
  s.subspec 'ALL' do |ss|
    ss.dependency 'RFKit/Default'
    ss.dependency 'RFKit/Category/All'
    ss.dependency 'RFKit/Performance'
    ss.dependency 'RFKit/UncaughtExceptionHandler'
  end
  
  s.subspec 'Runtime' do |ss|
    ss.source_files =
      'dout.{h,m}',
      'RFRuntime.*',
      'RFARC.h',
      'RFDispatch.*',
      'RFFeatureSupport.h',
      'extobjc/*'
  end
  
  s.subspec 'RFGeometry' do |ss|
    ss.dependency 'RFKit/Runtime'
    ss.source_files = 'RFGeometry.{h,m}'
  end
  
  s.subspec 'Category' do |ss|
    # Set
    ss.subspec 'Default' do |ssp|
      ssp.dependency 'RFKit/Category/NSArray'
      ssp.dependency 'RFKit/Category/NSBundle'
      ssp.dependency 'RFKit/Category/NSDictionary'
      ssp.dependency 'RFKit/Category/NSObject'
      ssp.dependency 'RFKit/Category/NSString'

      ssp.ios.dependency 'RFKit/Category/UIAlertView'
      ssp.ios.dependency 'RFKit/Category/UIButton'
      ssp.ios.dependency 'RFKit/Category/UIColor'
      ssp.ios.dependency 'RFKit/Category/UIDevice'
      ssp.ios.dependency 'RFKit/Category/UIImage'
      ssp.ios.dependency 'RFKit/Category/UINavigationController'
      ssp.ios.dependency 'RFKit/Category/UIResponder'
      ssp.ios.dependency 'RFKit/Category/UIStoryboard'
      ssp.ios.dependency 'RFKit/Category/UITableView'
      ssp.ios.dependency 'RFKit/Category/UIView'
      ssp.ios.dependency 'RFKit/Category/UIViewController'
    end
    
    ss.subspec 'All' do |ssp|
      ssp.dependency 'RFKit/Category/Default'
      
      ssp.dependency 'RFKit/Category/NSDate'
      ssp.dependency 'RFKit/Category/NSDateFormatter'
      ssp.dependency 'RFKit/Category/NSFileManager'
      ssp.dependency 'RFKit/Category/NSJSONSerialization'
      ssp.dependency 'RFKit/Category/NSNumberFormatter'
      ssp.dependency 'RFKit/Category/NSURL'
    
      ssp.ios.dependency 'RFKit/Category/NSLayoutConstraint'
      ssp.ios.dependency 'RFKit/Category/UIScrollView+RFScrolling'
      ssp.ios.dependency 'RFKit/Category/UISearchBar'
      ssp.ios.dependency 'RFKit/Category/UIView+RFAnimate'
      ssp.ios.dependency 'RFKit/Category/UIWebView'
    end
    
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
    
    ss.subspec 'UIStoryboard' do |ssp|
      ssp.source_files = 'category/UIKit/UIStoryboard+*'
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
