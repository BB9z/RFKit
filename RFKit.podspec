Pod::Spec.new do |s|
  s.name         = 'RFKit'
  s.version      = '2.5.0'
  s.summary      = 'Tool kit for daily cocoa development.'
  s.homepage     = 'https://github.com/BB9z/RFKit'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'BB9z' => 'BB9z@me.com' }
  s.source       = {
    :git => 'https://github.com/BB9z/RFKit.git',
    :branch => 'develop'
  }

  TARGET_DEFAULT_IOS   = '8.0'
  TARGET_DEFAULT_MAC   = '10.8'
  TARGET_DEFAULT_TV    = '9.0'
  TARGET_DEFAULT_WATCH = '2.0'

  s.ios.deployment_target  = TARGET_DEFAULT_IOS
  s.osx.deployment_target  = TARGET_DEFAULT_MAC
  s.tvos.deployment_target = TARGET_DEFAULT_TV
  s.watchos.deployment_target = TARGET_DEFAULT_WATCH

  s.exclude_files = 'Test'

  #s.public_header_files =
  #  '*.h',
  #  'extobjc/*.h',
  #  'category/**/*.h'

  # Resources
  # s.resource  = 'icon.png'
  # s.resources = 'Resources/*.png'
  s.preserve_paths = 'doc'

  s.requires_arc = true

  s.pod_target_xcconfig = {
    # These config should only exsists in develop branch.
    'WARNING_CFLAGS'=> [
      '-Weverything',                   # Enable all possiable as we are developing a library.
      '-Wno-gnu-statement-expression',  # Allow ?: expression.
      '-Wno-gnu-conditional-omitted-operand',
      '-Wno-auto-import',               # Still needs old #import for backward compatibility.
      '-Wno-sign-conversion',
      '-Wno-sign-compare',
      '-Wno-double-promotion',
      '-Wno-gnu-zero-variadic-macro-arguments'
    ].join(' ')
  }

  s.default_subspec = 'Default'

  s.subspec 'Default' do |ss|
    ss.dependency 'RFKit/Runtime'
    ss.dependency 'RFKit/RFGeometry'
    ss.dependency 'RFKit/Category/Default'
    ss.source_files = 'RFKit.{h,m}', 'RFKitDefaultCategories.h'
  end

  s.subspec 'ALL' do |ss|
    ss.dependency 'RFKit/Default'
    ss.dependency 'RFKit/Category/All'

    ss.ios.dependency  'RFKit/Performance'
    ss.osx.dependency  'RFKit/Performance'
    ss.tvos.dependency 'RFKit/Performance'
    ss.ios.dependency  'RFKit/doutkit'
    ss.osx.dependency  'RFKit/doutkit'
    ss.tvos.dependency 'RFKit/doutkit'
  end

  s.subspec 'Foundation' do |ss|
    ss.source_files = 'RFFoundation.*'
  end

  s.subspec 'Runtime' do |ss|
    ss.dependency 'RFKit/Foundation'
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
      ssp.dependency 'RFKit/Category/NSError'
      ssp.dependency 'RFKit/Category/NSObject'
      ssp.dependency 'RFKit/Category/NSString'

      ssp.osx.dependency 'RFKit/Category/UIResponder'

      ssp.ios.dependency 'RFKit/Category/UIButton'
      ssp.ios.dependency 'RFKit/Category/UIColor'
      ssp.ios.dependency 'RFKit/Category/UIDevice'
      ssp.ios.dependency 'RFKit/Category/UIImage'
      ssp.ios.dependency 'RFKit/Category/UINavigationController'
      ssp.ios.dependency 'RFKit/Category/UIResponder'
      ssp.ios.dependency 'RFKit/Category/UIStoryboard'
      ssp.ios.dependency 'RFKit/Category/UITableView'
      ssp.ios.dependency 'RFKit/Category/UIView'
      ssp.ios.dependency 'RFKit/Category/UIView+RFAnimate'
      ssp.ios.dependency 'RFKit/Category/UIViewController'

      ssp.tvos.dependency 'RFKit/Category/UIButton'
      ssp.tvos.dependency 'RFKit/Category/UIColor'
      ssp.tvos.dependency 'RFKit/Category/UIDevice'
      ssp.tvos.dependency 'RFKit/Category/UIImage'
      ssp.tvos.dependency 'RFKit/Category/UINavigationController'
      ssp.tvos.dependency 'RFKit/Category/UIResponder'
      ssp.tvos.dependency 'RFKit/Category/UIStoryboard'
      ssp.tvos.dependency 'RFKit/Category/UITableView'
      ssp.tvos.dependency 'RFKit/Category/UIView'
      ssp.tvos.dependency 'RFKit/Category/UIView+RFAnimate'
      ssp.tvos.dependency 'RFKit/Category/UIViewController'

      ssp.watchos.dependency 'RFKit/Category/UIColor'
      ssp.watchos.dependency 'RFKit/Category/UIImage'
    end

    ss.subspec 'All' do |ssp|
      ssp.dependency 'RFKit/Category/Default'

      ssp.dependency 'RFKit/Category/NSDate'
      ssp.dependency 'RFKit/Category/NSDateFormatter'
      ssp.dependency 'RFKit/Category/NSFileManager'
      ssp.dependency 'RFKit/Category/NSJSONSerialization'
      ssp.dependency 'RFKit/Category/NSNumberFormatter'
      ssp.dependency 'RFKit/Category/NSURL'
      
      ssp.ios .dependency 'RFKit/Category/NSLayoutConstraint'
      ssp.tvos.dependency 'RFKit/Category/NSLayoutConstraint'
      ssp.ios .dependency 'RFKit/Category/UIAlertView'
      ssp.ios .dependency 'RFKit/Category/UIPickerView'
      ssp.ios .dependency 'RFKit/Category/UIScrollView+RFScrolling'
      ssp.tvos.dependency 'RFKit/Category/UIScrollView+RFScrolling'
      ssp.ios .dependency 'RFKit/Category/UISearchBar'
      ssp.tvos.dependency 'RFKit/Category/UISearchBar'
      ssp.ios .dependency 'RFKit/Category/UITextField'
      ssp.tvos.dependency 'RFKit/Category/UITextField'
      ssp.ios .dependency 'RFKit/Category/UIViewController+RFInterfaceOrientation'
      ssp.tvos.dependency 'RFKit/Category/UIViewController+RFInterfaceOrientation'
      ssp.ios .dependency 'RFKit/Category/UIWebView'
    end

    # Foundation
    ss.subspec 'NSArray' do |ssp|
      ssp.dependency 'RFKit/Foundation'
      ssp.source_files = 'category/Foundation/NSArray+*'
    end

    ss.subspec 'NSBundle' do |ssp|
      ssp.dependency 'RFKit/Foundation'
      ssp.source_files = 'category/Foundation/NSBundle+*'
    end

    ss.subspec 'NSDate' do |ssp|
      ssp.dependency 'RFKit/Foundation'
      ssp.source_files = 'category/Foundation/NSDate+*'
    end

    ss.subspec 'NSDateFormatter' do |ssp|
      ssp.dependency 'RFKit/Foundation'
      ssp.source_files = 'category/Foundation/NSDateFormatter+*'
    end

    ss.subspec 'NSDictionary' do |ssp|
      ssp.dependency 'RFKit/Foundation'
      ssp.dependency 'RFKit/Category/NSObject'
      ssp.source_files = 'category/Foundation/NSDictionary+*'
    end

    ss.subspec 'NSError' do |ssp|
      ssp.dependency 'RFKit/Foundation'
      ssp.source_files = 'category/Foundation/NSError+*'
    end

    ss.subspec 'NSFileManager' do |ssp|
      ssp.dependency 'RFKit/Foundation'
      ssp.dependency 'RFKit/Runtime'
      ssp.source_files = 'category/Foundation/NSFileManager+*'
    end

    ss.subspec 'NSJSONSerialization' do |ssp|
      ssp.dependency 'RFKit/Foundation'
      ssp.dependency 'RFKit/Runtime'
      ssp.source_files = 'category/Foundation/NSJSONSerialization+*'
    end

    ss.subspec 'NSNumberFormatter' do |ssp|
      ssp.dependency 'RFKit/Foundation'
      ssp.dependency 'RFKit/Runtime'
      ssp.source_files = 'category/Foundation/NSNumberFormatter+*'
    end

    ss.subspec 'NSObject' do |ssp|
      ssp.dependency 'RFKit/Foundation'
      ssp.dependency 'RFKit/Runtime'
      ssp.source_files = 'category/Foundation/NSObject+*'
    end

    ss.subspec 'NSString' do |ssp|
      ssp.dependency 'RFKit/Foundation'
      ssp.dependency 'RFKit/Runtime'
      ssp.source_files = 'category/Foundation/NSString+*'
    end

    ss.subspec 'NSURL' do |ssp|
      ssp.dependency 'RFKit/Foundation'
      ssp.source_files = 'category/Foundation/NSURL+*'
    end


    # UIKit
    ss.subspec 'NSLayoutConstraint' do |ssp|
      # macOS not supported
      ssp.ios.deployment_target = TARGET_DEFAULT_IOS
      ssp.tvos.deployment_target = TARGET_DEFAULT_TV
      ssp.dependency 'RFKit/Foundation'
      ssp.dependency 'RFKit/Category/UIView'
      ssp.source_files = 'category/UIKit/NSLayoutConstraint+*'
    end

    ss.subspec 'UIAlertView' do |ssp|
      ssp.ios.deployment_target = TARGET_DEFAULT_IOS
      ssp.dependency 'RFKit/Foundation'
      ssp.source_files = 'category/UIKit/UIAlertView+*'
    end

    ss.subspec 'UIButton' do |ssp|
      ssp.ios.deployment_target = TARGET_DEFAULT_IOS
      ssp.tvos.deployment_target = TARGET_DEFAULT_TV
      ssp.dependency 'RFKit/Foundation'
      ssp.source_files = 'category/UIKit/UIButton+*'
    end

    ss.subspec 'UIColor' do |ssp|
      ssp.ios.deployment_target = TARGET_DEFAULT_IOS
      ssp.tvos.deployment_target = TARGET_DEFAULT_TV
      ssp.watchos.deployment_target = TARGET_DEFAULT_WATCH
      ssp.dependency 'RFKit/Foundation'
      ssp.source_files = 'category/UIKit/UIColor+*'
    end

    ss.subspec 'UIDevice' do |ssp|
      ssp.ios.deployment_target = TARGET_DEFAULT_IOS
      ssp.tvos.deployment_target = TARGET_DEFAULT_TV
      ssp.dependency 'RFKit/Foundation'
      ssp.dependency 'RFKit/Runtime'
      ssp.source_files = 'category/UIKit/UIDevice+*'
    end

    ss.subspec 'UIImage' do |ssp|
      ssp.ios.deployment_target = TARGET_DEFAULT_IOS
      ssp.tvos.deployment_target = TARGET_DEFAULT_TV
      ssp.watchos.deployment_target = TARGET_DEFAULT_WATCH
      ssp.dependency 'RFKit/Foundation'
      ssp.dependency 'RFKit/RFGeometry'
      ssp.source_files = 'category/UIKit/UIImage+*'
    end

    ss.subspec 'UINavigationController' do |ssp|
      ssp.ios.deployment_target = TARGET_DEFAULT_IOS
      ssp.tvos.deployment_target = TARGET_DEFAULT_TV
      ssp.dependency 'RFKit/Foundation'
      ssp.dependency 'RFKit/Category/NSArray'
      ssp.source_files = 'category/UIKit/UINavigationController+*'
    end

    ss.subspec 'UIPickerView' do |ssp|
      ssp.ios.deployment_target = TARGET_DEFAULT_IOS
      ssp.dependency 'RFKit/Foundation'
      ssp.source_files = 'category/UIKit/UIPickerView+*'
    end

    ss.subspec 'UIResponder' do |ssp|
      ssp.osx.deployment_target = TARGET_DEFAULT_MAC
      ssp.ios.deployment_target = TARGET_DEFAULT_IOS
      ssp.tvos.deployment_target = TARGET_DEFAULT_TV
      ssp.dependency 'RFKit/Foundation'
      ssp.dependency 'RFKit/Runtime'
      ssp.source_files = 'category/UIKit/UIResponder+*'
    end

    ss.subspec 'UIScrollView+RFScrolling' do |ssp|
      ssp.ios.deployment_target = TARGET_DEFAULT_IOS
      ssp.tvos.deployment_target = TARGET_DEFAULT_TV
      ssp.dependency 'RFKit/Foundation'
      ssp.source_files = 'category/UIKit/UIScrollView+RFScrolling*'
    end

    ss.subspec 'UISearchBar' do |ssp|
      ssp.ios.deployment_target = TARGET_DEFAULT_IOS
      ssp.tvos.deployment_target = TARGET_DEFAULT_TV
      ssp.dependency 'RFKit/Foundation'
      ssp.source_files = 'category/UIKit/UISearchBar+*'
    end

    ss.subspec 'UIStoryboard' do |ssp|
      ssp.ios.deployment_target = TARGET_DEFAULT_IOS
      ssp.tvos.deployment_target = TARGET_DEFAULT_TV
      ssp.dependency 'RFKit/Foundation'
      ssp.source_files = 'category/UIKit/UIStoryboard+*'
    end

    ss.subspec 'UITableView' do |ssp|
      ssp.ios.deployment_target = TARGET_DEFAULT_IOS
      ssp.tvos.deployment_target = TARGET_DEFAULT_TV
      ssp.dependency 'RFKit/Foundation'
      ssp.dependency 'RFKit/Category/UIView+RFAnimate'
      ssp.source_files = 'category/UIKit/UITableView+*'
    end

    ss.subspec 'UITextField' do |ssp|
      ssp.ios.deployment_target = TARGET_DEFAULT_IOS
      ssp.tvos.deployment_target = TARGET_DEFAULT_TV
      ssp.dependency 'RFKit/Foundation'
      ssp.source_files = 'category/UIKit/UITextField+*'
    end

    ss.subspec 'UIView+RFAnimate' do |ssp|
      ssp.ios.deployment_target = TARGET_DEFAULT_IOS
      ssp.tvos.deployment_target = TARGET_DEFAULT_TV
      ssp.dependency 'RFKit/Foundation'
      ssp.dependency 'RFKit/Runtime'
      ssp.source_files = 'category/UIKit/UIView+RFAnimate*'
    end

    ss.subspec 'UIView' do |ssp|
      ssp.ios.deployment_target = TARGET_DEFAULT_IOS
      ssp.tvos.deployment_target = TARGET_DEFAULT_TV
      ssp.dependency 'RFKit/Foundation'
      ssp.dependency 'RFKit/RFGeometry'
      ssp.dependency 'RFKit/Category/UIResponder'
      ssp.framework    = 'QuartzCore'
      ssp.source_files = 'category/UIKit/UIView+RFKit*'
    end

    ss.subspec 'UIViewController' do |ssp|
      ssp.ios.deployment_target = TARGET_DEFAULT_IOS
      ssp.tvos.deployment_target = TARGET_DEFAULT_TV
      ssp.dependency 'RFKit/Foundation'
      ssp.source_files = 'category/UIKit/UIViewController+RFKit*'
    end

    ss.subspec 'UIViewController+RFInterfaceOrientation' do |ssp|
      ssp.ios.deployment_target = TARGET_DEFAULT_IOS
      ssp.tvos.deployment_target = TARGET_DEFAULT_TV
      ssp.source_files = 'category/UIKit/UIViewController+RFInterfaceOrientation*'
    end

    ss.subspec 'UIWebView' do |ssp|
      ssp.ios.deployment_target = TARGET_DEFAULT_IOS
      ssp.dependency 'RFKit/Foundation'
      ssp.source_files = 'category/UIKit/UIWebView+*'
    end
  end

  s.subspec 'Performance' do |ss|
    ss.dependency 'RFKit/Runtime'
    ss.source_files = 'RFPerformance.{h,m}'
  end

  s.subspec 'doutkit' do |ss|
    ss.ios.deployment_target = TARGET_DEFAULT_IOS
    ss.osx.deployment_target = TARGET_DEFAULT_MAC
    ss.tvos.deployment_target = TARGET_DEFAULT_TV
    ss.dependency 'RFKit/Runtime'
    ss.dependency 'RFKit/Performance'
    ss.source_files = 'doutkit/*.{h,m}'
  end
end

# http://guides.cocoapods.org/syntax/podspec.html
